/*
 * LuaShipAgentTest.cpp
 *
 * Created on: 2024/11/1
 * Author: Hakry
 */

#include "gtest/gtest.h"
#include "server/zone/managers/ship/ShipAgentTemplateManager.h"

class LuaShipAgentTest : public ::testing::Test {

public:
	LuaShipAgentTest() {
	}

	~LuaShipAgentTest() {
	}

	void SetUp() {
	}

	void TearDown() {
	}
};

TEST_F(LuaShipAgentTest, LuaShipAgentTemplateTest) {
	ShipAgentTemplateManager::DEBUG_MODE = 1;

	// Verify that all ship agents load
	ASSERT_EQ(ShipAgentTemplateManager::instance()->loadTemplates(), 0);
}