#ifndef JEDIFRSEXPERIENCE_H_
#define JEDIFRSEXPERIENCE_H_

inline int convertJediExperienceToFrs(int jediExperience, int& remainder) {
	int frsExperience = jediExperience / 10;
	remainder += jediExperience % 10;
	frsExperience += remainder / 10;
	remainder %= 10;
	return frsExperience;
}

#endif
