/*
 * AsteroidObjectImplementation.cpp
 *
 *  Created on: 2025-02-09
 *  Author: Hakry
 */

#include "server/zone/objects/staticobject/AsteroidObject.h"
#include "server/zone/ZoneServer.h"

float AsteroidObjectImplementation::getOutOfRangeDistance(uint64 specialRangeID) {
	return ZoneServer::SPACESTATIONRANGE;
}
