#ifndef DOCTORENHANCEMENT_H_
#define DOCTORENHANCEMENT_H_

#include <cstdint>

namespace DoctorEnhancement {

inline std::uint32_t diminishingBuffPower(std::uint32_t power, std::uint64_t threshold, std::uint64_t range) {
	if (power <= threshold)
		return power;

	const std::uint64_t excess = power - threshold;
	return threshold + range * excess / (range + excess);
}

inline std::uint32_t poolBuffPower(std::uint32_t power) {
	return diminishingBuffPower(power, 1200, 800);
}

inline std::uint32_t secondaryBuffPower(std::uint32_t power) {
	return diminishingBuffPower(power, 1000, 500);
}

}

#endif
