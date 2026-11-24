#include "server/zone/objects/creature/HamCost.h"
#include "server/zone/objects/creature/HamRegeneration.h"
#include "gtest/gtest.h"
#include <climits>

TEST(HamCostTest, SharedFormulaPreservesLowStatsAndSoftensAfter600) {
	EXPECT_FLOAT_EQ(HamCost::adjustedCost(100.f, 0), 125.f);
	EXPECT_FLOAT_EQ(HamCost::adjustedCost(100.f, 300), 100.f);
	EXPECT_FLOAT_EQ(HamCost::adjustedCost(100.f, 600), 75.f);
	EXPECT_NEAR(HamCost::adjustedCost(100.f, 900), 58.333333f, 0.0001f);
	EXPECT_FLOAT_EQ(HamCost::adjustedCost(100.f, 1200), 50.f);
	EXPECT_FLOAT_EQ(HamCost::adjustedCost(100.f, 1500), 45.f);
	EXPECT_GT(HamCost::adjustedCost(100.f, 1500), HamCost::adjustedCost(100.f, 2100));
	EXPECT_GE(HamCost::adjustedCost(100.f, INT_MAX), 25.f);
	EXPECT_FLOAT_EQ(HamCost::adjustedCost(0.f, 2000), 0.f);
	EXPECT_FLOAT_EQ(HamCost::adjustedCost(1.f, 2000), 1.f);
	EXPECT_LE(HamCost::adjustedCost(7.f, 601), HamCost::adjustedCost(7.f, 600));
	EXPECT_GE(static_cast<int>(HamCost::adjustedCost(7.f, INT_MAX)), 2);
}

TEST(HamCostTest, ResourceAndDotCostsKeepTheirOwnLowStatRates) {
	EXPECT_EQ(HamCost::surveyMindCost(300), 80);
	EXPECT_EQ(HamCost::sampleActionCost(300), 100);
	EXPECT_EQ(HamCost::dotPackMindCost(300), 120);
	EXPECT_EQ(HamCost::surveyMindCost(599), 61);
	EXPECT_EQ(HamCost::sampleActionCost(599), 77);
	EXPECT_EQ(HamCost::dotPackMindCost(599), 91);
	EXPECT_EQ(HamCost::surveyMindCost(600), 60);
	EXPECT_EQ(HamCost::sampleActionCost(600), 76);
	EXPECT_EQ(HamCost::dotPackMindCost(600), 90);
	EXPECT_LE(HamCost::surveyMindCost(601), 60);
	EXPECT_LE(HamCost::sampleActionCost(601), 76);
	EXPECT_LE(HamCost::dotPackMindCost(601), 90);
	EXPECT_GE(HamCost::surveyMindCost(INT_MAX), 25);
	EXPECT_GE(HamCost::sampleActionCost(INT_MAX), 31);
	EXPECT_GE(HamCost::dotPackMindCost(INT_MAX), 38);
	EXPECT_GT(HamCost::surveyMindCost(1500), HamCost::surveyMindCost(3000));
	EXPECT_GT(HamCost::sampleActionCost(1550), HamCost::sampleActionCost(3000));
	EXPECT_GT(HamCost::dotPackMindCost(1500), HamCost::dotPackMindCost(3000));
}

TEST(HamCostTest, FlourishKeepsPositiveFloorEvenWhenLegacyCostIsAlreadyFree) {
	EXPECT_EQ(HamCost::flourishActionCost(0, 3000), 0);
	EXPECT_EQ(HamCost::flourishActionCost(100, 300), 46);
	EXPECT_EQ(HamCost::flourishActionCost(100, 600), 42);
	EXPECT_LE(HamCost::flourishActionCost(100, 601), 42);
	EXPECT_GT(HamCost::flourishActionCost(100, 1500), HamCost::flourishActionCost(100, 3000));
	EXPECT_GE(HamCost::flourishActionCost(100, INT_MAX), 13);
	EXPECT_EQ(HamCost::flourishActionCost(10, 600), 2);
	EXPECT_EQ(HamCost::flourishActionCost(10, 3000), 2);
}

TEST(HamRegenerationTest, PlayerStatsAbove1000GiveHalfRegenBenefit) {
	EXPECT_EQ(HamRegeneration::tick(-100, 1.f, true), 1u);
	EXPECT_EQ(HamRegeneration::tick(300, 1.f, true), 2u);
	EXPECT_EQ(HamRegeneration::tick(1000, 1.f, true), 7u);
	EXPECT_EQ(HamRegeneration::tick(1500, 1.f, true), 8u);
	EXPECT_EQ(HamRegeneration::tick(1907, 1.f, true), 9u);
	EXPECT_EQ(HamRegeneration::tick(1908, 1.f, true), 10u);
	EXPECT_EQ(HamRegeneration::tick(2000, 1.f, true), 10u);
}

TEST(HamRegenerationTest, PreservesTimingPostureAndNonPlayerScaling) {
	EXPECT_EQ(HamRegeneration::tick(1500, 1.25f, true), 10u);
	EXPECT_EQ(HamRegeneration::tick(1500, 1.75f, true), 14u);
	EXPECT_EQ(HamRegeneration::tick(1500, 2.f, true), 16u);
	EXPECT_EQ(HamRegeneration::tick(2000, 1.f, false), 13u);
}
