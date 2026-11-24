#ifndef PERFORMANCEENHANCEMENT_H_
#define PERFORMANCEENHANCEMENT_H_

#include "server/zone/objects/creature/DoctorEnhancement.h"
#include <algorithm>
#include <cmath>
#include <cstdint>
#include <limits>

namespace PerformanceEnhancement {

inline std::uint32_t rawBuffPower(float strength) {
	const double skill = std::round(static_cast<double>(strength) * 100.0);

	if (skill <= 0)
		return 0;

	return static_cast<std::uint32_t>(std::min(skill * 2405.0 / 100.0,
			static_cast<double>(std::numeric_limits<std::uint32_t>::max())));
}

inline int mindBuffPower(float strength) {
	return DoctorEnhancement::poolBuffPower(rawBuffPower(strength));
}

inline int secondaryBuffPower(float strength) {
	return DoctorEnhancement::secondaryBuffPower(rawBuffPower(strength));
}

}

#endif
