/*
Copyright (C) 2007 <SWGEmu>
 
This File is part of Core3.
 
This program is free software; you can redistribute 
it and/or modify it under the terms of the GNU Lesser 
General Public License as published by the Free Software
Foundation; either version 2 of the License, 
or (at your option) any later version.
 
This program is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of 
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
See the GNU Lesser General Public License for
more details.
 
You should have received a copy of the GNU Lesser General 
Public License along with this program; if not, write to
the Free Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
 
Linking Engine3 statically or dynamically with other modules 
is making a combined work based on Engine3. 
Thus, the terms and conditions of the GNU Lesser General Public License 
cover the whole combination.
 
In addition, as a special exception, the copyright holders of Engine3 
give you permission to combine Engine3 program with free software 
programs or libraries that are released under the GNU LGPL and with 
code included in the standard release of Core3 under the GNU LGPL 
license (or modified versions of such code, with unchanged license). 
You may copy and distribute such a system following the terms of the 
GNU LGPL for Engine3 and the licenses of the other code concerned, 
provided that you include the source code of that other code when 
and as the GNU LGPL requires distribution of source code.
 
Note that people who make modified versions of Engine3 are not obligated 
to grant this special exception for their modified versions; 
it is their choice whether to do so. The GNU Lesser General Public License 
gives permission to release a modified version without this exception; 
this exception also makes it possible to release a modified version 
which carries forward this exception.
*/

#include "GroupManager.h"

#include "../../ZoneServer.h"

#include "../../../chat/room/ChatRoom.h"

#include "../../packets.h"

#include "../../objects/group/GroupObjectImplementation.h"

#include "../../objects/player/Player.h"
#include "../../objects/group/GroupObject.h"

GroupManager::GroupManager() {
}

void GroupManager::inviteToGroup(Player* leader, Player* player) {
	// Pre: leader locked
	// Post: player invited to leader's group, leader locked
	try {
		player->wlock(leader);
		
		if (leader->isInAGroup()) {
			GroupObject* group = leader->getGroupObject();
			
			if (group->getLeader() != leader) {
				leader->sendSystemMessage("group", "must_be_leader");
				player->unlock();
				return;
			}
		}

		if (player->isInAGroup()) {
			leader->sendSystemMessage("group", "already_grouped", player->getObjectID());
			player->unlock();
			return;
		}
		
		if (player->getGroupInviterID() == leader->getObjectID()) {
			leader->sendSystemMessage("group", "considering_your_group", player->getObjectID());
			player->unlock();
			return;
		} else if (player->getGroupInviterID() != 0) {
			leader->sendSystemMessage("group", "considering_other_group");
			player->unlock();
			return;
		}
		
		player->updateGroupInviterId(leader->getObjectID());	
		player->sendSystemMessage("group", "invite_target", leader->getObjectID());	
		leader->sendSystemMessage("group", "invite_leader", player->getObjectID());

		player->unlock();
	} catch (...) {
		cout << "Exception in GroupManager::inviteToGroup(GroupObject* group, Player* player)\n";
		player->unlock();
	}
}

void GroupManager::joinGroup(Player* player) {
	//Pre: player locked
	//Post: player locked
	uint64 inviterID = player->getGroupInviterID();
	
	ZoneServer* server = player->getZone()->getZoneServer();
	SceneObject* object = server->getObject(inviterID);
	
	if (object == NULL || !object->isPlayer() || object == player)
		return;
			
	Player* inviter = (Player*)object;
	GroupObject* group = NULL;
	
	try {
		inviter->wlock(player);
		
		group = inviter->getGroupObject();
		
		if (group == NULL)
			group = createGroup(inviter);
			
		inviter->unlock();
	} catch (...) {
		cout << "Exception in GroupManager::joinGroup(Player* player)\n";
		inviter->unlock();
	}
	
	try {
		group->wlock(player);
		
		if (group->getGroupSize() == 20) {
			group->unlock();
			player->updateGroupInviterId(0);
			player->sendSystemMessage("group", "full");
			return;
		}
		
		player->info("joining group");
		
		player->acquire();
		
		group->addPlayer(player);
		player->setGroup(group);
		player->updateGroupId(group->getObjectID());
		
		ChatRoom* groupChannel = group->getGroupChannel();
		
		groupChannel->sendTo(player);
		groupChannel->addPlayer(player, false);

		player->updateGroupInviterId(0);
	
		group->unlock();
	} catch (...) {
		group->unlock();
		cout << "Exception in GroupManager::joinGroup(Player* player)\n";
	}
}

GroupObject* GroupManager::createGroup(Player* leader) {
	// Pre: leader locked
	// Post: GroupObject is a new group with leader, leader locked.
	
	ZoneServer* server = leader->getZone()->getZoneServer();
	
	GroupObjectImplementation* groupImpl = new GroupObjectImplementation(server->getNextCreatureID(), leader);
	GroupObject* group = (GroupObject*) groupImpl->deploy();
	
	group->setZone(leader->getZone());
	group->sendTo(leader);

	leader->setGroup(group);
	leader->updateGroupId(group->getObjectID());
	
	if (leader->getGroupInviterID() != 0)
		leader->updateGroupInviterId(0);
		
	return group;
}

void GroupManager::leaveGroup(GroupObject* group, Player* player) {
	// Pre: player locked
	// Post: player locked
	if (group == NULL)
		return;
		
	bool destroyGroup = false;
	
	ChatRoom* groupChannel = group->getGroupChannel();
	groupChannel->removePlayer(player, false);
	groupChannel->sendDestroyTo(player);
	
	ChatRoom* room = groupChannel->getParent();
	room->sendDestroyTo(player);
		
	player->setGroup(NULL);
	player->updateGroupId(0);
	
	player->unlock();	

	try {
		group->wlock();
			
		group->removePlayer(player);
		
		Message* msg = new SceneObjectDestroyMessage(group);
		player->sendMessage(msg);
		
		player->info("leaving group");

		player->release();

		if (group->getGroupSize() < 2) {
			group->disband();
			destroyGroup = true;
		}
		
		group->unlock();
	} catch (...) {
		group->unlock();
		cout << "Exception in ObjectControllerMessage::parseGroupLeave(Player* player, Message* pack)\n";
	}
	
	player->wlock();

	if (destroyGroup)
		delete group;

}

void GroupManager::disbandGroup(GroupObject* group, Player* player) {
	//Pre: player locked
	//Post: player locked
	player->unlock();
	
	try {
		group->wlock();
		
		if (group->getLeader() != player) {
			player->sendSystemMessage("group", "must_be_leader");
			group->unlock();
			player->wlock();
			return;
		}
		
		group->disband();
		
		group->unlock();
	} catch (...) {
		group->unlock();
		cout << "Exception in ObjectController::parseGroupDisband(Player* player, Message* pack)\n";
	}
	
	player->wlock();
	
	delete group;
}

void GroupManager::kickFromGroup(GroupObject* group, Player* player, Player* playerToKick) {
	// Pre: player is locked, group != NULL
	// Post: playerToKick kicked from group
	
	player->unlock();
	
	bool disbanded = false;
			
	try {
		group->wlock();
		
		if (!group->hasMember(playerToKick)) {
			group->unlock();
			player->wlock();
			return;
		}
		
		Player* leader = group->getLeader();
		
		if (player != leader) {
			player->sendSystemMessage("group", "must_be_leader");
			group->unlock();
			player->wlock();
			return;
		}
		
		if (group->getGroupSize() - 1 < 2) {
			group->disband();	
			disbanded = true;
		} else {		
			group->removePlayer(playerToKick);

			playerToKick->info("kikcing from group");

			playerToKick->release();
		}
	
		group->unlock();
		
	} catch (...) {
		cout << "Exception in GroupManager::kickFromGroup(GroupObject* group, Player* player, Player* playerToKick)\n";
		group->unlock();
	}
	
	if (!disbanded) {
		try {
			playerToKick->wlock();
		
			ChatRoom* groupChannel = group->getGroupChannel();
			groupChannel->removePlayer(playerToKick, false);
			groupChannel->sendDestroyTo(playerToKick);
		
			ChatRoom* room = groupChannel->getParent();
			room->sendDestroyTo(playerToKick);
		
			playerToKick->setGroup(NULL);
			playerToKick->updateGroupId(0);
		
			ZoneClient* client = playerToKick->getClient();
			if (client != NULL)	
				group->destroy(client);
			
			playerToKick->unlock();			
		} catch (...) {
			cout << "Exception in GroupManager::kickFromGroup(GroupObject* group, Player* player, Player* playerToKick)\n";
			playerToKick->unlock();
	
		}
	} else
		delete group;
	
	player->wlock();
}

void GroupManager::makeLeader(GroupObject* group, Player* player, Player* newLeader) {
	// Pre: player locked
	// Post: player locked
	player->unlock();
	
	try {
		group->wlock();
		
		if (group->getLeader() != player) {
			player->sendSystemMessage("group", "must_be_leader");
			group->unlock();
			player->wlock();
			return;
		}
		
		if (!group->hasMember(newLeader)) {
			group->unlock();
			player->wlock();
			return;
		}
		
		group->makeLeader(newLeader);
		
		group->unlock();
	} catch (...) {
		group->unlock();
		cout << "Exception in ObjectControllerMessage::parseGroupMakeLeader(Player* player, Message* pack)\n";
	}
	player->wlock();
}
