#include "Zone.h"
#include "ZonePacketHandler.h"
#include "ClientCore.h"
#include "client/zone/objects/scene/SceneObject.h"
#include "server/zone/packets/zone/SelectCharacter.h"
#include "server/zone/packets/zone/CmdSceneReady.h"
#include "client/zone/managers/object/ObjectManager.h"
#include "client/zone/managers/objectcontroller/ObjectController.h"
#include "server/zone/packets/charcreation/ClientCreateCharacter.h"

ZonePacketHandler::ZonePacketHandler(const String& s, Zone * z) : Logger(s) {
	zone = z;

	setLogging(true);
	setGlobalLogging(true);
	setLogLevel(static_cast<Logger::LogLevel>(ClientCore::getLogLevel()));
}

void ZonePacketHandler::handleMessage(Message* pack) {
	Locker lock(this);

	sys::uint16 opcount = pack->parseShort();
	sys::uint32 opcode = pack->parseInt();

	switch (opcount) {
	case 01:
		switch (opcode) {
		case 0x43FD1C22: // CmdSceneReady
			handleCmdSceneReady(pack);
			break;
		}
	case 02:
		switch (opcode) {
		}
		break;
	case 03:
		switch (opcode) {

		}
		break;

	case 04:
		switch (opcode) {

		case 0xE00730E5:
			handleClientPermissionsMessage(pack);
			break;

		case 0x56CBDE9E:
			handleUpdateContainmentMessage(pack);
			break;

		case 0x6D2A6413: // chat system message
			handleChatSystemMessage(pack);
			break;
		}
		break;
	case 05:
		switch (opcode) {
		case 0xFE89DDEA: // scene create
			handleSceneObjectCreateMessage(pack);
			break;

		case 0x68A75F0C: // baseline
			handleBaselineMessage(pack);
			break;

		case 0x3C565CED: // instant msg
			handleChatInstantMessageToClient(pack);
			break;

		case 0x80CE5E46: // objc
			handleObjectControllerMessage(pack);
			break;
		}
		break;
	case 8:
		switch (opcode) {
		}
		break;
	case 9:
		switch (opcode) {
		case 0x3AE6DFAE: // cmd start scene
			handleCmdStartScene(pack);
			break;
		}
	break;
	default:
		//error("unhandled operand count" + pack->toString());
		break;
	}
}

void ZonePacketHandler::handleClientPermissionsMessage(Message* pack) {
	info(true) << __FUNCTION__ << " packet#" << zone->getZoneClient()->getPacketCount();

	info(true) << "    canLogin = " << pack->parseByte();
	info(true) << "    canCreateRegularCharacter = " << pack->parseByte();
	info(true) << "    canCreateJediCharacter = " << pack->parseByte();
	info(true) << "    canSkipTutorial = " << pack->parseByte();

	BaseClient* client = (BaseClient*) pack->getClient();

	if (zone->getCharacterID() == 0) {
		client->error() << __FUNCTION__ << ": no character OID set in zone?";
		throw Exception("ClientPermissionsMessage: Zone does not have a character OID");
	} else {
		client->info(true) << __FUNCTION__ << ": Sending SelectCharacter(" << zone->getCharacterID() << ")";

		BaseMessage* selectChar = new SelectCharacter(zone->getCharacterID());
		client->sendPacket(selectChar);
	}
}

void ZonePacketHandler::handleCmdStartScene(Message* pack) {
	info(true) << __FUNCTION__ << " packet#" << zone->getZoneClient()->getPacketCount();

	BaseClient* client = (BaseClient*) pack->getClient();

	uint8 unknown = pack->parseByte();
	uint64 selfPlayerObjectID = pack->parseLong();
	String terrain;
	pack->parseAscii(terrain);

	float x = pack->parseFloat();
	float z = pack->parseFloat();
	float y = pack->parseFloat();

	String race;
	pack->parseAscii(race);

	uint64 galacticTime = pack->parseLong();

	zone->setCharacterID(selfPlayerObjectID);

	BaseMessage* msg = new CmdSceneReady();
	client->sendPacket(msg);

	zone->setSceneStarted();
}

void ZonePacketHandler::handleSceneObjectCreateMessage(Message* pack) {
	BaseClient* client = (BaseClient*) pack->getClient();
	uint64 objectID = pack->parseLong();
	pack->shiftOffset(16);

	float x = pack->parseFloat();
	float z = pack->parseFloat();
	float y = pack->parseFloat();

	uint32 crc = pack->parseInt();

	ObjectManager* objectManager = zone->getObjectManager();
	if (objectManager == nullptr) {
		error("object manager was nullptr");
		return;
	}

	SceneObject* object = objectManager->createObject(crc, objectID);

	if (object == nullptr) {
		client->debug() << "unknown crc 0x" << hex << crc << " received in SceneObjectCreateMessage";
		return;
	}

	object->setClient(zone->getZoneClient());
}

void ZonePacketHandler::handleBaselineMessage(Message* pack) {
	BaseClient* client = (BaseClient*) pack->getClient();

	uint64 oid = pack->parseLong();
	uint32 nametype = pack->parseInt();
	uint8 type = pack->parseByte();

	uint32 size = pack->parseInt();

	uint16 opcount = pack->parseShort();

	SceneObject* object = zone->getObject(oid);

	if (object == nullptr) {
		client->debug("received baseline for null object");
		return;
	}

	Locker objectLocker(object);

	switch (type) {
	case 3:
		object->parseBaseline3(pack);
		break;
	case 6:
		object->parseBaseline6(pack);
		break;
	default:
		break;
	}
}

void ZonePacketHandler::handleChatInstantMessageToClient(Message* pack) {
	BaseClient* client = (BaseClient*) pack->getClient();

	String game, galaxy, name;
	UnicodeString message;

	pack->parseAscii(game);
	pack->parseAscii(galaxy);
	pack->parseAscii(name);
	pack->parseUnicode(message);

	StringBuffer infoMsg;
	infoMsg << "instant message from [" << name << "] : " << message.toString();
	client->info(infoMsg.toString());
}

void ZonePacketHandler::handleChatSystemMessage(Message* pack) {
	info(true) << __FUNCTION__ << " packet#" << zone->getZoneClient()->getPacketCount();

	BaseClient* client = (BaseClient*) pack->getClient();

	uint8 type = pack->parseByte();

	info(true) << "type=" << type;

	UnicodeString message;
	pack->parseUnicode(message);

	StringTokenizer lines(message.toString());
	lines.setDelimeter("\n");

	while (lines.hasMoreTokens()) {
		String line;
		lines.getStringToken(line);
		info(true) << "> " << line;
	}
}

void ZonePacketHandler::handleObjectControllerMessage(Message* pack) {
	uint32 header1 = pack->parseInt();
	uint32 header2 = pack->parseInt();

	uint64 objectID = pack->parseLong();

	pack->parseInt();

	SceneObject* object = zone->getObject(objectID);

	if (object != nullptr) {
		// No object controller handling needed
	}
}

void ZonePacketHandler::handleUpdateContainmentMessage(Message* pack) {
	uint64 obj = pack->parseLong();
	uint64 par = pack->parseLong();

	int type = pack->parseInt();

	SceneObject* object = zone->getObject(obj);
	SceneObject* parent = zone->getObject(par);

	if (object == nullptr)
		return;

	if (par == 0) {
		// remove object from parent
		parent = object->getParent();

		if (parent != nullptr) {
			// No container removal needed
		} else {
			object->setParent(nullptr);
		}

		return;
	} else if (parent == nullptr) {
		return;
	}

	// No container transfer needed
}

void ZonePacketHandler::handleCmdSceneReady(Message* pack) {
	info(true) << __FUNCTION__ << " packet#" << zone->getZoneClient()->getPacketCount();

	zone->setSceneReady();
}
