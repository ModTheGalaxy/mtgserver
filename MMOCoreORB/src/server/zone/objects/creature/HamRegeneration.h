#ifndef HAMREGENERATION_H_
#define HAMREGENERATION_H_

#include <algorithm>
#include <cmath>

namespace HamRegeneration {

inline unsigned int tick(int stat, float modifier, bool player) {
	float effectiveStat = static_cast<float>(std::max(0, stat));

	if (player && effectiveStat > 1000.f)
		effectiveStat = 1000.f + (effectiveStat - 1000.f) * 0.5f;

	return std::max(1u, static_cast<unsigned int>(std::ceil(effectiveStat * 13.f / 2100.f * modifier)));
}

}

#endif
