#ifndef HAMCOST_H_
#define HAMCOST_H_

#include <algorithm>
#include <cmath>

namespace HamCost {

// Above 600, preserve the linear curve's slope while approaching a 25% floor.
inline float diminishingCost(float baseCost, float costAt600, float reductionPerPoint, int stat) {
	const float floor = baseCost * 0.25f;
	const float remaining = costAt600 - floor;

	if (remaining <= 0.f)
		return floor;

	return floor + remaining / (1.f + (static_cast<float>(stat) - 600.f) * reductionPerPoint / remaining);
}

inline float adjustedCost(float baseCost, int stat) {
	if (baseCost <= 0.f)
		return 0.f;

	if (stat <= 600) {
		float cost = baseCost - ((static_cast<float>(stat) - 300.f) / 1200.f) * baseCost;
		return std::max(1.f, cost);
	}

	// Callers deduct whole HAM points, so round the floor up before truncation.
	const float minimum = std::max(1.f, std::ceil(baseCost * 0.25f));
	return std::max(minimum, diminishingCost(baseCost, baseCost * 0.75f, baseCost / 1200.f, stat));
}

inline int surveyMindCost(int focus) {
	if (focus <= 600)
		return 100 - static_cast<int>(focus / 15.f);

	return static_cast<int>(std::ceil(diminishingCost(100.f, 60.f, 1.f / 15.f, focus)));
}

inline int sampleActionCost(int quickness) {
	if (quickness <= 600)
		return 124 - static_cast<int>(quickness / 12.5f);

	return static_cast<int>(std::ceil(diminishingCost(124.f, 76.f, 1.f / 12.5f, quickness)));
}

inline int dotPackMindCost(int focus) {
	if (focus <= 600)
		return 150 - 150 * focus / 1500;

	return static_cast<int>(std::ceil(diminishingCost(150.f, 90.f, 0.1f, focus)));
}

inline int flourishActionCost(int actionPointsPerLoop, int quickness) {
	if (actionPointsPerLoop <= 0)
		return 0;

	const float baseCost = actionPointsPerLoop / 2.f;
	const int minimum = static_cast<int>(std::ceil(baseCost * 0.25f));
	const auto legacyCost = [actionPointsPerLoop](int stat) {
		float drain = std::max(0, actionPointsPerLoop - static_cast<int>(stat / 35.f)) / 2.f;
		return static_cast<int>(std::round(drain + 0.05f));
	};

	if (quickness <= 600)
		return std::max(minimum, legacyCost(quickness));

	return static_cast<int>(std::ceil(diminishingCost(baseCost, std::max(minimum, legacyCost(600)), 1.f / 70.f, quickness)));
}

}

#endif
