#include "server/zone/objects/creature/DoctorEnhancement.h"
#include "gtest/gtest.h"
#include <cstdint>
#include <limits>

TEST(DoctorEnhancementTest, PoolBuffsRemainUnchangedThrough1200) {
	EXPECT_EQ(DoctorEnhancement::poolBuffPower(0), 0u);
	EXPECT_EQ(DoctorEnhancement::poolBuffPower(1199), 1199u);
	EXPECT_EQ(DoctorEnhancement::poolBuffPower(1200), 1200u);
	EXPECT_EQ(DoctorEnhancement::poolBuffPower(1201), 1200u);
}

TEST(DoctorEnhancementTest, PoolBuffsDiminishAbove1200) {
	EXPECT_EQ(DoctorEnhancement::poolBuffPower(1500), 1418u);
	EXPECT_EQ(DoctorEnhancement::poolBuffPower(1800), 1542u);
	EXPECT_EQ(DoctorEnhancement::poolBuffPower(2405), 1680u);
	EXPECT_EQ(DoctorEnhancement::poolBuffPower(4200), 1831u);
	EXPECT_EQ(DoctorEnhancement::poolBuffPower(std::numeric_limits<std::uint32_t>::max()), 1999u);
}

TEST(DoctorEnhancementTest, SecondaryBuffsDiminishAbove1000) {
	EXPECT_EQ(DoctorEnhancement::secondaryBuffPower(0), 0u);
	EXPECT_EQ(DoctorEnhancement::secondaryBuffPower(999), 999u);
	EXPECT_EQ(DoctorEnhancement::secondaryBuffPower(1000), 1000u);
	EXPECT_EQ(DoctorEnhancement::secondaryBuffPower(1001), 1000u);
	EXPECT_EQ(DoctorEnhancement::secondaryBuffPower(1200), 1142u);
	EXPECT_EQ(DoctorEnhancement::secondaryBuffPower(1600), 1272u);
	EXPECT_EQ(DoctorEnhancement::secondaryBuffPower(2405), 1368u);
	EXPECT_EQ(DoctorEnhancement::secondaryBuffPower(std::numeric_limits<std::uint32_t>::max()), 1499u);
}
