#version 150 core
#define gl_FragData iris_FragData
#define varying in
#define gl_ModelViewProjectionMatrix (gl_ProjectionMatrix * gl_ModelViewMatrix)
#define gl_ModelViewMatrix mat4(1.0)
#define gl_NormalMatrix mat3(1.0)
#define gl_Color vec4(1.0, 1.0, 1.0, 1.0)
#define gl_ProjectionMatrix mat4(vec4(2.0, 0.0, 0.0, 0.0), vec4(0.0, 2.0, 0.0, 0.0), vec4(0.0), vec4(-1.0, -1.0, 0.0, 1.0))
#define gl_FogFragCoord iris_FogFragCoord
#extension  GL_ARB_shader_texture_lod : enable






























































































































































































































































































































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
varying vec2 texCoord;

varying vec3 sunVec, upVec;

//////////Fragment Shader//////////Fragment Shader//////////Fragment Shader//////////


//Uniforms//
uniform int frameCounter;
uniform int isEyeInWater;
uniform int worldDay;

uniform float isEyeInCave;
uniform float blindFactor, nightVision;
uniform float far, near;
uniform float frameTimeCounter;
uniform float rainStrengthS;
uniform float screenBrightness; 
uniform float viewWidth, viewHeight, aspectRatio;
uniform float eyeAltitude;

uniform ivec2 eyeBrightnessSmooth;

uniform vec3 skyColor;
uniform vec3 fogColor;

uniform mat4 gbufferProjection, gbufferPreviousProjection, gbufferProjectionInverse;
uniform mat4 gbufferModelView, gbufferPreviousModelView, gbufferModelViewInverse;
uniform mat4 shadowProjection;
uniform mat4 shadowModelView;

uniform sampler2D colortex0;
uniform sampler2D depthtex0;


uniform sampler2D colortex4;








uniform sampler2D colortex3;



uniform vec3 cameraPosition;

uniform sampler2D colortex6;
uniform sampler2D colortex1;
uniform sampler2D noisetex;



uniform sampler2D colortex8;
uniform sampler2D colortex9;






//Optifine Constants//

const bool colortex0MipmapEnabled = true;


const bool colortex8MipmapEnabled = true;
const bool colortex9Clear = false;


//Common Variables//
float eBS = eyeBrightnessSmooth.y / 240.0;
float sunVisibility = clamp(dot( sunVec,upVec) + 0.0625, 0.0, 0.125) * 8.0;
float vsBrightness = clamp(screenBrightness, 0.0, 1.0);

vec3 lightVec = sunVec * (1.0 - 2.0 * float(timeAngle > 0.5325 && timeAngle < 0.9675));

vec2 aoOffsets[4] = vec2[4](
	vec2( 1.0,  0.0),
	vec2( 0.0,  1.0),
	vec2(-1.0,  0.0),
	vec2( 0.0, -1.0)
);







float modifiedWorldDay = mod(worldDay, 100.0) + 5.0;
float frametime = frameTimeCounter * 0.75;
float cloudtime = (worldTime + modifiedWorldDay * 24000) * 0.05 * 0.75;










//Common Functions//
float GetLuminance(vec3 color) {
	return dot(color,vec3(0.299, 0.587, 0.114));
}

float GetLinearDepth(float depth) {
   return (2.0 * near) / (far + near - depth * (far - near));
}


float GetAmbientOcclusion(float z) {
	float ao = 0.0;
	float tw = 0.0;
	float lz = GetLinearDepth(z);

	
		vec2 halfView = vec2(viewWidth, viewHeight) / 2.0;
		vec2 coord1 = (floor(texCoord * halfView + 1.0)) / halfView;
		vec2 coord2 = texCoord * 0.5;
	
		
		
	
	
	for(int i = 0; i < 4; i++) {
		vec2 offset = aoOffsets[i] / vec2(viewWidth, viewHeight);
		float samplez = GetLinearDepth(texture2D(depthtex0, coord1 + offset * 2.0).r);
		float wg = max(1.0 - 2.0 * far * abs(lz - samplez), 0.0);
		ao += texture2D(colortex4, coord2 + offset).r * wg;
		tw += wg;
	}
	ao /= tw;
	if(tw < 0.0001) ao = texture2D(colortex4, coord2).r;

	float aoStrength = 1.9;

	
		
	
	
	//return pow(texture2D(colortex4, coord2).r, AO_STRENGTH);
	return pow(ao, aoStrength);
}




	
	

	
	

	
	
	
	
	
	
	
	
	



//Includes//






float CalcNightBrightness() {
	float nightBright = 0.85;
	
		
		
		
	
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




vec3 blocklightColSqrt = vec3(0.387, 0.31, 0.247);
vec3 blocklightCol = vec3(0.15, 0.096, 0.061);


    vec4 underwaterColor = vec4(pow(fogColor, vec3(0.33, 0.21, 0.26)) * 1.00 * 0.2, 1.0);

    


vec4 waterColorSqrt = vec4(172, 212, 255, 255.0) * 0.50 / 255.0;
vec4 waterColor = waterColorSqrt * waterColorSqrt;

const float waterFog = 64.0;

const float waterAlpha = 0.50;
//Thanks to Jessie for dithering
float Bayer2  (vec2 c) { c = 0.5 * floor(c); return fract(1.5 * fract(c.y) + c.x); }
float Bayer4  (vec2 c) { return 0.25 * Bayer2  (0.5 * c) + Bayer2(c); }
float Bayer8  (vec2 c) { return 0.25 * Bayer4  (0.5 * c) + Bayer2(c); }
float Bayer16 (vec2 c) { return 0.25 * Bayer8  (0.5 * c) + Bayer2(c); }
float Bayer32 (vec2 c) { return 0.25 * Bayer16 (0.5 * c) + Bayer2(c); }
float Bayer64 (vec2 c) { return 0.25 * Bayer32 (0.5 * c) + Bayer2(c); }
float Bayer128(vec2 c) { return 0.25 * Bayer64 (0.5 * c) + Bayer2(c); }
float Bayer256(vec2 c) { return 0.25 * Bayer128(0.5 * c) + Bayer2(c); }



vec3 ScreenToView(vec3 pos) {
	vec4 iProjDiag = vec4(gbufferProjectionInverse[0].x,
						  gbufferProjectionInverse[1].y,
						  gbufferProjectionInverse[2].zw);
    vec3 p3 = pos * 2.0 - 1.0;
    vec4 viewPos = iProjDiag * p3.xyzz + gbufferProjectionInverse[3];
    return viewPos.xyz / viewPos.w;
}

vec3 ViewToWorld(vec3 pos) {
	return mat3(gbufferModelViewInverse) * pos + gbufferModelViewInverse[3].xyz;
}

vec3 WorldToShadow(vec3 pos) {
	vec3 shadowpos = mat3(shadowModelView) * pos + shadowModelView[3].xyz;
	return (vec3((shadowProjection)[0].x, (shadowProjection)[1].y, shadowProjection[2].z) * (shadowpos) + (shadowProjection)[3].xyz);
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

		
			
		
			float skytime = cloudtime;
		
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



vec3 Fog1(vec3 color, float lWorldPos, float lViewPos, vec3 nViewPos, vec3 extra, float NdotU) {
    
		
			
		
			float fog = lViewPos / far * (1.5/0.90);
		

		fog = 1.0 - exp(-0.1 * pow(fog, 10.0));

		if (fog > 0.0) {
			vec3 artificialFogColor = GetSkyColor(lightCol, NdotU, nViewPos, false);
			artificialFogColor = SunGlare(artificialFogColor, nViewPos, lightCol);
			
				artificialFogColor *= 1.0 - isEyeInCave;
			
			color.rgb = mix(color.rgb, artificialFogColor, fog);
		}
	

    
		
			
		
			
		
        
        
        

		
		
			
		
		
    

    
		
		
		
			
			
				
			
			
		
    

    
		
		

		
		
		
		
			
			
		
			
			
		
		

		
    
	
    
		
		
		
		
		
		
		
		
		
		
    
	
    
		
		

		
			
			
			
		
    
	
	return vec3(color.rgb);
}

vec3 Fog2(vec3 color, float lViewPos, vec3 worldPos) {

    
		
			
			
			
		
		
		//duplicate 307309760
		float fog2 = lViewPos / pow(far, 0.25) * 0.112 * (1.0 + rainStrengthS * 1.00)
					* (1.0 - sunVisibility * 0.25 * (1.0 - rainStrengthS)) / 1.00;
		fog2 = (1.0 - (exp(-50.0 * pow(fog2*0.125, 3.25) * eBS)));
		fog2 *= min(0.30 * (3.0 + rainStrengthS * 3.00 - sunVisibility * 2.0), 1.0);
		
			
			
		
		
		float sunVisibility2 = sunVisibility * sunVisibility;
		float sunVisibility4 = sunVisibility2 * sunVisibility2;
		float sunVisibility8 = sunVisibility4 * sunVisibility4;
		float timeBrightness2 = sqrt1(timeBrightness);
		vec3 fogColor2 = mix(lightCol*0.5, skyColor*skyMult*1.25, timeBrightness2);
		fogColor2 = mix(ambientNight*ambientNight, fogColor2, sunVisibility8);
		if (rainStrengthS > 0.0) {
			float rainStrengthS2 = 1.0 - (1.0 - rainStrengthS) * (1.0 - rainStrengthS);
			vec3 rainFogColor = 1.00 * skyColCustom * (0.01 + 0.05 * sunVisibility8 + 0.1 * timeBrightness2);
            rainFogColor *= mix(0.30, 0.90, sunVisibility);
			fogColor2 = mix(fogColor2, rainFogColor, rainStrengthS2);
		}
		fogColor2 *= 1.00;
		
			fogColor2 *= 1.0 - isEyeInCave;
		

		color.rgb = mix(color.rgb, fogColor2, fog2);
    

    
		
		
		
			
			
			
		
		
		
		
		
    
	
    
		
		
		
		
		
		
		
		
    
	
	return vec3(color.rgb);
}

vec3 WaterFog(vec3 color, float lViewPos, float fogrange) {
    float fog = lViewPos / fogrange;
    fog = 1.0 - exp(-3.0 * fog * fog);
	color *= pow(max(underwaterColor.rgb, vec3(0.1)), vec3(0.5)) * 3.0;
    color = mix(color, 0.8 * pow(underwaterColor.rgb * (1.0 - blindFactor), vec3(2.0)), fog);

	return vec3(color.rgb);
}

vec3 LavaFog(vec3 color, float lViewPos) {
	
		float fog = (lViewPos - gl_Fog.start) * gl_Fog.scale;
		fog *= fog;
		fog = 1.0 - exp(- fog);
		fog = clamp(fog, 0.0, 1.0);
	
		
		
		
			
		
	
		
	color.rgb = mix(color.rgb, vec3(0.6, 0.35, 0.15), fog); //duplicate 792763950
	return vec3(color.rgb);
}

vec3 SnowFog(vec3 color, float lViewPos) {
	float fog = lViewPos * 0.3;
	fog = (1.0 - exp(-4.0 * fog * fog * fog));
	color.rgb = mix(color.rgb, vec3(0.1, 0.15, 0.2), fog);

	return vec3(color.rgb);
}

vec3 BlindFog(vec3 color, float lViewPos) {
	float fog = lViewPos *0.04* (5.0 / blindFactor);
	fog = (1.0 - exp(-6.0 * fog * fog * fog)) * blindFactor;
	color.rgb = mix(color.rgb, vec3(0.0), fog);
	
	return vec3(color.rgb);
}

vec3 startFog(vec3 color, vec3 nViewPos, float lViewPos, vec3 worldPos, vec3 extra, float NdotU) {
	
		if (isEyeInWater == 0) {
			
				
			
			
				color.rgb = Fog1(color.rgb, length(worldPos.xz) * 1.025, lViewPos, nViewPos, extra, NdotU);
			
		}
	
	
	if (blindFactor == 0.0) {
		if (isEyeInWater == 1) color.rgb = WaterFog(color.rgb, lViewPos, waterFog * (1.0 + eBS));
		if (isEyeInWater == 2) color.rgb = LavaFog(color.rgb, lViewPos);
		
			if (isEyeInWater == 3) color.rgb = SnowFog(color.rgb, lViewPos);
		
	} else if (blindFactor > 0.0) color.rgb = BlindFog(color.rgb, lViewPos);
	
	return vec3(color.rgb);
}



							   
							   
							   
							   
							   
							   
							   
							   
							   
							   
							   
							   
							   


	
	

	
	
	

	
		
		
		
		
		
		
	
	
	
	

	

	
		
		
		
		
		
		
	




	
	

	
	
		
		
		              
		
		              
	

	







	
	

	
	
	
	
	
	

	

	
		
		
		
		

		

		
	

	
		
		
	
		
						 
		
	

	
	
	

	
					

	
	
		
		
		
		
		
		
	

	
	
		
	
    
	
		
	
    
    




//Spheremap Transform from https://aras-p.info/texts/CompactNormalStorage.html
vec2 EncodeNormal(vec3 n) {
    float f = sqrt(n.z * 8.0 + 8.0);
    return n.xy / f + 0.5;
}

vec3 DecodeNormal(vec2 enc) {
    vec2 fenc = enc * 4.0 - 2.0;
    float f = dot(fenc,fenc);
    float g = sqrt(1.0 - f / 4.0);
    vec3 n;
    n.xy = fenc * g;
    n.z = 1.0 - f / 2.0;
    return n;
}
vec3 nvec3(vec4 pos) {
    return pos.xyz/pos.w;
}

vec4 nvec4(vec3 pos) {
    return vec4(pos.xyz, 1.0);
}

float cdist(vec2 coord) {
	return max(abs(coord.s-0.5) * 1.95, abs(coord.t-0.5) * 2.0);
}

vec4 Raytrace(sampler2D depthtex, vec3 viewPos, vec3 normal, float dither) {
	vec3 pos = vec3(0.0);
	float dist = 0.0;

	
		dither = fract(dither + frameTimeCounter);
	

	vec3 start = viewPos;
    vec3 vector = reflect(normalize(viewPos), normalize(normal));
    viewPos += vector;
	vec3 tvector = vector;

    int sr = 0;

    for(int i = 0; i < 30; i++) {
        pos = nvec3(gbufferProjection * nvec4(viewPos)) * 0.5 + 0.5;
		if (pos.x < -0.05 || pos.x > 1.05 || pos.y < -0.05 || pos.y > 1.05) break;

		vec3 rfragpos = vec3(pos.xy, texture2D(depthtex,pos.xy).r);
        rfragpos = nvec3(gbufferProjectionInverse * nvec4(rfragpos * 2.0 - 1.0));
		dist = length(start - rfragpos);

        float err = length(viewPos - rfragpos);
		float lVector = length(vector);
		if (lVector > 1.0) lVector = pow(lVector, 1.14);
		if (err < lVector) {
                sr++;
                if(sr >= 6) break;
				tvector -= vector;
                vector *= 0.1;
		}
        vector *= 2.0;
        tvector += vector * (dither * 0.05 + 1.0);
		viewPos = start + tvector;
    }

	return vec4(pos, dist);
}
vec3 GetN(int idx) {
    if (idx == 230) return vec3(2.9114, 2.9497, 2.5845);
    if (idx == 231) return vec3(0.18299, 0.42108, 1.3734);
    if (idx == 232) return vec3(1.3456, 0.96521, 0.61722);
    if (idx == 233) return vec3(3.1071, 3.1812, 2.3230);
    if (idx == 234) return vec3(0.27105, 0.67693, 1.3164);
    if (idx == 235) return vec3(1.9100, 1.8300, 1.4400);
    if (idx == 236) return vec3(2.3757, 2.0847, 1.8453);
    if (idx == 237) return vec3(0.15943, 0.14512, 0.13547);
    return vec3(0.0);
}

vec3 GetK(int idx) {
    if (idx == 230) return vec3(3.0893, 2.9318, 2.7670);
    if (idx == 231) return vec3(3.4242, 2.3459, 1.7704);
    if (idx == 232) return vec3(7.4746, 6.3995, 5.3031);
    if (idx == 233) return vec3(3.3314, 3.3291, 3.1350);
    if (idx == 234) return vec3(3.6092, 2.6248, 2.2921);
    if (idx == 235) return vec3(3.5100, 3.4000, 3.1800);
    if (idx == 236) return vec3(4.2655, 3.7153, 3.1365);
    if (idx == 237) return vec3(3.9291, 3.1900, 2.3808);
    return vec3(1.0);
}

vec3 ComplexFresnel(float fresnel, float f0) {
    int metalidx = int(f0 * 255.0);
    vec3 k = GetK(metalidx);
    vec3 n = GetN(metalidx);
    float invFresnel = 1.0 - fresnel;

    vec3 k2 = k * k;
    vec3 n2 = n * n;
    float invFresnel2 = invFresnel * invFresnel;

    vec3 rs_num = n2 + k2 - 2 * n * invFresnel + invFresnel2;
    vec3 rs_den = n2 + k2 + 2 * n * invFresnel + invFresnel2;
    vec3 rs = rs_num / rs_den;
     
    vec3 rp_num = (n2 + k2) * invFresnel2 - 2 * n * invFresnel + 1;
    vec3 rp_den = (n2 + k2) * invFresnel2 + 2 * n * invFresnel + 1;
    vec3 rp = rp_num / rp_den;
    
    vec3 fresnel3 = clamp(0.5 * (rs + rp), vec3(0.0), vec3(1.0));
    fresnel3 *= fresnel3;

    return fresnel3;
}
void GetMaterials(out float smoothness, out float metalness, out float f0, 
                  out vec3 normal, out vec3 rawAlbedo, vec2 coord) {
    vec2 specularData = texture2D(colortex3, coord).rg;

	smoothness = specularData.r;

	
		if (smoothness < 0.5) {
			smoothness /= 0.5;
			f0 = 1.0;
		}
		else {
			smoothness = (smoothness - 0.5) / 0.5;
			f0 = 4.0;
		}
		metalness = specularData.g;
	
		
			
			
		
			
			
		
	

	normal = DecodeNormal(texture2D(colortex6, coord).xy);

	rawAlbedo = texture2D(colortex1, coord).rgb;
}
vec4 RoughReflection(vec3 viewPos, vec3 normal, float dither, float smoothness) {
    vec4 color = vec4(0.0);

    vec4 pos = Raytrace(depthtex0, viewPos, normal, dither);
	float border = clamp(1.0 - pow(cdist(pos.st), 50.0), 0.0, 1.0);
	
	if (pos.z < 1.0 - 1e-5) {
		
			float dist = 1.0 - exp(-0.125 * (1.0 - smoothness) * pos.a);
			float lod = log2(viewHeight / 8.0 * (1.0 - smoothness) * dist) * 0.35;
		
			
		

		float check = float(texture2DLod(depthtex0, pos.st, 0.0).r < 1.0 - 1e-5);
		if (lod < 1.0) {
			color.a = check;
			if (color.a > 0.1) color.rgb = texture2DLod(colortex0, pos.st, 0.0).rgb;
		} else {
			float alpha = check;
			if (alpha > 0.1) {
				color.rgb += texture2DLod(colortex0, pos.st, max(lod - 1.0, 0.0)).rgb;
				color.a += alpha;
			}
		}
		
		color *= color.a;
		color.a *= border;
	}
	color.rgb *= 1.8 * (1.0 - 0.065 * min(length(color.rgb), 10.0));
	
    return color;
}


//Program//
void main() {
    vec4 color = texture2D(colortex0, texCoord);
	float z    = texture2D(depthtex0, texCoord).r;

	
		vec3 lightAlbedo = texture2DLod(colortex8, texCoord, log2(viewHeight)).rgb;
		vec3 lightBuffer = texture2D(colortex9, texCoord).rgb;
	

	float dither = Bayer64(gl_FragCoord.xy);
	
	vec4 screenPos = vec4(texCoord, z, 1.0);
	vec4 viewPos = gbufferProjectionInverse * (screenPos * 2.0 - 1.0);
	viewPos /= viewPos.w;

	
		
	
	
		
		
		
		
		
		
	

	if (z < 1.0) {
		
			float skymapMod = texture2D(colortex3, texCoord).b;
			// skymapMod = 1.0            = Glowing Status Effect
			// skymapMod = 0.995          = Versatile Selection Outline
			// skymapMod = 0.515 ... 0.99 = Cauldron
			// skymapMod = 0.51           = No SSAO
			// skymapMod = 0.0   ... 0.5  = Rain Puddles
			// skymapMod = 0.0   ... 0.1  = Specular Sky Reflections
		

		vec3 nViewPos = normalize(viewPos.xyz);
		float NdotU = dot(nViewPos, upVec);
		float lViewPos = length(viewPos.xyz);
		vec3 worldPos = ViewToWorld(viewPos.xyz);
	
		
			float ao = clamp(GetAmbientOcclusion(z), 0.0, 1.0);
			float ambientOcclusion = ao;
		

		
			
				
			
		

		
			float smoothness = 0.0, metalness = 0.0, f0 = 0.0;
			vec3 normal = vec3(0.0), rawAlbedo = vec3(0.0);

			GetMaterials(smoothness, metalness, f0, normal, rawAlbedo, texCoord);

			float smoothnessP = smoothness;
			smoothness *= smoothness;
			
			float fresnel = pow(clamp(1.0 + dot(normal, nViewPos), 0.0, 1.0), 5.0);
			vec3 fresnel3 = vec3(0.0);

			rawAlbedo *= 5.0;
			float fresnelFactor = 0.25;

			
				if (f0 > 1.1) {
					fresnel = fresnel * 0.8 + 0.2;
					fresnelFactor *= 1.5;
				}
				fresnel3 = mix(mix(vec3(0.02), rawAlbedo, metalness), vec3(1.0), fresnel);
				if (metalness <= 0.004 && metalness > 0.0 && skymapMod == 0.0) fresnel3 = vec3(0.0);
				fresnel3 *= fresnelFactor * smoothness;
			
				
					
					
				
				
					
					
						
						
					
					
				
			

			float lFresnel3 = length(fresnel3);
			if (lFresnel3 < 0.0050) fresnel3 *= (lFresnel3 - 0.0025) / 0.0025;

			if (lFresnel3 > 0.0025) {
				vec4 reflection = vec4(0.0);
				vec3 skyReflection = vec3(0.0);

				
					float roughness = 1.0 - smoothnessP;
					
						roughness *= 1.0 - 0.35 * float(metalness == 1.0);
					
					roughness *= roughness;

					vec3 roughPos = worldPos + cameraPosition;
					roughPos *= 1000.0;
					vec3 roughNoise = texture2D(noisetex, roughPos.xz + roughPos.y).rgb;
					roughNoise = 0.3 * (roughNoise - vec3(0.5));
					
					roughNoise *= roughness;

					normal += roughNoise;
					reflection = RoughReflection(viewPos.xyz, normal, dither, smoothness);

					
						
						
						
					
				
					
				

				float cauldron = float(skymapMod > 0.51 && skymapMod < 0.9905);
				if (cauldron > 0.5) { 													//Cauldron Reflections
					
						fresnel3 = fresnel3 * 3.33333333 + vec3(0.0333333);

						float skymapModM = (skymapMod - 0.515) / 0.475;
						
							skymapModM = skymapModM * skymapModM;
						
							
						
							
						
						skymapModM = skymapModM * 0.5;

						vec3 skyReflectionPos = reflect(nViewPos, normal);
						float refNdotU = dot(skyReflectionPos, upVec);
						skyReflection = GetSkyColor(lightCol, refNdotU, skyReflectionPos, true);
						skyReflectionPos *= 1000000.0;

						
							
						
						
							vec4 cloud = DrawCloud(skyReflectionPos, dither, lightCol, ambientCol, refNdotU, 3);
							float cloudMixRate = smoothness * smoothness * (3.0 - 2.0 * smoothness);
							skyReflection = mix(skyReflection, cloud.rgb, cloud.a * cloudMixRate);
						
						skyReflection = mix(vec3(0.001), skyReflection, skymapModM * 2.0);
					
					
						
					
					
						
						
						
							
							
							
							
							
							
						
						
					
				}
				if (skymapMod > 0.0 && skymapMod < 0.505) {
					
						float skymapModM = skymapMod * 2.0;

						vec3 skyReflectionPos = reflect(nViewPos, normal);
						float refNdotU = dot(skyReflectionPos, upVec);
						skyReflection = GetSkyColor(lightCol, refNdotU, skyReflectionPos, true);
						skyReflectionPos *= 1000000.0;

						
							vec4 cloud = DrawCloud(skyReflectionPos, dither, lightCol, ambientCol, refNdotU, 3);
							float cloudMixRate = smoothness * smoothness * (3.0 - 2.0 * smoothness);
							skyReflection = mix(skyReflection, cloud.rgb, cloud.a * cloudMixRate);
						
						skyReflection = mix(vec3(0.001), skyReflection * 5.0, skymapModM);
					
					
						
						
						
						
						
						
					
				}

				reflection.rgb = max(mix(skyReflection, reflection.rgb, reflection.a), vec3(0.0));
				
				
					if (skymapMod < 0.505) reflection.rgb *= pow(min(ao + max(0.25 - lViewPos * 0.01, 0.0), 1.0), min(lViewPos * 0.75, 10.0));
				
				
				color.rgb = color.rgb * (1.0 - fresnel3 * (1.0 - metalness)) +
							reflection.rgb * fresnel3;

				
					
					
					
					
				
			}
		
		
		
			
				
									
									
									
									
									
									
									
									
									

				

				
					
					
					
				
				
				
			
		
		
		
			if (skymapMod < 0.505)
			color.rgb *= ambientOcclusion;
		
		
		
			
		

		vec3 extra = vec3(0.0);
		
			
		
		
			
		

		color.rgb = startFog(color.rgb, nViewPos, lViewPos, worldPos, extra, NdotU);
	
	} else { /**/ /**/ /**/ /**/ /**/ /**/ /**/ /**/ /**/ /**/ /**/ /**/ /**/ /**/ /**/ /**/ /**/ /**/ /**/ /**/ /**/ /**/ /**/ /**/
		float NdotU = 0.0;

		vec2 skyBlurOffset[4] = vec2[4](vec2( 0.0,  1.0),
										vec2( 0.0, -1.0),
										vec2( 1.0,  0.0),
										vec2(-1.0,  0.0));
		vec2 wh = vec2(viewWidth, viewHeight);
		vec3 skyBlurColor = color.rgb;
		for(int i = 0; i < 4; i++) {
			vec2 texCoordM = texCoord + skyBlurOffset[i] / wh;
			float depth = texture2D(depthtex0, texCoordM).r;
			if (depth == 1.0) skyBlurColor += texture2DLod(colortex0, texCoordM, 0.0).rgb;
			else skyBlurColor += color.rgb;
		}
		color.rgb = skyBlurColor / 5.0;

		
			
			
				
			
		

		
			
				
				
			
		

		
			
		
		
		
			

			
			

			
				
			

			

			
				
				
			
		
		
		
			
			
			
				
				
			
				
				
			
			
		

		if (isEyeInWater == 1) {
			NdotU = max(dot(normalize(viewPos.xyz), upVec), 0.0);
			color.rgb = mix(color.rgb, 0.8 * pow(underwaterColor.rgb * (1.0 - blindFactor), vec3(2.0)), 1.0 - NdotU*NdotU);
		}
		if (isEyeInWater == 2) color.rgb = vec3(0.6, 0.35, 0.15); //duplicate 792763950
		if (blindFactor > 0.0) color.rgb *= 1.0 - blindFactor;
	}
    
	
		
		
	

	
		float sumlightAlbedo = max(lightAlbedo.r + lightAlbedo.g + lightAlbedo.b, 0.0001);
		lightAlbedo = lightAlbedo / sumlightAlbedo;
		lightAlbedo *= lightAlbedo;
		lightAlbedo *= 0.75 * vec3(2.0, 1.8, 2.0);

		float lightSpeed = 0.01;
		    lightBuffer = mix(lightBuffer, blocklightCol, lightSpeed * 0.25);
		vec3 finalLight = mix(lightBuffer, lightAlbedo, lightSpeed * float(sumlightAlbedo > 0.0002));
	
	
	/*DRAWBUFFERS:05*/
    gl_FragData[0] = color;
	gl_FragData[1] = vec4(pow(color.rgb, vec3(0.125)) * 0.5, 1.0);

	
	/*DRAWBUFFERS:059*/
	gl_FragData[2] = vec4(finalLight, 1.0);
	
}



//////////Vertex Shader//////////Vertex Shader//////////Vertex Shader//////////








	

	
		
	
		
	




	
	
	

	
	
	
	

	

