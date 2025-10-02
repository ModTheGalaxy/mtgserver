/*
 * ObjectController.h
 *
 *  Created on: Sep 6, 2009
 *      Author: theanswer
 */

#ifndef OBJECTCONTROLLER_H_
#define OBJECTCONTROLLER_H_

#include "system/lang.h"
#include "engine/service/Message.h"

class Zone;
class SceneObject;

class ObjectController {
	Zone* zone;
public:
	ObjectController(Zone* zn);

	inline void setZone(Zone* zon) {
		zone = zon;
	}
};

#endif /* OBJECTCONTROLLER_H_ */
