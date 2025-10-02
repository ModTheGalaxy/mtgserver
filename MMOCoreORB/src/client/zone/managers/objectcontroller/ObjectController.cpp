/*
 * ObjectController.cpp
 *
 *  Created on: Sep 6, 2009
 *      Author: theanswer
 */

#include "ObjectController.h"

#include "client/zone/Zone.h"
#include "client/zone/objects/scene/SceneObject.h"

#include "server/zone/packets/object/ObjectControllerMessage.h"

ObjectController::ObjectController(Zone* zn) {
	zone = zn;
}

