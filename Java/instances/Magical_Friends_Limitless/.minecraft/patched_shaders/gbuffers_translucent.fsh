#version 150 core
#define gl_FragData iris_FragData
#define varying in
#define gl_ModelViewProjectionMatrix (gl_ProjectionMatrix * gl_ModelViewMatrix)
#define gl_ModelViewMatrix (iris_ModelViewMat * _iris_internal_translate(iris_ChunkOffset))
#define gl_NormalMatrix mat3(transpose(inverse(gl_ModelViewMatrix)))
#define gl_Color (Color * iris_ColorModulator)
#define gl_ProjectionMatrix iris_ProjMat
#define gl_FogFragCoord iris_FogFragCoord
#extension  GL_ARB_shader_texture_lod : enable































































































































































































































































































































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
varying float mat;

varying vec2 texCoord, lmCoord;

varying vec3 normal, binormal, tangent;
varying vec3 sunVec, upVec;
varying vec3 viewVector;

varying vec4 color;


varying vec4 vTexCoord, vTexCoordAM;


//////////Fragment Shader//////////Fragment Shader//////////Fragment Shader//////////


//Uniforms//
uniform int frameCounter;
uniform int isEyeInWater;
uniform int worldDay;
uniform int moonPhase;



	uniform int heldItemId, heldItemId2;

	uniform int heldBlockLightValue;
	uniform int heldBlockLightValue2;


uniform float frameTimeCounter;
uniform float isEyeInCave;
uniform float blindFactor, nightVision;
uniform float far, near;
uniform float rainStrengthS;
uniform float screenBrightness; 
uniform float viewWidth, viewHeight;
uniform float eyeAltitude;

uniform ivec2 eyeBrightnessSmooth;

uniform vec3 cameraPosition;
uniform vec3 skyColor;
uniform vec3 fogColor;

uniform mat4 gbufferProjection, gbufferPreviousProjection, gbufferProjectionInverse;
uniform mat4 gbufferModelView, gbufferPreviousModelView, gbufferModelViewInverse;
uniform mat4 shadowProjection;
uniform mat4 shadowModelView;

uniform sampler2D texture;
uniform sampler2D gaux2;
uniform sampler2D depthtex1;
uniform sampler2D noisetex;










uniform sampler2D colortex9;


//Optifine Constants//

//Common Variables//
float eBS = eyeBrightnessSmooth.y / 240.0;
float sunVisibility = clamp(dot( sunVec,upVec) + 0.0625, 0.0, 0.125) * 8.0;
float vsBrightness = clamp(screenBrightness, 0.0, 1.0);







float modifiedWorldDay = mod(worldDay, 100.0) + 5.0;
float frametime = frameTimeCounter * 0.75;
float cloudtime = (worldTime + modifiedWorldDay * 24000) * 0.05 * 0.75;







	
	



	vec3 lightVec = sunVec * ((timeAngle < 0.5325 || timeAngle > 0.9675) ? 1.0 : -1.0);

	



float waterBump = 1.00 * 1.2;




//Common Functions//
float GetLuminance(vec3 color) {
	return dot(color,vec3(0.299, 0.587, 0.114));
}

float InterleavedGradientNoise() {
	float n = 52.9829189 * fract(0.06711056 * gl_FragCoord.x + 0.00583715 * gl_FragCoord.y);
	return fract(n + frameCounter / 8.0);
}
 
float GetWaterHeightMap(vec3 worldPos, vec3 nViewPos) {
	float verticalOffset = worldPos.y * 0.005;

	vec2 wind = vec2(frametime) * 0.0015;
	wind *= 1.25;
	wind -= verticalOffset;

	vec4 noiseS = vec4(0.5);
	noiseS.r = texture2D(noisetex, (worldPos.xz) / (1.0 * 650.0) - wind).g;
	noiseS.g = texture2D(noisetex, (worldPos.xz) / (0.6 * 650.0) + wind).g;
	noiseS.b = texture2D(noisetex, (worldPos.xz) / (0.35 * 650.0) + wind).g;
	noiseS.a = texture2D(noisetex, (worldPos.xz) / (0.3 * 650.0) - wind).g;
	noiseS *= - noiseS;
	float noise = noiseS.r * 1.00 
				- noiseS.r * noiseS.g * 1.00 
				+ noiseS.g * 1.40 
				+ (noiseS.b - noiseS.a) * 0.30;

	noise *= waterBump * (lmCoord.y*0.9 + 0.1) * 0.35;

    return noise;
}

vec3 GetParallaxWaves(vec3 worldPos, vec3 nViewPos, vec3 viewVector, float lViewPos) {
	vec3 parallaxPos = worldPos;
	
	for(int i = 0; i < 4; i++) {
		float height = (GetWaterHeightMap(parallaxPos, nViewPos) - 0.5);
		parallaxPos.xz += 0.2 * height * viewVector.xy / lViewPos;
	}
	return parallaxPos;
}

vec3 GetWaterNormal(vec3 worldPos, vec3 nViewPos, vec3 viewVector, float lViewPos) {
	vec3 waterPos = worldPos + cameraPosition;
	
		
	

	float normalOffset = 0.25;

	float h1 = GetWaterHeightMap(waterPos + vec3( normalOffset, 0.0, 0.0), nViewPos);
	float h2 = GetWaterHeightMap(waterPos + vec3(-normalOffset, 0.0, 0.0), nViewPos);
	float h3 = GetWaterHeightMap(waterPos + vec3(0.0, 0.0,  normalOffset), nViewPos);
	float h4 = GetWaterHeightMap(waterPos + vec3(0.0, 0.0, -normalOffset), nViewPos);

	float xDelta = (h1 - h2) / normalOffset;
	float yDelta = (h3 - h4) / normalOffset;
	float aDelta = xDelta * xDelta + yDelta * yDelta;

	vec3 normalMap = vec3(xDelta, yDelta, 1.0 - aDelta);

	
		
		
	

	vec3 normalClamp = vec3(1.75);
	normalMap = clamp(normalMap, normal - normalClamp, normal + normalClamp);
	normalMap = normalMap * 0.03 + vec3(0.0, 0.0, 0.75);

	return normalMap;
}

float GetWaterOpacity(float alpha, float difT, float fresnel, float lViewPos) {
	//Fake water fog
	float waterFogDist = 1.0 - min(difT / 64.0, 1.0);
	waterFogDist *= waterFogDist;
	alpha = mix(0.97, alpha, min(waterFogDist, 1.0 - fresnel));

	//Hide shadows not being good enough
	alpha = max(min(sqrt(lViewPos) * 0.075, 0.9), alpha);

	alpha = min(alpha, 1.0 - nightVision * 0.2);

	return alpha;
}

//Includes//




vec3 blocklightColSqrt = vec3(0.387, 0.31, 0.247);
vec3 blocklightCol = vec3(0.15, 0.096, 0.061);







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

    vec4 underwaterColor = vec4(pow(fogColor, vec3(0.33, 0.21, 0.26)) * 1.00 * 0.2, 1.0);

    


vec4 waterColorSqrt = vec4(172, 212, 255, 255.0) * 0.50 / 255.0;
vec4 waterColor = waterColorSqrt * waterColorSqrt;

const float waterFog = 64.0;

const float waterAlpha = 0.50;
//GGX area light approximation from Horizon Zero Dawn
float GetNoHSquared(float radiusTan, float NoL, float NoV, float VoL) {
    float radiusCos = 1.0 / sqrt(1.0 + radiusTan * radiusTan);
    
    float RoL = 2.0 * NoL * NoV - VoL;
    if (RoL >= radiusCos)
        return 1.0;

    float rOverLengthT = radiusCos * radiusTan / sqrt(1.0 - RoL * RoL);
    float NoTr = rOverLengthT * (NoV - RoL * NoL);
    float VoTr = rOverLengthT * (2.0 * NoV * NoV - 1.0 - RoL * VoL);

    float triple = sqrt(clamp(1.0 - NoL * NoL - NoV * NoV - VoL * VoL + 2.0 * NoL * NoV * VoL, 0.0, 1.0));
    
    float NoBr = rOverLengthT * triple, VoBr = rOverLengthT * (2.0 * triple * NoV);
    float NoLVTr = NoL * radiusCos + NoV + NoTr, VoLVTr = VoL * radiusCos + 1.0 + VoTr;
    float p = NoBr * VoLVTr, q = NoLVTr * VoLVTr, s = VoBr * NoLVTr;    
    float xNum = q * (-0.5 * p + 0.25 * VoBr * NoLVTr);
    float xDenom = p * p + s * ((s - 2.0 * p)) + NoLVTr * ((NoL * radiusCos + NoV) * VoLVTr * VoLVTr + 
                   q * (-0.5 * (VoLVTr + VoL * radiusCos) - 0.5));
    float twoX1 = 2.0 * xNum / (xDenom * xDenom + xNum * xNum);
    float sinTheta = twoX1 * xDenom;
    float cosTheta = 1.0 - twoX1 * xNum;
    NoTr = cosTheta * NoTr + sinTheta * NoBr;
    VoTr = cosTheta * VoTr + sinTheta * VoBr;
    
    float newNoL = NoL * radiusCos + NoTr;
    float newVoL = VoL * radiusCos + VoTr;
    float NoH = NoV + newNoL;
    float HoH = 2.0 * newVoL + 2.0;
    return clamp(NoH * NoH / HoH, 0.0, 1.0);
}

float SchlickGGX(float NoL, float NoV, float roughness) {
    float k = roughness * 0.5;
        
    float smithL = 0.5 / (NoL * (1.0 - k) + k);
    float smithV = 0.5 / (NoV * (1.0 - k) + k);

    return smithL * smithV;
}

float GGX(vec3 normal, vec3 viewPos, vec3 lightVec, float smoothness, float f0, float sunSize) {
    float roughness = 1.0 - smoothness;
    if (roughness < 0.05) roughness = 0.05;
    float roughnessP = roughness;
    roughness *= roughness; roughness *= roughness;
    
    vec3 halfVec = normalize(lightVec - viewPos);

    float dotLH = clamp(dot(halfVec, lightVec), 0.0, 1.0);
    float dotNL = clamp(dot(normal,  lightVec), 0.0, 1.0);
    float dotNV = dot(normal, -viewPos);
    float dotNH = GetNoHSquared(sunSize, dotNL, dotNV, dot(-viewPos, lightVec));
    
    float denom = dotNH * roughness - dotNH + 1.0;
    float D = roughness / (3.141592653589793 * denom * denom);
    float F = exp2((-5.55473 * dotLH - 6.98316) * dotLH) * (1.0 - f0) + f0;
    float k2 = roughness * 0.5;

    float specular = max(dotNL * dotNL * D * F / (dotLH * dotLH * (1.0 - k2) + k2), 0.0);
    specular = max(specular, 0.0);
    specular = specular / (0.125 * specular + 1.0);

    float schlick = SchlickGGX(dotNL, dotNV, roughness);
    schlick = pow(schlick * 0.5, roughnessP);
    specular *= clamp(schlick, 0.0, 1.25);

    if (sunVisibility == 0.0) specular *= float(moonPhase == 0) * 0.35 + 0.65 - float(moonPhase == 4) * 0.65;
    else specular *= 1.5;

    return specular * (1.0 - isEyeInWater*0.75);
}

float stylisedGGX(vec3 normal, vec3 oldNormal, vec3 nViewPos, vec3 lightVec, float f0) {

    vec3 halfVec = normalize(lightVec - nViewPos);

    float dotLH = clamp(dot(halfVec, lightVec), 0.0, 1.0);
    float dotOldL = clamp(dot(oldNormal,  lightVec), 0.0, 1.0);
    float dotNmOL = clamp(dot(normal - oldNormal,  lightVec), 0.0, 1.0);

    float sunSize = 0.037;
    
    float dotNH = GetNoHSquared(sunSize, dotOldL, dot(oldNormal, -nViewPos), dot(-nViewPos, lightVec));

    dotOldL *= dotOldL;
    
    float roughness = 0.05;
    
    float denom = dotNH * roughness - dotNH + 1.0;
    float D = roughness / (3.141592653589793 * denom * denom);
    float F = exp2((-5.55473 * dotLH - 6.98316) * dotLH) * (1.0 - f0) + f0;
    float k2 = roughness * 0.25;

    float specular = max(dotOldL * D * F / (dotLH * dotLH * (1.0 - k2) + k2), 0.0);
    specular = max(specular, 0.0);
    specular = specular / (0.125 * specular + 1.0);

    dotNmOL *= dotNH * dotNH;
    dotNmOL *= dotNmOL * 350.0 * 1.00;
    dotNmOL *= dotNmOL;
    dotNmOL = max(dotNmOL * 0.25, sunVisibility * pow2(dotNmOL * dotNmOL));
    specular *= 0.075 + 9.0 * min(dotNmOL * 6.0, 50.0);
    specular *= 0.4 + 1.71 * dotOldL;

    if (sunVisibility == 0.0) {
        specular *= 0.25 * 1.00;
        specular *= float(moonPhase == 0) * 0.35 + 0.65 - float(moonPhase == 4) * 0.65;
    }

    return max(specular * (1.0 - isEyeInWater*0.75), 0.0);
}

vec3 GetMetalCol(float f0) {
    int metalidx = int(f0 * 255.0);

    if (metalidx == 230) return vec3(0.24867, 0.22965, 0.21366);
    if (metalidx == 231) return vec3(0.88140, 0.57256, 0.11450);
    if (metalidx == 232) return vec3(0.81715, 0.82021, 0.83177);
    if (metalidx == 233) return vec3(0.27446, 0.27330, 0.27357);
    if (metalidx == 234) return vec3(0.84430, 0.48677, 0.22164);
    if (metalidx == 235) return vec3(0.36501, 0.35675, 0.37653);
    if (metalidx == 236) return vec3(0.42648, 0.37772, 0.31138);
    if (metalidx == 237) return vec3(0.91830, 0.89219, 0.83662);
    return vec3(1.0);
}

vec3 GetSpecularHighlight(float smoothness, float metalness, float f0, vec3 specularColor,
                          vec3 rawAlbedo, vec3 shadow, vec3 normal, vec3 viewPos) {    
    if (dot(shadow, shadow) < 0.001) return vec3(0.0);

    
        
    

    float specular = GGX(normal, normalize(viewPos), lightVec, smoothness, f0,
                         0.01 * sunVisibility + 0.06);
    specular *= sqrt1inv(rainStrengthS);

    
        specular *= shadowFade;
    
    
    specularColor = pow(specularColor, vec3(1.0 - 0.5 * metalness));
	
	
		specularColor *= pow(rawAlbedo, vec3(metalness * 0.8));
	
		
            
                
                
            
		
		    
		
	

    return specular * specularColor * shadow;
}
//Thanks to Jessie for dithering
float Bayer2  (vec2 c) { c = 0.5 * floor(c); return fract(1.5 * fract(c.y) + c.x); }
float Bayer4  (vec2 c) { return 0.25 * Bayer2  (0.5 * c) + Bayer2(c); }
float Bayer8  (vec2 c) { return 0.25 * Bayer4  (0.5 * c) + Bayer2(c); }
float Bayer16 (vec2 c) { return 0.25 * Bayer8  (0.5 * c) + Bayer2(c); }
float Bayer32 (vec2 c) { return 0.25 * Bayer16 (0.5 * c) + Bayer2(c); }
float Bayer64 (vec2 c) { return 0.25 * Bayer32 (0.5 * c) + Bayer2(c); }
float Bayer128(vec2 c) { return 0.25 * Bayer64 (0.5 * c) + Bayer2(c); }
float Bayer256(vec2 c) { return 0.25 * Bayer128(0.5 * c) + Bayer2(c); }
vec3 nvec3(vec4 pos) {
    return pos.xyz/pos.w;
}

vec4 nvec4(vec3 pos) {
    return vec4(pos.xyz, 1.0);
}

float cdist(vec2 coord) {
	return max(abs(coord.s-0.5) * 1.82, abs(coord.t-0.5) * 2.0);
}

vec4 Raytrace(sampler2D depthtex, vec3 viewPos, vec3 normal, float dither) {
	vec3 pos = vec3(0.0);
	float dist = 0.0;

	
		dither = fract(dither + frameTimeCounter);
	

	vec3 start = viewPos;
    vec3 vector = 0.5 * reflect(normalize(viewPos), normalize(normal));
    viewPos += vector;
	vec3 tvector = vector;

	float difFactor = 0.4;

    int sr = 0;

    for(int i = 0; i < 30; i++) {
        pos = nvec3(gbufferProjection * nvec4(viewPos)) * 0.5 + 0.5;
		if (pos.x < -0.05 || pos.x > 1.05 || pos.y < -0.05 || pos.y > 1.05) break;

		vec3 rfragpos = vec3(pos.xy, texture2D(depthtex,pos.xy).r);
        rfragpos = nvec3(gbufferProjectionInverse * nvec4(rfragpos * 2.0 - 1.0));
		dist = length(start - rfragpos);

        float err = length(viewPos - rfragpos);
		float lVector = length(vector) * (1.0 + clamp(0.25 * sqrt(dist), 0.3, 0.8));
		if (err < lVector || (dist < difFactor && err > difFactor)) {
                sr++;
                if(sr >= 6) break;
				tvector -= vector;
                vector *= 0.1;
		}
        vector *= 2.0;
		tvector += vector * (dither * 0.02 + 0.765);
		viewPos = start + tvector;
    }

	return vec4(pos, dist);
}



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

	



uniform sampler2DShadow shadowtex0;









vec2 shadowoffsets[8] = vec2[8](    vec2( 0.0   , 1.0   ),
                                    vec2( 0.7071, 0.7071),
                                    vec2( 1.0   , 0.0   ),
                                    vec2( 0.7071,-0.7071),
                                    vec2( 0.0   ,-1.0   ),
                                    vec2(-0.7071,-0.7071),
                                    vec2(-1.0   , 0.0   ),
                                    vec2(-0.7071, 0.7071));

vec2 offsetDist(float x, float s) {
	float n = fract(x * 1.414) * 3.1415;
    return vec2(cos(n), sin(n)) * 1.4 * x / s;
}

vec3 SampleBasicShadow(vec3 shadowPos, inout float water) {
    float shadow0 = shadow2D(shadowtex0, vec3(shadowPos.st, shadowPos.z)).x;

    
        
        
            
            
                
                    
                
                
                    
                
            
        

        
    
        return vec3(shadow0);
    
}

vec3 SampleFilteredShadow(vec3 shadowPos, float offset, inout float water) {
    vec3 shadow = SampleBasicShadow(vec3(shadowPos.st, shadowPos.z), water) * 2.0;

    for(int i = 0; i < 8; i++) {
        shadow+= SampleBasicShadow(vec3(offset * 1.2 * shadowoffsets[i] + shadowPos.st, shadowPos.z), water);
    }

    return shadow * 0.1;
}

vec3 SampleTAAFilteredShadow(vec3 shadowPos, float offset, inout float water) {
    float noise = InterleavedGradientNoise();
    vec3 shadow = vec3(0.0);
    offset = offset * (2.0 - 0.5 * (0.85 + 0.25 * (3072.0 / shadowMapResolution)));
    if (shadowMapResolution < 400.0) offset *= 30.0;

    for(int i = 0; i < 2; i++) {
        vec2 offset = offsetDist(noise + i, 2.0) * offset;
        shadow += SampleBasicShadow(vec3(shadowPos.st + offset, shadowPos.z), water);
        shadow += SampleBasicShadow(vec3(shadowPos.st - offset, shadowPos.z), water);
    }
    
    return shadow * 0.25;
}

vec3 GetShadow(vec3 shadowPos, float offset, inout float water) {
    
        
            
        
            
        
    
       vec3 shadow = SampleBasicShadow(shadowPos, water);
    

    return shadow;
}

	vec3 DistortShadow(inout vec3 worldPos, float distortFactor) {
		worldPos.xy /= distortFactor;
		worldPos.z *= 0.2;
		return worldPos * 0.5 + 0.5;
	}



float waterH(vec3 pos) {
	float noise = 0;
	vec2 wind = vec2(frametime) * 0.25 * 1.25;
	float yFactor = 0.5;
	noise+= texture2D(noisetex,(pos.xz + wind - pos.y * yFactor) / 1024.0 * 1.1).r * 1.0;
	noise+= texture2D(noisetex,(pos.xz - wind - pos.y * yFactor) / 1024.0 * 1.5).r * 0.8;
	noise-= texture2D(noisetex,(pos.xz + wind + pos.y * yFactor) / 1024.0 * 2.5).r * 0.6;
	noise+= texture2D(noisetex,(pos.xz - wind - pos.y * yFactor) / 1024.0 * 5.0).r * 0.4;
	noise-= texture2D(noisetex,(pos.xz + wind + pos.y * yFactor) / 1024.0 * 8.0).r * 0.2;

	return noise;
	}

float getCausticWaves(vec3 pos) {
	float deltaPos = 0.1;
	float caustic_h0 = waterH(pos);
	float caustic_h1 = waterH(pos + vec3( deltaPos, 0.0,  0.0));
	float caustic_h2 = waterH(pos + vec3(-deltaPos, 0.0,  0.0));
	float caustic_h3 = waterH(pos + vec3( 0.0,      0.0,  deltaPos));
	float caustic_h4 = waterH(pos + vec3( 0.0,      0.0, -deltaPos));

	float caustic = max((1.0-abs(0.5-caustic_h0))*(1.0-(abs(caustic_h1-caustic_h2)+abs(caustic_h3-caustic_h4))),0.0);
		  caustic = max(pow(caustic,3.5),0.0)*2.0;
		  
	return caustic;
}


float GetFakeShadow(float skyLight) {
	float fakeShadow = 0.0;

	
		if (isEyeInWater == 0) skyLight = pow(skyLight, 30.0);
		fakeShadow = skyLight;
	
		
			
		
			
		
	

	return fakeShadow;
}

void GetLighting(inout vec3 albedo, inout vec3 shadow, inout vec3 lightAlbedo, vec3 viewPos, float lViewPos, vec3 worldPos,
                 vec2 lightmap, float smoothLighting, float NdotL, float quarterNdotU,
                 float parallaxShadow, float emissive, float subsurface, float leaves, float materialAO) {
	vec3 fullShadow = vec3(0.0);
	float fullShadow1 = 0.0;
	float fakeShadow = 0.0;
	float shadowMult = 1.0;
	float shadowTime = 1.0;
	float water = 0.0;
	
	
		worldPos = floor((worldPos + cameraPosition) * 16 + 0.001) / 16 - cameraPosition + 0.5 / 16;
	

    
		
			shadow = vec3(1.0);
			if ((NdotL > 0.0 || subsurface > 0.001)) {
				float shadowLengthX = length(worldPos.xy);
				float shadowLengthZ = length(worldPos.yz);
				float shadowLength = shadowDistance - max(shadowLengthX, shadowLengthZ) - shadowDistance / 12.0;

				
					if (isEyeInWater == 0) shadowLength *= float(lightmap.y > 0.001);
				

				
					
					
					
					

					
								 
					
					
				

				if (shadowLength > 0.000001) {
					
						vec3 shadowPos = WorldToShadow(worldPos);
						float distb = sqrt(shadowPos.x * shadowPos.x + shadowPos.y * shadowPos.y);
						float distortFactor = distb * shadowMapBias + (1.0 - shadowMapBias);
						shadowPos = DistortShadow(shadowPos, distortFactor);
					

					
						
						
					
						float NdotLm = NdotL * 0.99 + 0.01;
					

					float dotWorldPos = dot(worldPos.xyz, worldPos.xyz);
					
					float biasFactor = sqrt(1.0 - NdotLm * NdotLm) / NdotLm;
					float distortBias = distortFactor * shadowDistance / 256.0;
					distortBias *= 8.0 * distortBias;
					
					float bias = (distortBias * biasFactor + dotWorldPos * 0.000005 + 0.05) / shadowMapResolution;
					float offset = 1.0 / shadowMapResolution;

					if (subsurface > 0.001) {
						if (leaves < 0.5) {
							float UdotLm = clamp(dot(upVec, lightVec) * 1.01 - 0.01, 0.0, 1.0) * 0.99 + 0.01;
							float biasFactorF = sqrt(1.0 - UdotLm * UdotLm) / UdotLm;
							bias = (distortBias * biasFactorF + 0.05) / shadowMapResolution * 1.3;
						} else bias = 0.0002;
						offset = 0.002;
					}
					if (isEyeInWater == 1) offset *= 5.0;

					
						bias += 0.0025 / 16 * (1.0 + subsurface);
					

					shadowPos.z -= bias;
					shadow = GetShadow(shadowPos, offset, water);

					
						
							
							
							
							
						
						
							
								
							
						
					
				}

				float shadowSmooth = 16.0;
				if (shadowLength < shadowSmooth) {
					float shadowLengthDecider = max(shadowLength / shadowSmooth, 0.0);
					float skyLightShadow = GetFakeShadow(lightmap.y);
					shadow = mix(vec3(skyLightShadow), shadow, shadowLengthDecider);
					subsurface *= mix(subsurface * 0.5, subsurface, shadowLengthDecider);
					fakeShadow = mix(1.0, fakeShadow, shadowLengthDecider);
					fakeShadow = 1.0 - fakeShadow;
					fakeShadow *= fakeShadow;
					fakeShadow = 1.0 - fakeShadow;
				}

				
					
						
						
						
						
					
				
			}
		
			
		
		
		
			
			
			
			
			
			
			
			
		

		
			
				
				
				
			
		
		
		fullShadow = shadow * max(NdotL, subsurface * (1.0 - max(rainStrengthS, (1.0 - sunVisibility)) * 0.40));

		fullShadow1 = (fullShadow.r + fullShadow.g + fullShadow.b) / 3.0;

		
			shadow *= float(fullShadow1 > 0.01);
		

		
			shadowMult = 1.0 * (1.0 - 0.95 * rainStrengthS);
			
			shadowTime = abs(sunVisibility - 0.5) * 2.0;
			shadowTime *= shadowTime;
			shadowMult *= shadowTime * shadowTime;
			
			
				
			
				if (isEyeInWater == 1) ambientCol *= pow(lightmap.y, 2.5);
			
			
			vec3 lightingCol = pow(lightCol, vec3(1.0 + sunVisibility * 2.0 - timeBrightness));
			
				lightingCol *= (1.0 + 0.5 * leaves);
			
				
			
			vec3 shadowDecider = fullShadow * shadowMult;
			if (isEyeInWater == 1) shadowDecider *= pow(min(lightmap.y * 1.03, 1.0), 200.0);
			ambientCol *= 0.90;
			lightingCol *= 1;
			vec3 sceneLighting = mix(ambientCol, lightingCol, shadowDecider);
			
			
				if (isEyeInWater == 0) sceneLighting *= pow(lightmap.y, 2.5);
			
		

		
			
			
			
			
			
		

		
			
				
			
				
			
		
		
		
			
		
		
			
		
		
			
		
		
		
			if (subsurface > 0.001) {
				float VdotL = clamp(dot(normalize(viewPos.xyz), lightVec), 0.0, 1.0);
				
				vec3 subsurfaceGlow = (5.5 + 22.0 * leaves) * (1.0 - fakeShadow) * shadowTime * fullShadow * pow(VdotL, 10.0);
				subsurfaceGlow *= 1.0 - rainStrengthS * 0.68;
				albedo.rgb += max(albedo.g * normalize(sqrt((albedo.rgb + vec3(0.001)) * lightCol)) * subsurfaceGlow, vec3(0.0));
			}
		
    
		
			
				
			
		
			
				
			
				
			
		
			
		
    

	
		float handLight = min(float(heldBlockLightValue2 + heldBlockLightValue), 15.0) / 15.0;

		if (heldItemId == 12001 || heldItemId2 == 12001) // Lava Bucket
			
				
			
				handLight = 1.0;
			
		if (heldItemId == 12002 || heldItemId2 == 12002) // Optifine Item Emissives
			handLight = min(handLight + 0.65, 1.0);

		float handLightFactor = 1.0 - min(20.0 * handLight, lViewPos) / (20.0 * handLight);
		
			if (mat > 0.05) handLight *= 0.9;
		
		
			
		
		float finalHandLight = handLight * handLightFactor;
		lightmap.x = max(finalHandLight * 0.95, lightmap.x);
	

	float lightmapX2 = lightmap.x * lightmap.x;
	float lightmapXM1 = pow2(pow2(lightmapX2)) * lightmapX2;
	float lightmapXM2 = max((lightmap.x - 0.05) * 0.925, 0.0);
	float newLightmap = mix(lightmapXM1 * 5.0 + lightmapXM2, lightmapXM1 * 4.0 + lightmapXM2 * 1.5, vsBrightness);

	
		float frametimeM = frametime * 0.5;
		float lightFlicker = min(((1 - clamp(sin(fract(frametimeM*2.7) + frametimeM*3.7) - 0.75, 0.0, 0.25) * 0.80)
					* max(fract(frametimeM*1.4), (1 - 0.80 * 0.25))) / (1.0 - 0.80 * 0.2)
					, 0.8) * 1.25
					* 0.8 + 0.2 * clamp((cos(fract(frametimeM*0.47) * fract(frametimeM*1.17) + fract(frametimeM*2.17))) * 1.5, 1.0 - 0.80 * 0.25, 1.0);
		newLightmap *= lightFlicker;
	

	
		
		
		
		
		
	

	
		
			
				
					
				
				
					
					
					
					
					
				
				
					
				
				
					
				
				
					
				
			
			
		

		vec3 blocklightComplex = texture2D(colortex9, texCoord).rgb;
		blocklightComplex *= 0.75 + 2.0 * blocklightComplex.b;

		blocklightCol = mix(blocklightCol, blocklightComplex, 0.7);

		
/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/
vec3 glowstoneColor     = vec3(0.9, 0.5, 0.2);
vec3 sealanternColor    = vec3(0.5, 0.57, 0.78);
vec3 shroomlightColor   = vec3(1.0, 0.3, 0.125);
vec3 jackolanternColor  = vec3(0.9, 0.5, 0.2);
vec3 beaconColor        = vec3(0.33, 0.51, 0.6);
vec3 endrodColor        = vec3(0.53, 0.5, 0.47);
vec3 redstonetorchColor = vec3(1.0, 0.0, 0.0);
vec3 lanternColor       = vec3(0.9, 0.5, 0.2);
vec3 soullanternColor   = vec3(0.0, 0.7, 1.0);
vec3 torchColor         = vec3(0.9, 0.5, 0.2);
vec3 soultorchColor     = vec3(0.0, 0.7, 1.0);
vec3 respawnanchorColor = vec3(0.3, 0.0, 1.0);
vec3 campfireColor      = vec3(0.94, 0.5, 0.2);
vec3 soulcampfireColor  = vec3(0.0, 0.7, 1.0);
vec3 lavabucketColor    = vec3(0.94, 0.5, 0.2);
/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/
vec3 heldLightAlbedo1 = vec3(0.0);
vec3 heldLightAlbedo2 = vec3(0.0);
if (heldItemId < 11012.5) {
    if (heldItemId < 11005.5) {
        if (heldItemId == 11001) // Glowstone
            heldLightAlbedo1 = glowstoneColor;
        else if (heldItemId == 11002) // Sea Lantern
            heldLightAlbedo1 = sealanternColor;
        else if (heldItemId == 11004) // Shroomlight
            heldLightAlbedo1 = shroomlightColor;
    } else {
        if (heldItemId == 11007) // Jack o'Lantern
            heldLightAlbedo1 = jackolanternColor;
        else if (heldItemId == 11008) // Beacon
            heldLightAlbedo1 = beaconColor;
        else if (heldItemId == 11009) // End Rod
            heldLightAlbedo1 = endrodColor;
        else if (heldItemId == 11012) // Redstone Torch
            heldLightAlbedo1 = redstonetorchColor;
    }
} else {
    if (heldItemId < 11022.5) {
        if (heldItemId == 11017) // Lantern
            heldLightAlbedo1 = lanternColor;
        else if (heldItemId == 11018) // Soul Lantern
            heldLightAlbedo1 = soullanternColor;
        else if (heldItemId == 11021) // Torch
            heldLightAlbedo1 = torchColor;
        else if (heldItemId == 11022) // Soul Torch
            heldLightAlbedo1 = soultorchColor;
    } else {
        if (heldItemId == 11023) // Crying Obsidian, Respawn Anchor
            heldLightAlbedo1 = respawnanchorColor;
        else if (heldItemId == 11024) // Campfire
            heldLightAlbedo1 = campfireColor;
        else if (heldItemId == 11025) // Soul Campfire
            heldLightAlbedo1 = soulcampfireColor;
        else if (heldItemId == 12001) // Lava Bucket
            heldLightAlbedo1 = lavabucketColor;
    }
}
if (heldItemId2 < 11012.5) {
    if (heldItemId2 < 11005.5) {
        if (heldItemId2 == 11001) // Glowstone
            heldLightAlbedo2 = glowstoneColor;
        else if (heldItemId2 == 11002) // Sea Lantern
            heldLightAlbedo2 = sealanternColor;
        else if (heldItemId2 == 11004) // Shroomlight
            heldLightAlbedo2 = shroomlightColor;
    } else {
        if (heldItemId2 == 11007) // Jack o'Lantern
            heldLightAlbedo2 = jackolanternColor;
        else if (heldItemId2 == 11008) // Beacon
            heldLightAlbedo2 = beaconColor;
        else if (heldItemId2 == 11009) // End Rod
            heldLightAlbedo2 = endrodColor;
        else if (heldItemId2 == 11012) // Redstone Torch
            heldLightAlbedo2 = redstonetorchColor;
    }
} else {
    if (heldItemId2 < 11022.5) {
        if (heldItemId2 == 11017) // Lantern
            heldLightAlbedo2 = lanternColor;
        else if (heldItemId2 == 11018) // Soul Lantern
            heldLightAlbedo2 = soullanternColor;
        else if (heldItemId2 == 11021) // Torch
            heldLightAlbedo2 = torchColor;
        else if (heldItemId2 == 11022) // Soul Torch
            heldLightAlbedo2 = soultorchColor;
    } else {
        if (heldItemId2 == 11023) // Crying Obsidian, Respawn Anchor
            heldLightAlbedo2 = respawnanchorColor;
        else if (heldItemId2 == 11024) // Campfire
            heldLightAlbedo2 = campfireColor;
        else if (heldItemId2 == 11025) // Soul Campfire
            heldLightAlbedo2 = soulcampfireColor;
        else if (heldItemId2 == 12001) // Lava Bucket
            heldLightAlbedo2 = lavabucketColor;
    }
}
/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/
vec3 heldLightAlbedo = heldLightAlbedo1 + heldLightAlbedo2;

if (dot(heldLightAlbedo, heldLightAlbedo) > 0.001) {
    heldLightAlbedo /= length(heldLightAlbedo);
    heldLightAlbedo *= 0.75 * 0.4;
    float mixFactor = finalHandLight * finalHandLight;
    blocklightCol = mix(blocklightCol, heldLightAlbedo, max(mixFactor, 0.0));
}
/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/
		
	

    vec3 blockLighting = blocklightCol * newLightmap * newLightmap;

	vec3 minLighting = vec3(0.000000000001 + (12 * 0.0035 * (vsBrightness*0.0775 + 0.0125)));
	
		minLighting *= (1.0 - eBS);
	
	
		minLighting *= 2.0;
	
	
	float shade = pow(quarterNdotU, 0.15);

	vec3 emissiveLighting = albedo.rgb * emissive * 20.0 / shade * 1.70;

    float nightVisionLighting = nightVision * 0.25;

	if (smoothLighting > 0.01) {
		smoothLighting = clamp(smoothLighting, 0.0, 1.0);
		
			
		
			smoothLighting = pow(smoothLighting, 0.2 * 0);
		
	} else smoothLighting = 1.0;

	if (materialAO < 1.0) {
		smoothLighting *= pow(materialAO, max(1.0 - shadowTime * length(shadow) * NdotL - lmCoord.x, 0.0));
	}

    albedo *= sceneLighting + blockLighting + emissiveLighting + nightVisionLighting + minLighting;
	albedo *= shade;
	albedo *= smoothLighting;

	
		
		
		
		if ((isEyeInWater != 0 && isEyeInWater != 2 && isEyeInWater != 3)) {
		// Not just doing (isEyeInWater == 1) to fix caustics appearing in shadows on AMD Mesa with Iris
		
			vec3 albedoCaustic = albedo;

			float skyLightMap = lightmap.y * lightmap.y * (3.0 - 2.0 * lightmap.y);
			float skyLightMapA = pow2(pow2((1.0 - skyLightMap)));
			float skyLightMapB = skyLightMap > 0.98 ? (1.0 - skyLightMap) * 50.0 : 1.0;
			
			float causticfactor = 1.0 - lightmap.x * 0.8;

			vec3 causticpos = worldPos.xyz + cameraPosition.xyz;
			float caustic = getCausticWaves(causticpos);
			vec3 causticcol = underwaterColor.rgb / 1.00;
			
			
				
					
					

					
					
						
						
					
						
						
					
				
			
					causticfactor *= shadow.g * sqrt2(NdotL) * (1.0 - rainStrengthS);
					causticfactor *= 0.25 - 0.15 * skyLightMapA;
					causticfactor *= skyLightMapB;

					albedoCaustic = (albedo.rgb + albedo.rgb * underwaterColor.rgb * 16.0) * 0.225;
					
						
					
					albedoCaustic += albedo.rgb * underwaterColor.rgb * caustic * sqrt1(lightmap.x) * 4.0 * skyLightMapB;
					causticcol = sqrt(causticcol) * 30.0;
			
				
			

			vec3 lightcaustic = caustic * causticfactor * causticcol * 1.00;
			albedoCaustic *= 1.0 + lightcaustic;

			
				
				
			
				albedo = albedoCaustic;
			
		}
	

	
		
		
	
}
vec4 SimpleReflection(vec3 viewPos, vec3 normal, float dither, float skyLightFactor) {
	vec4 reflection = vec4(0.0);

    vec4 pos = Raytrace(depthtex1, viewPos, normal, dither);

	float border = clamp(1.0 - pow(cdist(pos.st), 50.0), 0.0, 1.0);
	
	if (pos.z < 1.0 - 1e-5) {
		float refDepth = texture2D(depthtex1, pos.st).r;
		reflection.a = float(0.999999 > refDepth);
		if (reflection.a > 0.001) {
			reflection.rgb = texture2D(gaux2, pos.st).rgb;
			if (refDepth > 0.9995) reflection.rgb *= sqrt3(skyLightFactor);
		}
		reflection.a *= border;
	}

	reflection.rgb = pow(reflection.rgb * 2.0, vec3(8.0));

	return reflection;
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


//Jitter offset from Chocapic13
uniform float framemod8;
uniform float velocity;

vec2 jitterOffsets[8] = vec2[8]( // LiteTAA Jitter
							vec2( 0.125,-0.375),
							vec2(-0.125, 0.375),
							vec2( 0.625, 0.125),
							vec2( 0.375,-0.625),
							vec2(-0.625, 0.625),
							vec2(-0.875,-0.125),
							vec2( 0.375,-0.875),
							vec2( 0.875, 0.875)
						);
							   
vec2 TAAJitter(vec2 coord, float w) {
	vec2 offset = jitterOffsets[int(framemod8)] * (w / vec2(viewWidth, viewHeight));
	offset *= max(1.0 - velocity * 200.0, 0.0) * 0.125;
	return coord + offset;
}







							
							
							
							
							
							
							
							
						
							   

	
	
	



//Program//
void irisMain() {
	vec4 albedoP = texture2D(texture, texCoord);
	if (albedoP.a == 0.0) discard; //needed for "Create" mod support
    vec4 albedo = albedoP * vec4(color.rgb, 1.0);
	
	float emissive = 0.0;
	vec3 newNormal = normal;
	vec3 vlAlbedo = vec3(1.0);
	vec3 worldPos = vec3(0.0);
	
	
		float albedocheck = albedo.a;
	
		
	

	if (albedocheck > 0.00001) {
		vec2 lightmap = lmCoord;
		
		float water            = float(mat > 0.98 && mat < 1.02);
		float translucent      = float(mat > 1.98 && mat < 2.52);
		float tintedGlass      = float(mat > 2.23 && mat < 2.27);
		float ice      		   = float(mat > 2.48 && mat < 2.52);
		float netherPortal 	   = float(mat > 2.98 && mat < 3.02);
		float moddedfluid  	   = float(mat > 3.98 && mat < 5.02);
		float moddedfluidX     = float(mat > 4.98 && mat < 5.02);
		
		
			
		

		vec3 screenPos = vec3(gl_FragCoord.xy / vec2(viewWidth, viewHeight), gl_FragCoord.z);
		
			vec3 viewPos = ScreenToView(vec3(TAAJitter(screenPos.xy, -0.5), screenPos.z));
		
			
		
		worldPos = ViewToWorld(viewPos);
		float lViewPos = length(viewPos);

		vec3 nViewPos = normalize(viewPos.xyz);
		float NdotU = dot(nViewPos, upVec);

		vec3 normalMap = vec3(0.0, 0.0, 1.0);
		
		mat3 tbnMatrix = mat3(tangent.x, binormal.x, normal.x,
							  tangent.y, binormal.y, normal.y,
							  tangent.z, binormal.z, normal.z);

		if (water + moddedfluidX > 0.5) {
			float halfNdotUish = abs(dot(newNormal, upVec));
			waterBump *= 0.25 + 0.75 * halfNdotUish;

			normalMap = GetWaterNormal(worldPos, nViewPos, viewVector, lViewPos);
			newNormal = clamp(normalize(normalMap * tbnMatrix), vec3(-1.0), vec3(1.0));
			
			// Iris' Broken Water Normal Workaround
			float VdotN = dot(nViewPos, normalize(normal));
			if (VdotN > 0.0) newNormal = -newNormal;
		}

		
			
				
					
					
					
					
					
					
						
					
						
						
						
							
							
							
						
							
						
					

					
						
				
			
		

		
			if (netherPortal > 0.5) {
				lightmap = vec2(0.0);

				int sampleCount = 32;
				float multiplier = 0.0625 / (-viewVector.z * sampleCount);
				vec2 interval = viewVector.xy * multiplier;
				vec2 coord = vTexCoord.st;

				vec4 albedoC = albedo;
				for (int i = 1; i <= sampleCount; i++) {
					coord += interval;
					vec4 psample = texture2DLod(texture, fract(coord) * vTexCoordAM.pq + vTexCoordAM.st, 0.0);

					albedoC = max(albedoC, psample);

					psample.r *= 1.5;
					psample.a = sqrt2(psample.a) * 0.75;

					albedo += psample;
				}
				albedo /= sampleCount;

				emissive = albedoC.r * albedoC.r;
				emissive *= emissive;
				emissive *= emissive;
				emissive = clamp(emissive * 12.0, 0.004, 0.1);

				
					
					
					
					
					
					
				
			}
		
		
		if (moddedfluidX > 0.5) albedo = texture2DLod(texture, texCoord, 100.0) * vec4(color.rgb, 1.0);

    	if (water < 0.5) albedo.rgb = pow(albedo.rgb, vec3(2.2));

		float fresnel = clamp(1.0 + dot(newNormal, nViewPos), 0.0, 1.0);
		float fresnel2 = fresnel * fresnel;
		float fresnel4 = fresnel2 * fresnel2;

		
			float skyLightFactor = lightmap.y * lightmap.y;
		
			
				  
		
			
		

		float lViewPosT = 0.0;
		float difT = 0.0;
		vec3 terrainColor = vec3(0.0);
		vec3 combinedWaterColor = vec3(0.0);
		if (water > 0.5) {
			vec3 customWaterColor = vec3(waterColor.rgb * waterColor.rgb * 3.0 * waterColor.a);
			
				vec3 vanillaWaterColor = pow(color.rgb, vec3(2.2)) * waterColor.a;
				vec3 combinedWaterColor = mix(customWaterColor, vanillaWaterColor, 0.0);
			
				
			

			
				
					albedo.a = 0.50;
					if (isEyeInWater == 1) {
						albedo.a = 1.0 - pow2(pow2(1.0 - albedo.a * min(fresnel2, 1.0)));
						albedo.a = max(albedo.a, 0.0002);
					}
				
					
				
				albedo.rgb = combinedWaterColor;
			
			
			
				
				
			
			
			
				
				
				
				
				
				
			

			if (isEyeInWater == 0) {
				
					
				
				vec2 texCoordT = gl_FragCoord.xy / vec2(viewWidth, viewHeight);
				float depthT = texture2D(depthtex1, texCoordT).r;
				vec3 screenPosT = vec3(texCoordT, depthT);
				
					vec3 viewPosT = ScreenToView(vec3(TAAJitter(screenPosT.xy, -0.5), screenPosT.z));
				
					
				
				lViewPosT = length(viewPosT);
				difT = (lViewPosT - lViewPos);
				albedo.a = GetWaterOpacity(albedo.a, difT, fresnel, lViewPos);
			}
		}

		
			
		

		if (water < 0.5) vlAlbedo = mix(vec3(1.0), albedo.rgb, sqrt1(albedo.a)) * (1.0 - pow(albedo.a, 64.0)) - vec3(0.002);
		else vlAlbedo = vec3(0.0, 0.0, 1.0);

		float NdotL = clamp(dot(newNormal, lightVec) * 1.01 - 0.01, 0.0, 1.0);

		float quarterNdotU = clamp(0.25 * dot(newNormal, upVec) + 0.75, 0.5, 1.0);
			  quarterNdotU*= quarterNdotU;

		float parallaxShadow = 1.0;
		float materialAO = 1.0;

		float subsurface = 0.0;
		
			
				
			
		
		
		vec3 shadow = vec3(0.0);
		vec3 lightAlbedo = vec3(0.0);
		GetLighting(albedo.rgb, shadow, lightAlbedo, viewPos, lViewPos, worldPos, lightmap, color.a, NdotL, quarterNdotU,
				    parallaxShadow, emissive, subsurface, 0.0, materialAO);
		
		float dither = Bayer64(gl_FragCoord.xy);

		
			
				
				
				
				
				
				

				
				
				
				
					  
					  
					  
				

				
				
			
		

		
			//offset because consistency
					vec3 lightME = mix(lightMorning, lightEvening, mefade);
					vec3 lightDayTint = lightDay * lightME * 1.40;
					vec3 lightDaySpec = mix(lightME, sqrt(lightDayTint), timeBrightness);
					vec3 specularColor = mix(sqrt(lightNight*0.3),
												lightDaySpec,
												sunVisibility);
					
						if (isEyeInWater == 1) specularColor *= underwaterColor.rgb * 8.0;
					
					specularColor *= specularColor;
		
		
			
		

		if (water > 0.5 || moddedfluid > 0.5 || (translucent > 0.5 && albedo.a < 0.95)) {
			vec4 reflection = vec4(0.0);
			vec3 skyReflection = vec3(0.0);

			fresnel = fresnel4 * 0.95 + 0.05;
			fresnel *= max(1.0 - isEyeInWater * 0.5 * water, 0.5);
			fresnel *= 1.0 - translucent * (1.0 - albedo.a);

			
				vec3 refNormal = mix(newNormal, normal, pow2(pow2(fresnel4)));
				reflection = SimpleReflection(viewPos, refNormal, dither, skyLightFactor);
			
			
			
				
					
					

					
						
						
						
						
					
					
					
						
						
							
								
								
								
								
								

								
							
								
							

							
								
							
						
						
							
								
								
								
							
						
						
						
							
						

						
						
							
							
								
							
							
							
								
									
									
								
							
						
						
					

					
						
					

					
						
							
							
								
								
								
								
							
						
						
							
							
							
							
						
						
						
					

					
						
						
						
						
						
					
				
			

			reflection.rgb = max(mix(skyReflection, reflection.rgb, reflection.a), vec3(0.0));
			
			albedo.rgb = mix(albedo.rgb, reflection.rgb, fresnel);
			//if (lightmap.y < 0.998) albedo = vec4(1.0, 0.0, 1.0, 1.0);
		}

		if (tintedGlass > 0.5) {
			albedo.a = sqrt2(albedo.a);
		}

		vec3 extra = vec3(0.0);
		
			
		
		
			
			
			
			
			
		

		albedo.rgb = startFog(albedo.rgb, nViewPos, lViewPos, worldPos, extra, NdotU);

		
			
				
			
				
			
			

    
        
    
        
    
        

    
    






    

    



    
    
    
    
    

            
    

    
    

			
		
	} else albedo.a = 0.0;

	
		
		
	

    /* DRAWBUFFERS:01 */
    gl_FragData[0] = albedo;
	gl_FragData[1] = vec4(vlAlbedo, 1.0);
}



//////////Vertex Shader//////////Vertex Shader//////////Vertex Shader//////////























	

	




	

	
		
	
		
	









    
    
    
    
    
    
    
    
    
    



    
    
    
    
        
    
    



    
                
    
        
    
    



    
    

    
    
        
        
    
    
        
	
    
    
    
        
        
    
    
        
	
    
        
	
    
    
    
        
    
    
    
        
    
    
    
        
    

    
        
    

    



	
	

    
	
	
				
	
	








							
							
							
							
							
							
							
							
						
							   

	
	
	








							
							
							
							
							
							
							
							
						
							   

	
	
	





    
        
        
            
        
    
        
        
            
        
    
        
        
            
        
    

    





	

	
    
	

	
	
	
	
	
						  
						  
								  
	

	
		
		

		
		
		
		
	
    
	
	
	
	
	
	
	
	
		
	

	
	
	
	
	
	

	
	
		
			
		
		
			
		
		
	
	
		
	
	
		
			
		
		
	

    
		
    

	
	
		
		
	
		
		
	
	
	
	
		
	

void main() {
    irisMain();

    if (!(gl_FragData[0].a > 1.0E-4)) {
        discard;
    }
}
