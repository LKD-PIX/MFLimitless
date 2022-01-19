#if defined MOON_PHASE_LIGHTING && !defined UNIFORM_moonPhase
#define UNIFORM_moonPhase
uniform int moonPhase;
#endif

float CalcNightBrightness() {
	float nightBright = NIGHT_BRIGHTNESS;
	#ifdef MOON_PHASE_LIGHTING
		if (moonPhase == 0) nightBright *= NIGHT_LIGHTING_FULL_MOON;
		else if (!(moonPhase == 4)) nightBright *= NIGHT_LIGHTING_PARTIAL_MOON;
		else nightBright *= NIGHT_LIGHTING_NEW_MOON;
	#endif
	return nightBright;
}
float nightBrightness = CalcNightBrightness();

vec3 lightMorning    = vec3(LIGHT_MR, LIGHT_MG, LIGHT_MB) * LIGHT_MI / 255.0;
vec3 lightDay        = vec3(LIGHT_DR, LIGHT_DG, LIGHT_DB) * LIGHT_DI / 255.0;
vec3 lightEvening    = vec3(LIGHT_ER, LIGHT_EG, LIGHT_EB) * LIGHT_EI / 255.0;
#ifndef ONESEVEN
vec3 lightNight      = vec3(LIGHT_NR, LIGHT_NG, LIGHT_NB) * LIGHT_NI * (vsBrightness*0.125 + 0.80) * 0.4 / 255.0 * nightBrightness;
#else
vec3 lightNight      = (vec3(LIGHT_NR, LIGHT_NG, LIGHT_NB) * LIGHT_NI * 0.195 / 255.0) + vec3(0.37, 0.31, 0.25) * 0.35 ;
#endif

vec3 ambientMorning  = vec3(AMBIENT_MR, AMBIENT_MG, AMBIENT_MB) * AMBIENT_MI * 1.1 / 255.0;
vec3 ambientDay      = vec3(AMBIENT_DR, AMBIENT_DG, AMBIENT_DB) * AMBIENT_DI * 1.1 / 255.0;
vec3 ambientEvening  = vec3(AMBIENT_ER, AMBIENT_EG, AMBIENT_EB) * AMBIENT_EI * 1.1 / 255.0;
vec3 ambientNight    = vec3(AMBIENT_NR, AMBIENT_NG, AMBIENT_NB) * AMBIENT_NI * (vsBrightness*0.20 + 0.70) * 0.495 / 255.0 * nightBrightness;

vec3 weatherCol = vec3(WEATHER_RR, WEATHER_RG, WEATHER_RB) * WEATHER_RI / 255.0;
vec3 weatherIntensity = vec3(WEATHER_RI);

float mefade = 1.0 - clamp(abs(timeAngle - 0.5) * 8.0 - 1.5, 0.0, 1.0);
float dfade = 1.0 - timeBrightness;

vec3 CalcLightColor(vec3 morning, vec3 day, vec3 afternoon, vec3 night, vec3 weatherCol) {
	vec3 me = mix(morning, afternoon, mefade);
	float dfadeModified = dfade * dfade;
	vec3 dayAll = mix(me, day, 1.0 - dfadeModified * dfadeModified);
	vec3 c = mix(night, dayAll, sunVisibility);
	c = mix(c, dot(c, vec3(0.299, 0.587, 0.114)) * weatherCol, rainStrengthS*0.6);
	return c * c;
}

vec3 lightCol   = CalcLightColor(lightMorning,   lightDay,   lightEvening,   lightNight,
								 weatherCol * (vsBrightness*0.1 + 0.9));
vec3 ambientCol = CalcLightColor(ambientMorning, ambientDay, ambientEvening, ambientNight,
								 weatherCol * (vsBrightness*0.1 + 0.9));