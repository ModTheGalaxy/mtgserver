#include "server/zone/objects/creature/buffs/PerformanceEnhancement.h"
#include "gtest/gtest.h"

TEST(PerformanceEnhancementTest, ProgressionReachesTargetsAt100Skill) {
	EXPECT_EQ(PerformanceEnhancement::mindBuffPower(0.f), 0);
	EXPECT_EQ(PerformanceEnhancement::mindBuffPower(0.25f), 601);
	EXPECT_EQ(PerformanceEnhancement::secondaryBuffPower(0.25f), 601);
	EXPECT_EQ(PerformanceEnhancement::mindBuffPower(0.5f), 1201);
	EXPECT_EQ(PerformanceEnhancement::secondaryBuffPower(0.5f), 1143);
	EXPECT_EQ(PerformanceEnhancement::mindBuffPower(1.f), 1680);
	EXPECT_EQ(PerformanceEnhancement::secondaryBuffPower(1.f), 1368);
}

TEST(PerformanceEnhancementTest, HigherSkillHasDiminishingReturns) {
	EXPECT_EQ(PerformanceEnhancement::mindBuffPower(1.01f), 1684);
	EXPECT_EQ(PerformanceEnhancement::secondaryBuffPower(1.01f), 1370);
	EXPECT_EQ(PerformanceEnhancement::mindBuffPower(1.25f), 1754);
	EXPECT_EQ(PerformanceEnhancement::secondaryBuffPower(1.25f), 1400);
	EXPECT_EQ(PerformanceEnhancement::mindBuffPower(1.5f), 1800);
	EXPECT_EQ(PerformanceEnhancement::secondaryBuffPower(1.5f), 1419);
	EXPECT_EQ(PerformanceEnhancement::mindBuffPower(100000.f), 1999);
	EXPECT_EQ(PerformanceEnhancement::secondaryBuffPower(100000.f), 1499);
}
