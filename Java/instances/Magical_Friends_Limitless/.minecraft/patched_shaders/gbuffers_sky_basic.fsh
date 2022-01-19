#version 150 core
#define gl_FragData iris_FragData
#define varying in
#define gl_ModelViewProjectionMatrix (gl_ProjectionMatrix * gl_ModelViewMatrix)
#define gl_ModelViewMatrix (iris_ModelViewMat * _iris_internal_translate(iris_ChunkOffset))
#define gl_NormalMatrix mat3(transpose(inverse(gl_ModelViewMatrix)))
#define gl_Color iris_ColorModulator
#define gl_ProjectionMatrix iris_ProjMat
#define gl_FogFragCoord iris_FogFragCoord
uniform mat4 iris_LightmapTextureMatrix;
uniform mat4 iris_TextureMat;
uniform float iris_FogDensity;
uniform float iris_FogStart;
uniform float iris_FogEnd;
uniform vec4 iris_FogColor;

struct iris_FogParameters {
    vec4 color;
    float density;
    float start;
    float end;
    float scale;
};

iris_FogParameters iris_Fog = iris_FogParameters(iris_FogColor, iris_FogDensity, iris_FogStart, iris_FogEnd, 1.0 / (iris_FogEnd - iris_FogStart));

#define gl_Fog iris_Fog
in float iris_FogFragCoord;
uniform mat4 iris_ProjMat;
uniform vec4 iris_ColorModulator;
uniform mat4 iris_ModelViewMat;
uniform vec3 iris_ChunkOffset;
mat4 _iris_internal_translate(vec3 offset) {
    // NB: Column-major order
    return mat4(1.0, 0.0, 0.0, 0.0,
                0.0, 1.0, 0.0, 0.0,
                0.0, 0.0, 1.0, 0.0,
                offset.x, offset.y, offset.z, 1.0);
}
out vec4 iris_FragData[8];
vec4 texture2D(sampler2D sampler, vec2 coord) { return texture(sampler, coord); }
vec4 texture2D(sampler2D sampler, vec2 coord, float bias) { return texture(sampler, coord, bias); }
vec4 texture2DLod(sampler2D sampler, vec2 coord, float lod) { return textureLod(sampler, coord, lod); }
vec4 shadow2D(sampler2DShadow sampler, vec3 coord) { return vec4(texture(sampler, coord)); }
vec4 shadow2DLod(sampler2DShadow sampler, vec3 coord, float lod) { return vec4(textureLod(sampler, coord, lod)); }






























































































































































































































































































































/*
Complementary Shaders by EminGT, based on BSL Shaders by Capt Tatsu
*/

//Common//
/*
Complementary Shaders by EminGT, based on BSL Shaders by Capt Tatsu
*/

/*--------------------------------------------------------------------
         ___ __  __ ____   ___  ____ _____  _    _   _ _____ 
        |_ _|  \/  |  _ \ / _ \|  _ \_   _|/ \  | \ | |_   _|
         | || |\/| | |_) | | | | |_) || | / _ \ |  \| | | |  
         | || |  | |  __/| |_| |  _ < | |/ ___ \| |\  | | |  
        |___|_|  |_|_|    \___/|_| \_\|_/_/   \_\_| \_| |_|  
         .
  -> -> -> EDITING THIS FILE HAS A HIGH CHANCE TO BREAK COMPLEMENTARY
  -> -> -> DO NOT CHANGE ANYTHING UNLESS YOU KNOW WHAT YOU ARE DOING
  -> -> -> DO NOT EXPECT SUPPORT AFTER MODIFYING SHADER FILES
--------------------------------------------------------------------*/

//Shader Options//

//#define COMPATIBILITY_MODE
  
//#define SECRET 0 //[0]

  
//#define GLOWING_ENTITY_FIX
//#define END_PORTAL_REWORK
//#define LIGHTNING_BOLTS_FIX
//#define NIGHT_TWILIGHT_FOREST
  
//#define ENTITY_NORMAL_FIX
  
//#define WRONG_MIPMAP_FIX
//#define FLICKERING_FIX
  
//#define OVERLAY_FIX
  
  
//#define MIN_LIGHT_EVERYWHERE
//#define METALLIC_WORLD
//#define ANAMORPHIC_BLOOM
//#define EXTRA_PARTICLE_EMISSION
//#define WAVING_EVERYTHING
//#define GBUFFER_CODING
//#define SHOW_RAY_TRACING
//#define RANDOM_BLOCKLIGHT
//#define OVERDRAW
  
//#define RAIN_REF_FORCED

  
  
  
//#define DO_WAVING_ON_COMPATIBILITY
  
  
  
  
  

  
  
  
  
  
  
  
  

//#define WATERMARK
  
//#define GRAY_START
//#define BLURRY_START
//#define PARTICLE_VISIBILITY
//#define HAND_BLOOM_REDUCTION
//#define LAVA_VISIBILITY
  
//#define ENTITY_EFFECT
  
//#define SNOW_MODE
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
//#define WATER_TRANSLUCENT_SKY_REF
  
  
//#define WATER_ABSORPTION
  
  
//#define BLACK_OUTLINE
//#define PROMO_OUTLINE
  
  
  
//#define OUTLINE_ON_EVERYTHING

  
  
//#define SPECULAR_SKY_REF
//#define DOUBLE_QUALITY_ROUGH_REF
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

 
//#define NOISY_TEXTURES
//#define EMISSIVE_ORES
//#define EMISSIVE_IRON_ORE
//#define EMISSIVE_COPPER_ORE
  
//#define GLOWING_DEBRIS
//#define EMISSIVE_NETHER_ORES
  
  
  
  
//#define GREEN_SCREEN
//#define BLUE_SCREEN
//#define GLOWING_REDSTONE_BLOCK
//#define GLOWING_LAPIS_BLOCK
//#define ALTERNATIVE_COMMAND_BLOCK

  
//#define DOF_IS_ON
  
  
  
//#define ANAMORPHIC_BLUR
//#define FOV_SCALED_BLUR
//#define CHROMATIC_BLUR
  
  
//#define MOTION_BLUR
  
  
  
  
//#define LENS_FLARE
  
  
//#define SHARPEN 0 //[0 1 2 3 4 5 6 7 8 9 10]
//#define CHROMATIC_ABERRATION 0 //[0 1 2 3 4 5 6 7 8 9 10]
  
//#define VIGNETTE
  
  
  

//#define COLOR_GRADING
  
  
  
  
  
  

  
  
  
  
  
  

  
  
  
  
  
  

  
  
  
  
  
  

  
  
  
  
  

  const float sunPathRotation = -40.0; //[-60.0 -55.0 -50.0 -45.0 -40.0 -35.0 -30.0 -25.0 -20.0 -15.0 -10.0 -5.0 0.0 5.0 10.0 15.0 20.0 25.0 30.0 35.0 40.0 45.0 50.0 55.0 60.0]
  const int shadowMapResolution = 1024; //[256 1024 2048 3072 4096 8192]
  const float shadowDistance = 64.0; //[64.0 80.0 96.0 112.0 128.0 160.0 192.0 224.0 256.0 320.0 384.0 512.0 768.0 1024.0]
  
//#define SHADOW_FILTER
  
  
  
  const float shadowMapBias = 1.0 - 25.6 / shadowDistance;
//#define COLORED_SHADOWS
//#define CLOUD_SHADOW
//#define NO_FOLIAGE_SHADOWS
  
  
  
  
  

  
  
  
  

  
  
  
  

  
  
  
  

  
  
  
  

  
  
  
  

  
  
  
  

  
  
  
  

  
  
  
  

  
//#define MOON_PHASE_LIGHTING
  
  
  

  
  
  
  


//#define COLORED_LIGHT_DEFINE

  
  

  
  
  
  
  
  
  
  
  
  
  

  
  
  
  

  
  
  
  

  
  
  
  

  
  
  
  

  

  
  
  
  

  
  
  
  

  
//#define AURORA
//#define AURORA_BIOME_CHECK
//#define AURORA_FULL_MOON_CHECK
  
//#define RAINBOW
  
  
  
  
//#define ROUND_SUN_MOON
//#define VANILLA_SKYBOX
  
  
  
  
  
  
  

  
  
  
  

  
  
  
  
  
  
  

//#define GALAXIES
  
  
  
  
//#define SUNSET_STARS

  
//#define WATER_DISPLACEMENT
//#define WATER_PARALLAX
  
  
  
  
  
  
  
  
  
  
  

//#define WHITE_WORLD
  
//#define NETHER_SMOKE
  
  
  
//#define FOG2
//#define FOG2_ALTITUDE_MODE
  
  
  
  
  
  
  
  
  
  
  
  
//#define WORLD_CURVATURE
  
  
  
  
  
  
//#define NO_PARTICLES
  
  

//#define VL_CLOUDS_50325

//Define Handling//
  
    
  
    
  

  
    
    
    
    
    
      
    
  
    
    
  
  
  
    
    
    
  

  
    
    
    
    
  

  
    
  

  
    
    
      
      
      
      
      
    
  

  
    
    
  

  
    
  

//Dimension Undefine//
  
    
    
    
  

  
    
    
    
  
  
  
    
    
    
    
  
  
  
    
    
    
  

  
    
    
    
  

  
    
    
    
  

  
    
    
  

  
    
    
    
  

//Shenanigans//
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

//Very Common Variables//
uniform int worldTime;

  
  

  uniform float sunAngle;
  float tAmin      = fract(sunAngle - 0.033333333);
  float tAlin      = tAmin < 0.433333333 ? tAmin * 1.15384615385 : tAmin * 0.882352941176 + 0.117647058824;
  float hA         = tAlin > 0.5 ? 1.0 : 0.0;
  float tAfrc      = fract(tAlin * 2.0);
  float tAfrs      = tAfrc*tAfrc*(3.0-2.0*tAfrc);
  float tAmix      = hA < 0.5 ? 0.3 : -0.1;
  float timeAngle  = (tAfrc * (1.0-tAmix) + tAfrs * tAmix + hA) * 0.5;
  float shadowFade = clamp(1.0 - (abs(abs(sunAngle - 0.5) - 0.25) - 0.23) * 100.0, 0.0, 1.0);

float timeBrightness = max(sin(timeAngle*6.28318530718),0.0);
float moonBrightness = max(sin(timeAngle*(-6.28318530718)),0.0);

//Very Common Functions//
int pow2(int number) {
    return number * number;
}
float pow2(float number) {
    return number * number;
}

float sqrt1(float number) { // Faster sqrt() approximation (that isn't accurate at all) for numbers that are between 0 and 1
    number = 1.0 - number;
    number *= number;
    return 1.0 - number;
}
float sqrt2(float number) {
    number = 1.0 - number;
    number *= number;
    number *= number;
    return 1.0 - number;
}
float sqrt3(float number) {
    number = 1.0 - number;
    number *= number;
    number *= number;
    number *= number;
    return 1.0 - number;
}
float sqrt4(float number) {
    number = 1.0 - number;
    number *= number;
    number *= number;
    number *= number;
    number *= number;
    return 1.0 - number;
}

float sqrt1inv(float number) {
    number = 1.0 - number;
    number *= number;
    return number;
}

float dot2(vec2 vector) {
    return dot(vector, vector);
}
float dot2(vec3 vector) {
    return dot(vector, vector);
}
float dot2(vec4 vector) {
    return dot(vector, vector);
}

float min2(vec2 vector) {
    return min(vector.x, vector.y);
}

float max2(vec2 vector) {
   return max(vector.x, vector.y);
}

//Varyings//
varying float vanillaStars;

varying vec3 upVec, sunVec;

//////////Fragment Shader//////////Fragment Shader//////////Fragment Shader//////////


//Uniforms//
uniform int isEyeInWater;
uniform int worldDay;
uniform int moonPhase;


uniform float isEyeInCave;
uniform float blindFactor;
uniform float frameCounter;
uniform float frameTimeCounter;
uniform float nightVision;
uniform float rainStrength;
uniform float rainStrengthS;
uniform float screenBrightness; 
uniform float viewWidth, viewHeight;
uniform float eyeAltitude;

uniform ivec2 eyeBrightnessSmooth;

uniform vec3 cameraPosition;
uniform vec3 skyColor;
uniform vec3 fogColor;
uniform vec3 moonPosition;

uniform mat4 gbufferModelView;
uniform mat4 gbufferModelViewInverse;
uniform mat4 gbufferProjectionInverse;

uniform sampler2D noisetex;









//Common Variables//

	float modifiedWorldDay = mod(worldDay, 100.0) + 5.0;
	float frametime = (worldTime + modifiedWorldDay * 24000) * 0.05 * 0.75;

	


float eBS = eyeBrightnessSmooth.y / 240.0;
float sunVisibility = clamp(dot( sunVec,upVec) + 0.0625, 0.0, 0.125) * 8.0;
float vsBrightness = clamp(screenBrightness, 0.0, 1.0);

vec3 lightVec = sunVec * (1.0 - 2.0 * float(timeAngle > 0.5325 && timeAngle < 0.9675));

//Common Functions//
float GetLuminance(vec3 color) {
	return dot(color,vec3(0.299, 0.587, 0.114));
}

vec3 RoundSunMoon(vec3 nViewPos, vec3 sunColor, vec3 moonColor, float NdotU, float cosS) {
	float isMoon = float(cosS < 0.0);
	float sun = pow(abs(cosS), 2600.0 * isMoon + 1800.0 * (1 - isMoon));

	if (isMoon > 0.0) {
		if (moonPhase >= 1) {
			float moonPhaseOffset = float(!(moonPhase == 4));
			if (moonPhase > 4) moonPhaseOffset *= -1.0;

			float ang = fract(timeAngle - (0.25 + 0.0035 * moonPhaseOffset));
			ang = (ang + (cos(ang * 3.14159265358979) * -0.5 + 0.5 - ang) / 3.0) * 6.28318530717959;
			vec2 sunRotationData2 = vec2(cos(sunPathRotation * 0.01745329251994), -sin(sunPathRotation * 0.01745329251994));
			vec3 rawSunVec2 = (gbufferModelView * vec4(vec3(-sin(ang), cos(ang) * sunRotationData2) * 2000.0, 1.0)).xyz;
		
			float moonPhaseCosS = dot(nViewPos, normalize(rawSunVec2.xyz));
			moonPhaseCosS = pow(abs(moonPhaseCosS), 750.0);
			sun = mix(sun, 0.0, min(moonPhaseCosS * 2.0, 1.0));
		}
	}

	float horizonFactor = clamp((NdotU+0.0025)*20, 0.0, 1.0);
	sun *= horizonFactor;

	vec3 sunMoonCol = mix(moonColor * (1.0 - sunVisibility), sunColor * sunVisibility, float(cosS > 0.0));

	vec3 finalSunMoon = sun * sunMoonCol * 32.0;
	finalSunMoon = pow(finalSunMoon, vec3(2.0 - min(finalSunMoon.r + finalSunMoon.g + finalSunMoon.b, 1.0)));

	return finalSunMoon;
}

float GetStarNoise(vec2 pos) {
	return fract(sin(dot(pos, vec2(12.9898, 4.1414))) * 43758.54953);
}

vec3 GetGalaxy(vec3 viewPos, float NdotU, float cosS, vec3 lightNight) {
	vec3 wpos = vec3(gbufferModelViewInverse * vec4(viewPos * 70.0, 1.0));
	vec3 planeCoord = wpos / (wpos.y + length(wpos.xz) * 0.5);

	vec3 moonPos = vec3(gbufferModelViewInverse * vec4(- sunVec * 70.0, 1.0));
	vec3 moonCoord = moonPos / (moonPos.y + length(moonPos.xz));
	vec2 wind = vec2(frametime, 0.0);
	vec2 skyCoord = planeCoord.xz - moonCoord.xz;
	skyCoord *= 0.35;

	
		
			float floorStar = 768.0;
			vec2 starCoord = floor(skyCoord * floorStar) / floorStar;
			
			float star = 1.0;
			if (NdotU > 0.0) {
				star -= GetStarNoise(starCoord.xy+0.2);
				star -= GetStarNoise(starCoord.xy+0.3);
				star = pow(max(star, 0.0), 200.0) * 0.5;
			}
		
			
			
			
			
			
			
			
			
				
				
				
				

				
				
				
			
		
	
		
	

	float starDeletionTime = 1.0 - min(timeBrightness * 16.0, 1.0) * 0.15 - sunVisibility * 0.85;
	float starNdotU = pow2(pow2(clamp(NdotU * 3.0, 0.0, 1.0)));
	float starFactor = starNdotU * starDeletionTime;
	star *= starFactor * 32.0 * clamp((eyeAltitude-1.0), 0.0, 1.0) * 1.00;

	vec3 starColor = lightNight * lightNight * 30.0;
	vec3 starImage = starColor * star;

	vec3 result = starImage;
	
		result *= 1.0 - sunVisibility;
	

	
		
			
			
			
			
				
					
					
					
					
						
						
					
				
				
			
			
		
	

	result *= clamp(1.0 - pow(abs(cosS) * 1.002, 100.0), 0.0, 1.0);

	result *= pow2(pow2(1.0 - max(rainStrength, rainStrengthS)));

	return result;
}

float GetCoordDistance(vec2 coord1, vec2 coord2) {
	float dis = sqrt(pow2(coord1.x - coord2.x) + pow2(coord1.y - coord2.y));
	float disM = min(dis * 10.0, 1.0);
	return disM;
}

//Includes//





float CalcNightBrightness() {
	float nightBright = 1.00;
	
		
		
		
	
	return nightBright;
}
float nightBrightness = CalcNightBrightness();

vec3 lightMorning    = vec3(236, 184, 132) * 1.05 / 255.0;
vec3 lightDay        = vec3(180, 172, 164) * 1.40 / 255.0;
vec3 lightEvening    = vec3(236, 180, 132) * 1.05 / 255.0;

vec3 lightNight      = vec3(156, 192, 240) * 0.70 * (vsBrightness*0.125 + 0.80) * 0.4 / 255.0 * nightBrightness;




vec3 ambientMorning  = vec3(212, 196, 228) * 0.25 * 1.1 / 255.0;
vec3 ambientDay      = vec3(156, 188, 228) * 0.40 * 1.1 / 255.0;
vec3 ambientEvening  = vec3(212, 196, 228) * 0.25 * 1.1 / 255.0;
vec3 ambientNight    = vec3(120, 164, 228) * 0.45 * (vsBrightness*0.20 + 0.70) * 0.495 / 255.0 * nightBrightness;

vec3 weatherCol = vec3(168, 196, 255) * 1.60 / 255.0;
vec3 weatherIntensity = vec3(1.60);

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
vec3 sky_ColorSqrt = vec3(136.0, 172.0, 236.0) * 1.10 / 255.0;
vec3 skyColCustom = sky_ColorSqrt * sky_ColorSqrt;

vec3 skyMult = vec3(255, 255, 255) * 1.00 / 255.0;

    vec4 underwaterColor = vec4(pow(fogColor, vec3(0.33, 0.21, 0.26)) * 1.00 * 0.2, 1.0);

    


vec4 waterColorSqrt = vec4(172, 212, 255, 255.0) * 0.50 / 255.0;
vec4 waterColor = waterColorSqrt * waterColorSqrt;

const float waterFog = 64.0;

const float waterAlpha = 0.50;
vec3 endColSqrt = vec3(36, 28, 52) * 2.25 / 255.0;
vec3 endCol = endColSqrt * endColSqrt;
vec3 endOrangeCol = vec3(1.0, 0.25, 0.0);
//Thanks to Jessie for dithering
float Bayer2  (vec2 c) { c = 0.5 * floor(c); return fract(1.5 * fract(c.y) + c.x); }
float Bayer4  (vec2 c) { return 0.25 * Bayer2  (0.5 * c) + Bayer2(c); }
float Bayer8  (vec2 c) { return 0.25 * Bayer4  (0.5 * c) + Bayer2(c); }
float Bayer16 (vec2 c) { return 0.25 * Bayer8  (0.5 * c) + Bayer2(c); }
float Bayer32 (vec2 c) { return 0.25 * Bayer16 (0.5 * c) + Bayer2(c); }
float Bayer64 (vec2 c) { return 0.25 * Bayer32 (0.5 * c) + Bayer2(c); }
float Bayer128(vec2 c) { return 0.25 * Bayer64 (0.5 * c) + Bayer2(c); }
float Bayer256(vec2 c) { return 0.25 * Bayer128(0.5 * c) + Bayer2(c); }











	float CloudNoise(vec2 coord, vec2 wind) {
		float noise = texture2D(noisetex, coord*0.125    + wind * 0.25).x * 7.0;
		noise+= texture2D(noisetex, coord*0.0625   + wind * 0.15).x * 12.0;
		noise+= texture2D(noisetex, coord*0.03125  + wind * 0.05).x * 12.0;
		noise+= texture2D(noisetex, coord*0.015625 + wind * 0.05).x * 24.0;
		return noise * 0.34;
	}

	float CloudCoverage(float noise, float coverage, float NdotU, float cosS) {
		float noiseCoverageCosS = abs(cosS);
		noiseCoverageCosS *= noiseCoverageCosS;
		noiseCoverageCosS *= noiseCoverageCosS;
		float NdotUmult = 0.365;
		
			
			
				
			
			
				
			
			
		
		float noiseCoverage = coverage * coverage + 10.5
								* (1.0 + noiseCoverageCosS * 0.175) 
								* (1.0 + NdotU * NdotUmult * (1.0-rainStrengthS*3.0))
								- 2.5;

		return max(noise - noiseCoverage, 0.0);
	}

	vec4 DrawCloud(vec3 viewPos, float dither, vec3 lightCol, vec3 ambientCol, float NdotU, int sampleCount) {
		float cosS = dot(normalize(viewPos), sunVec);
		
		
			dither = fract(16.0 * frameTimeCounter + dither);
		

		float timeBrightnessS = sqrt1(timeBrightness);
		
		float cloud = 0.0;
		float cloudGradient = 0.0;
		float gradientMix = dither * 0.1667;
		float colorMultiplier = 2.00 * (0.23 + 0.07 * timeBrightnessS);
		float noiseMultiplier = 4.00 * 0.125;
		float scattering = 0.5 * pow(cosS * 0.5 * (2.0 * sunVisibility - 1.0) + 0.5, 6.0);

		float cloudHeightFactor = max(1.07 - 0.001 * eyeAltitude, 0.0);
		cloudHeightFactor *= cloudHeightFactor;
		float cloudHeight = 30.0 * cloudHeightFactor * 0.5;

		
			float skytime = frametime;
		
			
		
		float cloudSpeedFactor = 0.003;
		vec2 wind = vec2(skytime * 1.00 * cloudSpeedFactor, 0.0);
		
			
		

		vec3 cloudColor = vec3(0.0);

		float stretchFactor = 2.5;
		float coordFactor = 0.009375;

		if (NdotU > 0.025) { //duplicate 78634
			vec3 wpos = normalize((gbufferModelViewInverse * vec4(viewPos, 1.0)).xyz);
			for(int i = 0; i < sampleCount; i++) {
				if (cloud > 0.99) break;
				vec2 planeCoord = wpos.xz * ((cloudHeight + (i + dither) * stretchFactor * 6.0 / sampleCount) / wpos.y) * 0.0085;
				vec2 coord = cameraPosition.xz * 0.00025 + planeCoord;
				
				float ang1 = (i + frametime * 0.025) * 2.391;
				float ang2 = ang1 + 2.391;
				coord += mix(vec2(cos(ang1), sin(ang1)), vec2(cos(ang2), sin(ang2)), dither * 0.25 + 0.75) * coordFactor;
				
				float coverage = float(i - 3.0 + dither) * 0.725;
				
				float noise = CloudNoise(coord, wind);
					  noise = CloudCoverage(noise, coverage, NdotU, cosS) * noiseMultiplier;
					  noise = noise / sqrt(noise * noise + 1.0);
				
				cloudGradient = mix(cloudGradient,
									mix(gradientMix * gradientMix, 1.0 - noise, 0.25),
									noise * (1.0 - cloud));
				
				cloud += max(noise - cloud * 0.95, 0.0);
				cloud = mix(cloud, 1.0, rainStrengthS * pow2(noise * noise));
				gradientMix += 0.2 * (6.0 / sampleCount);
			}

			float meFactorP = min((1.0 - min(moonBrightness, 0.6) / 0.6) * 0.115, 0.075);
			vec3 meColor = vec3(0.0);
			if (cosS > 0.0) {
				float meNdotU = 1.0 - NdotU;
				float meFactor = meFactorP * meNdotU * meNdotU * 12.0 * (1.0 - rainStrengthS);
				meColor = mix(lightMorning, lightEvening, mefade);
				meColor *= meColor;
				meColor *= meColor;
				meColor *= meFactor * meFactor * cosS;
			}

            float sunVisibilityM = pow(sunVisibility, 4.0 - meFactorP * 24.0);
            vec3 skyColor2 = skyColor * skyColor;

            vec3 cloudNightColor = ambientCol * 8.0;
            vec3 cloudDayColor = pow(lightCol, vec3(1.5)) * 1.5;
            vec3 cloudUpColor = mix(cloudNightColor, cloudDayColor, sunVisibilityM);
            cloudUpColor *= 1.0 + scattering;
            cloudUpColor += max(meColor, vec3(0.0));

            vec3 cloudDownColor = skyColor2 * 0.225 * sunVisibility * skyMult;

            //duplicate 98765
            vec3 weatherSky = weatherCol * weatherCol;
            weatherSky *= GetLuminance(ambientCol / (weatherSky)) * 1.4;
            weatherSky *= mix(0.30, 0.90, sunVisibility);
            weatherSky = max(weatherSky, skyColor2 * 0.75); // Lightning Sky Color
			weatherSky *= rainStrengthS;
			
            	weatherSky *= 12.5 + scattering * 47.5 * (1.0 + sunVisibility);
			
            	
			
            cloudUpColor = mix(cloudUpColor, weatherSky, rainStrengthS * rainStrengthS);

            cloudColor = mix(cloudDownColor, cloudUpColor, cloudGradient);

			cloud *= pow2(pow2(1.0 - exp(- (10.0 - 8.2 * rainStrengthS) * NdotU))); //duplicate 78634
		}

		return vec4(cloudColor * colorMultiplier, cloud * 0.6);
	}

	
		
			
				  

			
		

		
			
				
			
			
			
			
			

			
				
			
			
				
			

			
				
			
				
			

			

			

			
			
			

			
				
				
					
					

					
						

					
						
						
						
						

						
										
										
										

						
					
					
				
			

			

			
		
	



	
		
	

	
		
		
		
		
			
		
		
		
		
		
		
		
			
		
		
		
		
			
			
			
		
		
		
		

		
	



	
		
	

	
		
			  

		
	

	
		

		
		
		

		
			
		

		
		
		

		
			
		
			
		

		

		

		
		
		
		
		
		

		
		

		
		
			
			
		

		
			
			

			
					

			
				
				
				
				
				

				
				
				

				
			
			
		

		
		
		
		
		
		
		
		
		
		
		
		

		
			
			
		

		
	



	
		
				

		
	

	
		

		
			
		

		
		
		

		
			
		
			
		

		

		

		
		

		
		
			
			

			
					

			
				
				
				
				
				

				
				

				
			
			
		

		
	


vec3 GetSkyColor(vec3 lightCol, float NdotU, vec3 nViewPos, bool isReflection) {
    float timeBrightnessInv = 1.0 - timeBrightness;
    float timeBrightnessInv2 = timeBrightnessInv * timeBrightnessInv;
    float timeBrightnessInv4 = timeBrightnessInv2 * timeBrightnessInv2;
    float timeBrightnessInv8 = timeBrightnessInv4 * timeBrightnessInv4;

    float NdotSp = clamp(dot(nViewPos, sunVec) * 0.5 + 0.5, 0.001, 1.0);
    float NdotS = NdotSp * NdotSp;
    NdotS *= NdotS;

    float absNdotU = abs(NdotU);

    vec3 skyColor2 = skyColor * skyColor;
    vec3 sky = mix(skyColor * 0.6, skyColor2, absNdotU) * (0.5 + 0.5 * sunVisibility) * skyMult;

    
        
    

    float horizon = 1.0 - max(NdotU + 0.1, 0.0) * (1.0 - 0.25 * NdotS * sunVisibility);
    horizon = min(horizon, 0.9);
    horizon *= horizon;
    
    float lightmix = NdotS * max(1.0 - absNdotU * 2.0, 0.0) * 0.5 + horizon + 0.05;
    lightmix *= sunVisibility * (1.0 - rainStrengthS) * timeBrightnessInv8;

    sky *= 2.0 - 0.5 * timeBrightnessInv4;
    sky *= mix(1.00, 1.00, timeBrightnessInv4);
    
    float mult = 0.1 * (1.0 + rainStrengthS) + horizon * (0.3 + 0.1 * sunVisibility);
	
	float meFactorP = min((1.0 - min(moonBrightness, 0.6) / 0.6) * 0.115, 0.075);
    float meNdotU = 1.0 - absNdotU;
    float meFactor = meFactorP * meNdotU * meNdotU * 15.0 * max(timeBrightnessInv4 - rainStrengthS, 0.0);
    vec3 meColor = mix(lightMorning, lightEvening, mefade);
    meColor *= meColor;
    meColor *= meColor;
    meColor *= meFactor * meFactor * NdotS;

    vec3 finalSky = mix(sky * (1.0 - lightmix), lightCol * sqrt(lightCol), lightmix);
    
    vec3 nightSky = ambientNight * ambientNight * (3.25 + 2.25 * max(sqrt1(NdotU), 0.0));
    nightSky *= mix(1.00, 1.0, sunVisibility);
    finalSky += nightSky;

    finalSky *= max(1.0 - length(meColor) * 0.5, 0.0);
    finalSky += meColor * 0.8;
    
	if (isReflection) {
        float invNdotU = max(-NdotU, 0.0);
        float groundFactor = 0.5 * (11.0 * rainStrengthS + 1.0) * (-5.0 * sunVisibility + 6.0);
        float ground = exp(-groundFactor / (invNdotU * 6.0));
        ground = smoothstep(0.0, 1.0, ground);
        mult *= (1.0 - ground);
    }

    //duplicate 98765
    vec3 weatherSky = weatherCol * weatherCol;
    weatherSky *= GetLuminance(ambientCol / (weatherSky)) * 1.4;
    weatherSky *= mix(0.30, 0.90, sunVisibility);
    weatherSky = max(weatherSky, skyColor2 * 0.75); // Lightning Sky Color
	weatherSky *= rainStrengthS;
    finalSky = mix(finalSky, weatherSky, rainStrengthS) * mult;

    finalSky = pow(finalSky, vec3(1.125));

    return finalSky;
}
vec3 SunGlare(vec3 color, vec3 nViewPos, vec3 lightCol) {
	float cosSp = dot(nViewPos, lightVec);
	if (cosSp > 0.0) {
		float cosS = cosSp;
		cosS *= cosS;
		cosS *= cosS;
		cosS *= cosS;
		float visfactor = 0.075;

		float sunGlare = cosS;
		sunGlare = visfactor / (1.0 - (1.0 - visfactor) * sunGlare) - visfactor;
		sunGlare *= cosSp;

		sunGlare *= 0.25 * 1.0 * (1.0 - rainStrengthS);

		float shadowTime = abs(sunVisibility - 0.5) * 2.0;
		shadowTime *= shadowTime;
		sunGlare *= shadowTime * shadowTime;

		vec3 finalSunGlare = lightCol * sunGlare;

		if (isEyeInWater == 1) finalSunGlare *= underwaterColor.rgb * underwaterColor.rgb * 200.0;

		color += finalSunGlare;
	}
	
	return color;
}

//Program//
void irisMain() {
	vec3 albedo = vec3(0.0);

	vec4 screenPos = vec4(gl_FragCoord.xy / vec2(viewWidth, viewHeight), gl_FragCoord.z, 1.0);
	vec4 viewPos = gbufferProjectionInverse * (screenPos * 2.0 - 1.0);
	viewPos /= viewPos.w;

	vec3 nViewPos = normalize(viewPos.xyz);

	float NdotU = dot(nViewPos, upVec);
	
	
		
			float dither = Bayer64(gl_FragCoord.xy);
		
		
			vec4 cloud = DrawCloud(viewPos.xyz * 1000000.0, dither, lightCol, ambientCol, NdotU, 6);
			float cloudMaskR = cloud.a / 0.6;
			if (NdotU > 0.025) cloudMaskR /= pow2(pow2(1.0 - exp(- (10.0 - 8.2 * rainStrengthS) * NdotU))); //duplicate 78634
		
		
		albedo = GetSkyColor(lightCol, NdotU, nViewPos, false);
		
		float cosS = dot(nViewPos, sunVec);

		vec3 galaxy = GetGalaxy(viewPos.xyz, NdotU, cosS, lightNight);
		
			galaxy *= smoothstep(0.0, 1.0, 1.0 - cloudMaskR);
		
		albedo.rgb += galaxy;
		
		
			
			
			
			
			

			
			





















			
				
				

				
			
				
			
			
		

		albedo = SunGlare(albedo, nViewPos, lightCol);
		
		
			
			
				
			
			
		

		
			albedo.rgb = mix(albedo.rgb, cloud.rgb, cloud.a);
		
	

	
		
	

	
		float alpha = 1.0 - vanillaStars;
	
		
			
		
			
		
		
		
	

	
		if (isEyeInWater == 3 && blindFactor == 0) albedo.rgb = vec3(0.1, 0.15, 0.2);
	

	
		albedo.rgb *= 1.0 - isEyeInCave;
	

    /* DRAWBUFFERS:0 */
	gl_FragData[0] = vec4(albedo, alpha);
}



//////////Vertex Shader//////////Vertex Shader//////////Vertex Shader//////////








	

	
		
	
		
	




    
	
	
	
	

	
	
	

	
	
	
	





void main() {
    irisMain();

// alpha test disabled
}
