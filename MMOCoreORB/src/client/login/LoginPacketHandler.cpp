/*
 * LoginPacketHandler.cpp
 *
 *  Created on: Sep 4, 2009
 *      Author: theanswer
 */

#include "LoginSession.h"

#include "LoginPacketHandler.h"

#include <bitset>

void LoginPacketHandler::handleMessage(Message* pack) {
	Locker lock(this);

	sys::uint16 opcount = pack->parseShort();
	sys::uint32 opcode = pack->parseInt();

	info(true) << "-------------------- (0x" << hex << opcode << ") --------------------";

	switch (opcount) {
	case 02:
		switch (opcode) {
		case STRING_HASHCODE("EnumerateCharacterId"): // 0x65EA4574 char create success
			handleEnumerateCharacterId(pack);
			pending_packets &= ~0x01;
			break;

		case STRING_HASHCODE("LoginEnumCluster"): // 0xC11C63B9 galaxy list
			handleLoginEnumCluster(pack);
			pending_packets &= ~0x02;
			break;
		}
		break;
	case 03:
		switch (opcode) {
		case STRING_HASHCODE("ErrorMessage"):
			handleErrorMessage(pack);
			pending_packets = 0;
			break;

		case STRING_HASHCODE("LoginClusterStatus"): // 0x3436AEB6 galaxy status with address/port
			handleLoginClusterStatus(pack);
			pending_packets &= ~0x04;
			break;
		}
		break;
	case 04:
		switch (opcode) {
		case STRING_HASHCODE("LoginClientToken"): // 0xAAB296C6 client token
			handleLoginClientToken(pack);
			pending_packets &= ~0x08;
			break;
		}
		break;

	default:
		error() << "Unhandled packet - opcount: " << opcount << " opcode: 0x" << hex << opcode << dec;
		pending_packets = 0;
		break;
	}

	// If we've seen all the packets or errored out signal complete
	if (pending_packets == 0) {
		loginComplete();
	}
}

void LoginPacketHandler::handleErrorMessage(Message* pack) {
	String errorType, errorMessage;

	pack->parseAscii(errorType);
	pack->parseAscii(errorMessage);

	info(true) << "ERROR: " << errorType << " - " << errorMessage ;

	loginSession->signalCompletion();
}

void LoginPacketHandler::handleLoginClientToken(Message* pack) {
	info(true) << __FUNCTION__;

	uint32 sessionLength = pack->parseInt();
	uint32 len = sessionLength - 4;

	String sessionID;
	for (uint32 i = 0; i < len; ++i) {
		char byte = pack->parseByte();
		sessionID += byte;
	}

	uint32 accountID = pack->parseInt();
	uint32 stationID = pack->parseInt();

	String username;
	pack->parseAscii(username);

	loginSession->setAccountID(accountID);
	loginSession->setSessionID(sessionID);

	info(true) << "    Username: " << username ;
	info(true) << "    Account ID: " << accountID ;
	info(true) << "    Session ID: " << sessionID ;
	info(true) << "    Station ID: " << stationID ;
}

void LoginPacketHandler::handleLoginEnumCluster(Message* pack) {
	info(true) << __FUNCTION__;

	uint32 galaxyCount = pack->parseInt();

	for (int i = 0; i < galaxyCount; ++i) {
		uint32 galaxyID = pack->parseInt();

		String galaxyName;
		pack->parseAscii(galaxyName);

		uint32 serverStatus = pack->parseInt();

		// Create Galaxy with ID and name
		auto& galaxy = loginSession->getGalaxy(galaxyID);
		galaxy.setName(galaxyName);

		info(true) << "    Galaxy[" << i << "]: " << galaxy;
	}

	uint32 footer = pack->parseInt();
}

void LoginPacketHandler::handleLoginClusterStatus(Message* pack) {
	info(true) << __FUNCTION__;

	uint32 galaxyCount = pack->parseInt();

	for (int i = 0; i < galaxyCount; ++i) {
		uint32 galaxyID = pack->parseInt();

		String address;
		pack->parseAscii(address);

		uint16 port = pack->parseShort();
		uint16 pingPort = pack->parseShort();

		uint32 population = pack->parseInt();
		uint32 maxCapacity = pack->parseInt();
		uint32 distance = pack->parseInt();
		uint32 status = pack->parseInt();
		uint32 recommended = pack->parseInt();
		uint8 unknown = pack->parseByte();

		auto& galaxy = loginSession->getGalaxy(galaxyID);

		galaxy.setAddress(address);
		galaxy.setPort(port);
		galaxy.setPingPort(pingPort);
		galaxy.setPopulation(population);

		info(true) << "    Galaxy[" << i << "]: " << galaxy;
	}
}

void LoginPacketHandler::handleEnumerateCharacterId(Message* pack) {
	info(true) << __FUNCTION__;

	uint32 characters = pack->parseInt();

	if (loginSession == nullptr)
		return;

	if (characters == 0) {
		info(true) << "** No characters found **" ;
		loginComplete();
		return;
	}

	for (int i = 0; i < characters; ++i) {
		UnicodeString name;
		pack->parseUnicode(name);

		uint32 crc = pack->parseInt();
		uint64 oid = pack->parseLong();
		uint32 galaxy = pack->parseInt();
		uint32 serverStatus = pack->parseInt();

		CharacterListEntry entry;
		entry.setObjectID(oid);
		entry.setGalaxyID(galaxy);
		entry.setFirstName(name.toString());

		loginSession->addCharacter(entry);

		info(true) << "    Character[" << i << "]: " << entry;
	}
}
