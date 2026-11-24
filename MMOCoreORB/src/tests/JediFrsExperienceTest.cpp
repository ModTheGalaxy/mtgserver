#include "server/zone/managers/frs/JediFrsExperience.h"
#include "gtest/gtest.h"
#include <climits>

TEST(JediFrsExperienceTest, CarriesFractionalAwardsAcrossGrants) {
	int remainder = 0;
	EXPECT_EQ(convertJediExperienceToFrs(7, remainder), 0);
	EXPECT_EQ(remainder, 7);
	EXPECT_EQ(convertJediExperienceToFrs(26, remainder), 3);
	EXPECT_EQ(remainder, 3);
	EXPECT_EQ(convertJediExperienceToFrs(7, remainder), 1);
	EXPECT_EQ(remainder, 0);
}

TEST(JediFrsExperienceTest, HandlesLargeAwardsWithoutOverflow) {
	int remainder = 9;
	EXPECT_EQ(convertJediExperienceToFrs(INT_MAX, remainder), 214748365);
	EXPECT_EQ(remainder, 6);
}
