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
varying float mat;
varying float mipmapDisabling, quarterNdotUfactor;
varying float specB;


	varying float specR, specG, extraSpecular;


varying vec2 texCoord, lmCoord;

varying vec3 normal;
varying vec3 sunVec, upVec;

varying vec4 color;


	



	
		
		
	

	
		varying vec4 vTexCoord;
		varying vec4 vTexCoordAM;
	

	
		varying vec3 binormal, tangent;
	



	



	



	



	


//////////Fragment Shader//////////Fragment Shader//////////Fragment Shader//////////


//Uniforms//
uniform int frameCounter;
uniform int isEyeInWater;
uniform int moonPhase;



	uniform int heldItemId, heldItemId2;

	uniform int heldBlockLightValue;
	uniform int heldBlockLightValue2;


uniform float frameTimeCounter;
uniform float nightVision;
uniform float rainStrengthS;
uniform float screenBrightness; 
uniform float viewWidth, viewHeight;

uniform ivec2 eyeBrightnessSmooth;

uniform vec3 fogColor;
uniform vec3 cameraPosition;

uniform mat4 gbufferProjectionInverse;
uniform mat4 gbufferModelViewInverse;
uniform mat4 gbufferModelView;
uniform mat4 shadowProjection;
uniform mat4 shadowModelView;

uniform sampler2D texture;


	uniform sampler2D noisetex;



	
		
		
	

	
		uniform float wetness;
	

	
		
	

	
		uniform mat4 gbufferProjection;
	



	uniform float isDry, isRainy, isSnowy;



	

	



	uniform ivec2 atlasSize;


//Common Variables//
float eBS = eyeBrightnessSmooth.y / 240.0;
float sunVisibility = clamp(dot( sunVec,upVec) + 0.0625, 0.0, 0.125) * 8.0;
float vsBrightness = clamp(screenBrightness, 0.0, 1.0);


	

	float frametime = frameTimeCounter * 0.75;



	vec2 dcdx = dFdx(texCoord.xy);
	vec2 dcdy = dFdy(texCoord.xy);



	vec3 lightVec = sunVec * ((timeAngle < 0.5325 || timeAngle > 0.9675) ? 1.0 : -1.0);

	

 
//Common Functions//
float GetLuminance(vec3 color) {
	return dot(color,vec3(0.299, 0.587, 0.114));
}

float InterleavedGradientNoise() {
	float n = 52.9829189 * fract(0.06711056 * gl_FragCoord.x + 0.00583715 * gl_FragCoord.y);
	return fract(n + frameCounter / 8.0);
}

//Includes//

vec3 blocklightColSqrt = vec3(224, 172, 140) * 0.45 / 255.0;
vec3 blocklightCol = blocklightColSqrt * blocklightColSqrt;










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

    vec4 underwaterColor = vec4(pow(fogColor, vec3(0.33, 0.21, 0.26)) * 1.00 * 0.2, 1.0);

    


vec4 waterColorSqrt = vec4(172, 212, 255, 255.0) * 0.50 / 255.0;
vec4 waterColor = waterColorSqrt * waterColorSqrt;

const float waterFog = 64.0;

const float waterAlpha = 0.50;

	uniform sampler2DShadow shadowtex1;



uniform sampler2DShadow shadowtex0;






uniform sampler2D shadowcolor0;


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

    
        vec3 shadowcol = vec3(0.0);
        if (shadow0 < 1.0) {
            float shadow1 = shadow2D(shadowtex1, vec3(shadowPos.st, shadowPos.z)).x;
            if (shadow1 > 0.9999) {
                
                    
                
                
                    water = texture2D(shadowcolor0, shadowPos.st).r * shadow1;
                
            }
        }

        return shadowcol * (1.0 - shadow0) + shadow0;
    
        
    
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
					

					
						float NdotLm = clamp(dot(normal, lightVec) * 1.01 - 0.01, 0.0, 1.0) * 0.99 + 0.01;
						NdotL = min(NdotL, NdotLm);
					
						
					

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

					
						if (isEyeInWater == 0) {
							water = float(water > 0.99);
							water *= sqrt2(NdotL);
							float shadowSum = (shadow.r + shadow.g + shadow.b) / 3.0;
							water *= pow2(1.0 - shadowSum);
						}
						
							
								
							
						
					
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
			lightingCol *= 0.90;
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
	

	
		
		
		
		
		
	

	
		
			
				
					
				
				
					
					
					
					
					
				
				
					
				
				
					
				
				
					
				
			
			
		

		
		

		

		




















    
        
            
        
            
        
            
    
        
            
        
            
        
            
        
            
    

    
        
            
        
            
        
            
        
            
    
        
            
        
            
        
            
        
            
    


    
        
            
        
            
        
            
    
        
            
        
            
        
            
        
            
    

    
        
            
        
            
        
            
        
            
    
        
            
        
            
        
            
        
            
    





    
    
    
    


		
	

    vec3 blockLighting = blocklightCol * newLightmap * newLightmap;

	vec3 minLighting = vec3(0.000000000001 + (12 * 0.0035 * (vsBrightness*0.0775 + 0.0125)));
	
		minLighting *= (1.0 - eBS);
	
	
		
	
	
	float shade = pow(quarterNdotU, 1.00);

	vec3 emissiveLighting = albedo.rgb * emissive * 20.0 / shade * 1.70;

    float nightVisionLighting = nightVision * 0.25;

	if (smoothLighting > 0.01) {
		smoothLighting = clamp(smoothLighting, 0.0, 1.0);
		
			
		
			smoothLighting = pow(smoothLighting, 0.2 * 5);
		
	} else smoothLighting = 1.0;

	if (materialAO < 1.0) {
		smoothLighting *= pow(materialAO, max(1.0 - shadowTime * length(shadow) * NdotL - lmCoord.x, 0.0));
	}

    albedo *= sceneLighting + blockLighting + emissiveLighting + nightVisionLighting + minLighting;
	albedo *= shade;
	albedo *= smoothLighting;

	
		
		if (water > 0.0 || isEyeInWater == 1) {
		
		
		
		
			vec3 albedoCaustic = albedo;

			float skyLightMap = lightmap.y * lightmap.y * (3.0 - 2.0 * lightmap.y);
			float skyLightMapA = pow2(pow2((1.0 - skyLightMap)));
			float skyLightMapB = skyLightMap > 0.98 ? (1.0 - skyLightMap) * 50.0 : 1.0;
			
			float causticfactor = 1.0 - lightmap.x * 0.8;

			vec3 causticpos = worldPos.xyz + cameraPosition.xyz;
			float caustic = getCausticWaves(causticpos);
			vec3 causticcol = underwaterColor.rgb / 1.00;
			
			
				if (isEyeInWater == 0) {
					causticfactor *= 1.0 - skyLightMapA;
					causticfactor *= 10.0;

					causticcol = sqrt(normalize(waterColor.rgb + vec3(0.01)) * 0.32 * sqrt(1.00));
					
						albedoCaustic = albedo.rgb * causticcol * 3.0;
						causticcol *= 0.53;
					
						
						
					
				} else {
			
					causticfactor *= shadow.g * sqrt2(NdotL) * (1.0 - rainStrengthS);
					causticfactor *= 0.25 - 0.15 * skyLightMapA;
					causticfactor *= skyLightMapB;

					albedoCaustic = (albedo.rgb + albedo.rgb * underwaterColor.rgb * 16.0) * 0.225;
					
						
					
					albedoCaustic += albedo.rgb * underwaterColor.rgb * caustic * sqrt1(lightmap.x) * 4.0 * skyLightMapB;
					causticcol = sqrt(causticcol) * 30.0;
			
				}
			

			vec3 lightcaustic = caustic * causticfactor * causticcol * 1.00;
			albedoCaustic *= 1.0 + lightcaustic;

			
				if (isEyeInWater == 0) albedo = mix(albedo, albedoCaustic, max(water - rainStrengthS, 0.0));
				else albedo = albedoCaustic;
			
				
			
		}
	

	
		
		
	
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



                  
                  
	
		
			
		
			
		
	
		
	

	
		

		
		
		
	
	
	
		
		
		
		
		

		

		

		
			
		
	
		

		
		
		
	
		
			
		
			
		
		

		
		
		
			
			
			
				
				
				
			
				
				
			
		
	
	
	
	
	
	














    
	



    
    
	
    
        
		
        
        

        
            
                                
            
            
                
            
            
                
                
                    
                    
                        
                    
                
            
            
        
    



    
    
    

    
        
            
        
            
        

        
            
            
            
            
            

            
                
            

            
                
                
                                     
                
                
                    
                
                
                
            
            
            
        
    

    





    
    

    



    

    
    
                              
                              
    
    
    
        
    
        

	




float GetPuddles(vec2 pos) {
	float noise = texture2D(noisetex, pos).r;
		  noise+= texture2D(noisetex, pos * 0.5).r    *2.0;
		  noise+= texture2D(noisetex, pos * 0.25).r   *4.0;
		  noise+= texture2D(noisetex, pos * 0.125).r  *8.0;

		noise *= 50 * 0.055;
		noise = max((noise-15.5) * 0.8 - 1.2 , 0.0);
		
			float wetnessM = wetness;
		
			
		
		noise *= wetnessM;
		noise /= sqrt(noise * noise + 1.0);
		
			
		
		
			noise *= isRainy;
		

	noise = clamp((noise - 0.75) * 4.5, 0.0, 1.0);

	return noise;
}



//Program//
void irisMain() {
	vec4 albedo = vec4(0.0);
	if (mipmapDisabling < 0.5) {
		
			
			
		
			albedo = texture2D(texture, texCoord);
		
	} else {
		albedo = texture2DLod(texture, texCoord, 0.0);
	}
	vec3 albedoP = albedo.rgb;
	if (mat < 10000.0) albedo.rgb *= color.rgb;
	albedo.rgb = clamp(albedo.rgb, vec3(0.0), vec3(1.0));
	
	float material = floor(mat); // Ah yes this is a floor mat
	vec3 newNormal = normal;
	vec3 lightAlbedo = vec3(0.0);
	
		
	
	
		
	

	
		float smoothness = 0.0, metalData = 0.0, metalness = 0.0, f0 = 0.0, skymapMod = 0.0;
		vec3 rawAlbedo = vec3(0.0);
		vec4 normalMap = vec4(0.0, 0.0, 1.0, 1.0);

		
			vec2 newCoord = vTexCoord.st * vTexCoordAM.pq + vTexCoordAM.st;
		
		
		
			
			
		

		
			
			
				
				
				
			
		
	
	
	
		float albedocheck = albedo.a;
	
		
	

	if (albedocheck > 0.00001) {
		float foliage = float(material == 1.0);
		float leaves  = float(material == 2.0);

		//Emission
		vec2 lightmap = clamp(lmCoord, vec2(0.0), vec2(1.0));
		float emissive = specB * 4.0;
		
		//Subsurface Scattering
		
			float subsurface = 0.0;
		
			
		
			
		
		
			
			
		

		
			float lAlbedoP = length(albedoP);
		
			if (mat > 10000.0) { // More control over lAlbedoP at the cost of color.rgb
				if (mat < 19000.0) {
					if (mat < 16000) { // 15000 - Difference Based lAlbedoP
						vec3 averageAlbedo = texture2DLod(texture, texCoord, 100.0).rgb;
						lAlbedoP = sqrt2(length(albedoP.rgb - averageAlbedo) + color.r) * color.g * 20.0;
						
							
								
						
						
							
								
						
					} else { // 17000 - Limited lAlbedoP
						lAlbedoP = min(lAlbedoP, color.r) * color.g;
						if (color.b < 2.0) albedo.b *= color.b;
						else albedo.g *= color.b - 2.0;
					}
				} else { 
					if (mat < 25000.0) { // 20000 - Channel Controlled lAlbedoP
						lAlbedoP = length(albedoP * max(color.rgb, vec3(0.0)));
						if (color.g < -0.0001) lAlbedoP = max(lAlbedoP + color.g * albedo.g * 0.1, 0.0);
					} else { // 30000 - Inverted lAlbedoP
						lAlbedoP = max(1.73 - lAlbedoP, 0.0) * color.r + color.g;
					}
				}
				
			}

			//Integrated Emission
			if (specB > 1.02) {
				emissive = pow(lAlbedoP, specB) * fract(specB) * 20.0;
			}

			//Integrated Smoothness
			smoothness = specR;
			if (specR > 1.02) {
				float lAlbedoPsp = lAlbedoP;
				float spec = specR;
				if (spec > 1000.0) lAlbedoPsp = 2.0 - lAlbedoP, spec -= 1000.0;
				smoothness = pow(lAlbedoPsp, spec * 0.1) * fract(specR) * 5.0;
				smoothness = min(smoothness, 1.0);
			}

			//Integrated Metalness+
			metalness = specG;
			if (specG > 10.0) {
				metalness = 3.0 - lAlbedoP * specG * 0.01;
				metalness = min(metalness, 1.0);
			}
		

		//Main
		vec3 screenPos = vec3(gl_FragCoord.xy / vec2(viewWidth, viewHeight), gl_FragCoord.z);
		
			vec3 viewPos = ScreenToView(vec3(TAAJitter(screenPos.xy, -0.5), screenPos.z));
		
			
		
		vec3 worldPos = ViewToWorld(viewPos);
		float lViewPos = length(viewPos.xyz);

		float materialAO = 1.0;
		float cauldron = 0.0;

		
			
				float noRain = float(material == 3.0);
			

			
				
			
if (mat > 100.5 && mat < 10000.0) {
    if (mat < 152.5) {
        if (mat < 132.5) {
            if (mat < 124.5) {
                if (material == 120.0) { // Redstone Stuff
                    
                        float comPos = fract(worldPos.y + cameraPosition.y);
                    
                        
                    
                    if (comPos > 0.18) emissive = float((albedo.r > 0.65 && albedo.r > albedo.b * 1.0) || albedo.b > 0.99);
                    else emissive = float(albedo.r > albedo.b * 3.0 && albedo.r > 0.5) * 0.125;
                    emissive *= max(0.65 - 0.3 * dot(albedo.rgb, vec3(1.0, 1.0, 0.0)), 0.0);
                    if (specB > 900.0) { // Observer
                        emissive *= float(albedo.r > albedo.g * 1.5);
                    }
                }
                else if (material == 124.0) { // Warped Stem+
                    
                        float core = float(albedo.r < 0.1);
                        float edge = float(albedo.b > 0.35 && albedo.b < 0.401 && core == 0.0);
                        emissive = core * 0.195 + 0.035 * edge;
                    
                }
            } else {
                if (material == 128.0) { // Crimson Stem+
                    
                        emissive = float(albedo.b < 0.16);
                        emissive = min(pow2(lAlbedoP * lAlbedoP) * emissive * 3.0, 0.3);
                    
                }
                else if (material == 132.0) { // Command Blocks
                    
                        vec3 comPos = fract(worldPos.xyz + cameraPosition.xyz);
                    
                        
                    
                    comPos = abs(comPos - vec3(0.5));
                    float comPosM = min(max(comPos.x, comPos.y), min(max(comPos.x, comPos.z), max(comPos.y, comPos.z)));
                    emissive = 0.0;
                    if (comPosM < 0.1882) { // Command Block Center
                        vec3 dif = vec3(albedo.r - albedo.b, albedo.r - albedo.g, albedo.b - albedo.g);
                        dif = abs(dif);
                        emissive = float(max(dif.r, max(dif.g, dif.b)) > 0.1) * 25.0;
                        emissive *= float(albedo.r > 0.44 || albedo.g > 0.29);
                        
                            
                                
                                
                                
                            
                        
                    }
                    vec3 dif = abs(vec3(albedo.r - albedo.g, albedo.g - albedo.b, albedo.r - albedo.b));
                    float maxDif = max(dif.r, max(dif.g, dif.b));
                    smoothness = 0.38;
                    if (maxDif < 0.05) smoothness = 0.6;
                    metalness = 1.0;
                }
            }
        } else {
            if (mat < 144.5) {
                if (material == 136.0) { // Snowy Grass Block
                    if (lAlbedoP > 1.0) smoothness = lAlbedoP * lAlbedoP * 0.165;
                    else metalness = 0.003;
                }
                else if (material == 140.0) { // Dragon Egg, Spawner
                    emissive = float(albedo.r + albedo.b > albedo.g * 30.0 && lAlbedoP < 0.6);
                    emissive *= 8.0 + float(lAlbedoP < 0.4) * 100.0;
                    if (albedo.b + albedo.g > albedo.r * 2.0 && lAlbedoP > 0.2) { // Spawner Metal
                        smoothness = 0.385;
                        metalness = 0.8;
                    }
                    if (max(abs(albedo.r - albedo.b), abs(albedo.g - albedo.r)) < 0.01) { // Dragon Egg Subtle Emission
                        emissive = 2.5 * float(lAlbedoP < 0.2);
                    }
                }
                else if (material == 144.0) // Furnaces Lit
                    emissive = 0.75 * float(albedo.r * albedo.r > albedo.b * 4.0 || (albedo.r > 0.9 && (albedo.r > albedo.b || albedo.r > 0.99)));
            } else {
                if (material == 148.0) // Torch, Soul Torch
                    emissive = float(albedo.r > 0.9 || albedo.b > 0.65) * (1.4 - albedo.b * 1.05);
                    /* {
                        #ifndef WORLD_CURVATURE
                            vec3 comPos = fract(worldPos.xyz + cameraPosition.xyz);
                        #else
                            vec3 comPos = fract(oldPosition.xyz + cameraPosition.xyz);
                        #endif
                        comPos = abs(comPos - vec3(0.5));
                        float comPosM = max(max(comPos.x, comPos.y), comPos.z);
                        emissive = clamp(1.0 - comPosM * 2.0, 0.0, 1.0);
                        if (emissive > 0.001) {
                            emissive *= emissive;
                            emissive *= emissive;
                            emissive *= pow(lAlbedoP * 0.7, 4.0) * 0.75;
                            emissive = min(emissive, 0.15);
                        } else emissive = 0.0;
                        lightmap.x = min(emissive * 10.0 + 0.6, 1.05);
                        albedo.rgb = pow(albedo.rgb, vec3(1.4 - lightmap.x));
                    } */
                else if (material == 152.0) { // Obsidian++
                    smoothness = max(smoothness, 0.375);
                    if (specB > 0.5) { // Crying Obsidian, Respawn Anchor
                        emissive = (albedo.b - albedo.r) * albedo.r * 6.0;
                        emissive *= emissive * emissive;
                        emissive = clamp(emissive, 0.05, 1.0);
                        if (lAlbedoP > 1.6 || albedo.r > albedo.b * 1.7) emissive = 1.0;
                    } else {
                        if (lAlbedoP > 0.75) { // Enchanting Table Diamond
                            f0 = smoothness;
                            smoothness = 0.9 - f0 * 0.1;
                            metalness = 0.0;
                        }
                        if (albedo.r > albedo.g + albedo.b) { // Enchanting Table Cloth
                            smoothness = max(smoothness - 0.45, 0.0);
                            metalness = 0.0;
                        }
                    }
                }
            }
        }
    } else {
        if (mat < 170.5) {
            if (mat < 160.5) {
                if (material == 156.0) { // Campfires, Powered Lever
                    if (albedo.g + albedo.b > albedo.r * 2.3 && albedo.g > 0.38 && albedo.g > albedo.b * 0.9) emissive = 0.09;
                    if (albedo.r > albedo.b * 3.0 || albedo.r > 0.8) emissive = 0.65;
                    emissive *= max(1.0 - albedo.b + albedo.r, 0.0);
                    emissive *= lAlbedoP;
                }
                else if (material == 160.0) { // Cauldron, Hopper, Anvils
                    if (color.r < 0.99) { // Cauldron Water
                        cauldron = 1.0, smoothness = 1.0, metalness = 0.0;
                        skymapMod = lmCoord.y * 0.475 + 0.515;
                        
                            noRain = 1.0;
                        
                        
                            albedo.rgb = waterColor.rgb;
                        
                            
                        
                            
                                                        
                            
                            
                        
                        
                            vec2 cauldronCoord1 = texCoord + fract(frametime * 0.003);
                            float cauldronNoise1 = texture2D(noisetex, cauldronCoord1).r;
                            vec2 cauldronCoord2 = texCoord - fract(frametime * 0.003);
                            float cauldronNoise2 = texture2D(noisetex, cauldronCoord2).r;
                            float waveFactor = 0.027 + 0.065 * lightmap.y;
                            normalMap.xy += (0.5 * waveFactor) * (cauldronNoise1 * cauldronNoise2 - 0.3);
                            albedo.rgb *= (1.0 - waveFactor * 0.5) + waveFactor * cauldronNoise1 * cauldronNoise2;
                        
                    }
                    
                    if (albedo.r * 1.5 > albedo.g + albedo.b) { // Cauldron Lava
                        metalness = 0.0;
                        smoothness = 0.0;

                        
                            float comPos = fract(worldPos.y + cameraPosition.y);
                        
                            
                        
                        comPos = fract(comPos);
                        if (comPos > 0.2 && comPos < 0.99) {
                            emissive = 1.0;
                            albedo.rgb *= 1.70 * 0.9;
                        }
                    }
                    if (dot(albedo.rgb, albedo.rgb) > 2.7) { // Cauldron Powder Snow
                        metalness = 0.0;
                        smoothness = pow(lAlbedoP, 1.8037) * 0.185;
                        smoothness = min(smoothness, 1.0);
                    }
                    
                }
            } else {
                if (material == 164.0) { // Chorus Plant, Chorus Flower Age 5
                    if (albedo.g > 0.55 && albedo.r < albedo.g * 1.1) {
                        emissive = 1.0;
                    }
                }
                else if (material == 168.0) { // Emissive Ores Except Redstone
                    float stoneDif = max(abs(albedo.r - albedo.g), max(abs(albedo.r - albedo.b), abs(albedo.g - albedo.b)));
                    float brightFactor = max(lAlbedoP - 1.5, 0.0);
                    float ore = max(max(stoneDif - 0.175 + specG, 0.0), brightFactor);
                    emissive *= sqrt4(ore) * 0.15 * 1.00;
                    metalness = 0.0;
                }
                else if (material == 170.0) { // Block of Amethyst++
                    smoothness = min(pow((max(1.73 - lAlbedoP, 0.0) + 1.0), 0.81) * 0.5, 1.0);

                    
                        
                            vec3 comPos = fract(worldPos.xyz + cameraPosition.xyz);
                        
                            
                        
                        comPos = abs(comPos - vec3(0.5));
                        float comPosM = max(max(comPos.x, comPos.y), comPos.z);
                        emissive = clamp(1.0 - comPosM * 2.0, 0.0, 1.0);
                        if (emissive > 0.001) {
                            float orangeFactor = sqrt1(emissive * sqrt2(1.0 - lmCoord.x));
                            emissive *= emissive;
                            emissive *= emissive;
                            emissive *= pow(lAlbedoP * 0.7, 4.0) * 0.75;
                            emissive = min(emissive, 0.15) * 1.1;
                            albedo.rgb = pow(albedo.rgb, mix(vec3(1.0), vec3(1.0, 1.0, 2.0), orangeFactor));
                            float whiteFactor = pow(clamp(albedo.g * (1.0 + emissive), 0.0, 1.0), 10.0);
                            albedo.rgb = mix(albedo.rgb, vec3(1.0), whiteFactor);
                        } else emissive = 0.0;
                    
                }
            }
        } else {
            if (mat < 176.5) {
                if (material == 172.0) { // Wet Farmland
                    if (lAlbedoP > 0.3) smoothness = lAlbedoP * 0.7;
                    else smoothness = lAlbedoP * 2.7;
                    smoothness = min(smoothness, 1.0);
                }
                else if (material == 174.0) { // Emissive Redstone Ores
                    float stoneDif = max(abs(albedo.r - albedo.g), max(abs(albedo.r - albedo.b), abs(albedo.g - albedo.b)));
                    float brightFactor = max(lAlbedoP - 1.5, 0.0);
                    float ore = max(max(stoneDif - 0.175 + specG, 0.0), brightFactor);
                    emissive *= sqrt4(ore) * 0.11 * 1.00;
                    metalness = 0.0;

                    // Fix white pixels
                    if (emissive > 0.01) {
                        float whitePixelFactor = max(lAlbedoP * lAlbedoP * 2.2, 1.0);
                        albedo.rgb = pow(albedo.rgb, vec3(whitePixelFactor));
                    }
                }
                else if (material == 176.0) { // Beacon
                    
                        vec3 comPos = fract(worldPos.xyz + cameraPosition.xyz);
                    
                        
                    
                    comPos = abs(comPos - vec3(0.5));
                    float comPosM = max(max(comPos.x, comPos.y), comPos.z);
                    if (comPosM < 0.4 && albedo.b > 0.5) { // Beacon Core
                        albedo.rgb = vec3(0.35, 1.0, 0.975);
                        if (lAlbedoP > 1.5) albedo.rgb = vec3(1.0);
                        else if (lAlbedoP > 1.3) albedo.rgb = vec3(0.35, 1.0, 0.975);
                        else if (lAlbedoP > 1.15) albedo.rgb *= 0.86;
                        else albedo.rgb *= 0.78;
                        emissive = 1.5;
                    }
                }
            } else {
                if (material == 180.0) { // End Rod
                    if (lAlbedoP > 1.3) {
                        smoothness = 0.0;
                        emissive = 0.45;
                    }
                }
                else if (material == 184.0) { // Rails
                    if (albedo.r > albedo.g * 2.0 + albedo.b) {
                        if (lAlbedoP > 0.45) { // Rail Redstone Lit
                            emissive = lAlbedoP;
                        } else { // Rail Redstone Unlit
                            smoothness = 0.4;
                            metalness = 1.0;
                        }
                    } else {
                        if (albedo.r > albedo.g + albedo.b || abs(albedo.r - albedo.b) < 0.1) { // Rail Gold, Rail Iron
                            smoothness = 0.4;
                            metalness = 1.0;
                        }
                    }
                }
            }
        }
    }
}


    
        
        
        
        
        
    


				
					
					
				

				f0 = 0.78 * metalness + 0.02;
				metalData = metalness;

				if (material == 201.0) { // Diamond Block, Emerald Block
					f0 = smoothness;
					smoothness = 0.9 - f0 * 0.1;
					if (albedo.g > albedo.b * 1.1) { // Emerald Block
						f0 *= f0 * 1.2;
						f0 *= f0;
						f0 = clamp(f0 * f0, 0.0, 1.0);
					}
				}

				
					float atlasRatio = atlasSize.x / atlasSize.y;
					vec2 mipx = dcdx * atlasSize;
					vec2 mipy = dcdy * atlasSize;
					float delta = max(dot(mipx, mipx), dot(mipy, mipy));
					float miplevel = max(0.5 * log2(delta), 0.0);
				
			
			
			
				
					float packSize = 64.0;
					float lOriginalAlbedo = length(albedoP);
					float normalMult1 = max(0.1 - miplevel, 0.0) * 12.0 * (1.0 - cauldron);
					float normalMult2 = 1.5 * sqrt(1.70);
					float normalClamp1 = 0.05;
					float normalClamp2 = 0.5;
					vec2 checkMult = 1.0 / vTexCoordAM.pq;
					vec2 offsetR = vec2(0.015625 / packSize);
					offsetR.y *= atlasRatio;
					float difSum = 0.0;
					if (normalMult1 > 0.0) {
						for(int i = 0; i < 4; i++) {
							vec2 offset = vec2(0.0, 0.0);
							if (i == 0) offset = vec2( 0.0, offsetR.y);
							if (i == 1) offset = vec2( offsetR.x, 0.0);
							if (i == 2) offset = vec2( 0.0,-offsetR.y);
							if (i == 3) offset = vec2(-offsetR.x, 0.0);
							vec2 offsetCoord = newCoord + offset;

							vec2 checkOffset = offset * checkMult;
							if (i == 0 && vTexCoord.y + checkOffset.y > 1.0) continue;
							if (i == 1 && vTexCoord.x + checkOffset.x > 1.0) continue;
							if (i == 2 && vTexCoord.y + checkOffset.y < 0.0) continue;
							if (i == 3 && vTexCoord.x + checkOffset.x < 0.0) continue;

							float lNearbyAlbedo = length(texture2D(texture, offsetCoord).rgb);
							float dif = lOriginalAlbedo - lNearbyAlbedo;
							if (dif > 0.0) dif = max(dif - normalClamp1, 0.0);
							else           dif = min(dif + normalClamp1, 0.0);
							dif *= normalMult1;
							dif = clamp(dif, -normalClamp2, normalClamp2) * normalMult2;
							if (i == 0) {
								normalMap.y += dif;
							}
							if (i == 1) {
								normalMap.x += dif;
							}
							if (i == 2) {
								normalMap.y -= dif;
							}
							if (i == 3) {
								normalMap.x -= dif;
							}
							difSum += abs(dif);
						}
						float difSumRaw = difSum / normalMult2;
						if (difSumRaw > normalClamp2) normalMap.xy = mix(normalMap.xy, vec2(0.0, 0.0), max(difSumRaw - normalClamp2, 0.0) * 1.0);
					}
				

				mat3 tbnMatrix = mat3(tangent.x, binormal.x, normal.x,
									  tangent.y, binormal.y, normal.y,
									  tangent.z, binormal.z, normal.z);

				if (normalMap.x > -0.999 && normalMap.y > -0.999)
					newNormal = clamp(normalize(normalMap.xyz * tbnMatrix), vec3(-1.0), vec3(1.0));
			
		

    	albedo.rgb = pow(albedo.rgb, vec3(2.2));

		
			
				
				
					
					
					
					
					
					
					
					
					
					
					
					
						
						
						
					
				
			
		

		
			
				
				
				
				
				
				
					
				
					
				
				
				
				
				
				
					
				
				
				
				
				
				
			
		

		
			
		

		float NdotL = clamp(dot(newNormal, lightVec) * 1.01 - 0.01, 0.0, 1.0);

		float fullNdotU = dot(newNormal, upVec);
		float quarterNdotUp = clamp(0.25 * fullNdotU + 0.75, 0.5, 1.0);
		float quarterNdotU = quarterNdotUp * quarterNdotUp;
		if (quarterNdotUfactor < 0.5) quarterNdotU = 1.0;

		float smoothLighting = color.a;
		
			
			
			
				
				
				

				
				
				

				
				
			
		

		float parallaxShadow = 1.0;
		
			rawAlbedo = albedo.rgb * 0.999 + 0.001;
			
				//albedo.rgb *= ao;
				if (metalness > 0.801) {
					albedo.rgb *= (1.0 - metalness*0.65);
				}
			
				
			

			
				
				
					
				
				
					
				
				
					
				
			

			
				
				
				
			
		
		
		vec3 shadow = vec3(0.0);
		GetLighting(albedo.rgb, shadow, lightAlbedo, viewPos, lViewPos, worldPos, lightmap, smoothLighting, NdotL, quarterNdotU,
					parallaxShadow, emissive, subsurface, leaves, materialAO);

		
			
				
					
						if (quarterNdotUp > 0.85) {
							
							if (noRain < 0.1) {
							
								vec2 rainPos = worldPos.xz + cameraPosition.xz;

								skymapMod = lmCoord.y * 16.0 - 15.5;
								float lmCX = pow(lmCoord.x * 1.3, 50.0);
								skymapMod = max(skymapMod - lmCX, 0.0);

								float puddleSize = 0.0025;
								skymapMod *= GetPuddles(rainPos * puddleSize);

								float skymapModx2 = skymapMod * 2.0;
								smoothness = mix(smoothness, 0.8 , skymapModx2);
								metalness  = mix(metalness , 0.0 , skymapModx2);
								metalData  = mix(metalData , 0.0 , skymapModx2);
								f0         = mix(f0        , 0.02, skymapModx2);

								mat3 tbnMatrix = mat3(tangent.x, binormal.x, normal.x,
													  tangent.y, binormal.y, normal.y,
													  tangent.z, binormal.z, normal.z);
								rainPos *= 0.02;
								vec2 wind = vec2(frametime) * 0.01;
								vec3 pnormalMap = vec3(0.0, 0.0, 1.0);
								float pnormalMultiplier = 0.05;

								vec2 pnormalCoord1 = rainPos + vec2(wind.x, wind.y);
								vec3 pnormalNoise1 = texture2D(noisetex, pnormalCoord1).rgb;
								vec2 pnormalCoord2 = rainPos + vec2(wind.x * -1.5, wind.y * -1.0);
								vec3 pnormalNoise2 = texture2D(noisetex, pnormalCoord2).rgb;

								pnormalMap += (pnormalNoise1 - vec3(0.5)) * pnormalMultiplier;
								pnormalMap += (pnormalNoise2 - vec3(0.5)) * pnormalMultiplier;
								vec3 puddleNormal = clamp(normalize(pnormalMap * tbnMatrix),vec3(-1.0),vec3(1.0));

								albedo.rgb *= 1.0 - sqrt(length(pnormalMap.xy)) * 0.8 * skymapModx2 * (rainStrengthS);
								//albedo.rgb *= 0.0;

								vec3 rainNormal = normalize(mix(newNormal, puddleNormal, rainStrengthS));

								newNormal = mix(newNormal, rainNormal, skymapModx2);
							
							}
							
						}
					

					vec3 lightME = mix(lightMorning, lightEvening, mefade);
					vec3 lightDayTint = lightDay * lightME * 1.40;
					vec3 lightDaySpec = mix(lightME, sqrt(lightDayTint), timeBrightness);
					vec3 specularColor = mix(sqrt(lightNight*0.3),
												lightDaySpec,
												sunVisibility);
					
						if (isEyeInWater == 1) specularColor *= underwaterColor.rgb * 8.0;
					
					specularColor *= specularColor;

					
						
						
							
						
							
						
							
						
						
					
				
				
					
					
						
						
					
					
				
				
				
					
					
													
					
						
					
					
						
						
					
					
				
			

			
				smoothness *= 0.5;
				if (extraSpecular > 0.5) smoothness += 0.5;
			
		
		
		
			
				
			
				
			
			

    
        
    
        
    
        

    
    






    

    



    
    
    
    
    

            
    

    
    

			
		

		
			
			
		

		
			
		

		
			
				
				
					
					
					
				
			
		
		
			
				
				
					
					
					
				
			
		
	} else discard;

    /* DRAWBUFFERS:0 */
    gl_FragData[0] = albedo;

	
		/* DRAWBUFFERS:0361 */
		gl_FragData[1] = vec4(smoothness, metalData, skymapMod, 1.0);
		gl_FragData[2] = vec4(EncodeNormal(newNormal), 0.0, 1.0);
		gl_FragData[3] = vec4(rawAlbedo, 1.0);

		
			
			
		
	
		
			
			
		
	
}



//////////Vertex Shader//////////Vertex Shader//////////Vertex Shader//////////


























	

	



	

	
		
	
		
	









    
    
    
    
    
    
    
    
    
    



    
    
    
    
        
    
    



    
                
    
        
    
    



    
    

    
    
        
        
    
    
        
	
    
    
    
        
        
    
    
        
	
    
        
	
    
    
    
        
    
    
    
        
    
    
    
        
    

    
        
    

    



	
	

    
	
	
				
	
	








							
							
							
							
							
							
							
							
						
							   

	
	
	








							
							
							
							
							
							
							
							
						
							   

	
	
	





    
        
        
            
        
    
        
        
            
        
    
        
        
            
        
    

    





	
	
	
		
			
			
		
	

	
	
	
	

	

	
		
			
			
			
			
				
									  
									  
			
				
				
			
		

		
		

		
			
			
			
			
		
	
	
	
	
	

	
		
	
	
		
	
	
		
	
	
	
	
	
		
	


    
    
    
        
    
    
        
    
        
    
    
    

    
        
    
    
        
    
    


    
        
    
    
    
    

    
        
    
    

    
        
    
    
        
    
    


    


    
        
    
    


    


    
        
            
                
                    
                        
                            
                                
                                    
                                
                            
                                
                        
                        
                            
                            
                        
                            
                    
                        
                            
                                
                            
                            
                        
                            
                        
                            
                    
                
                    
                        
                            
                        
                            
                        
                            
                    
                        
                            
                        
                            
                        
                            
                                
                            
                            
                    
                
            
                
                    
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                        
                            
                        
                            
                    
                        
                            
                        
                            
                        
                            
                            
                    
                
                    
                        
                            
                            
                        
                            
                        
                            
                                
                            
                            
                    
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                    
                
            
        
            
                
                    
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                        
                            
                    
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                                
                            
                            
                        
                            
                                
                            
                            
                        
                            
                    
                
                    
                        
                            
                                
                            
                            
                        
                            
                        
                            
                    
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                        
                            
                        
                            
                    
                
            
                
                    
                        
                            
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                                
                            
                            
                    
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                        
                            
                    
                
                    
                        
                            
                                
                            
                            
                        
                            
                        
                            
                            
                    
                        
                            
                            
                        
                            
                        
                            
                    
                
            
        
    
        
            
                
                    
                        
                            
                                
                            
                            
                        
                            
                            
                        
                            
                            
                    
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                        
                            
                    
                
                    
                        
                            
                                
                            
                            
                        
                            
                        
                            
                    
                        
                            
                                
                            
                                
                            
                        
                        
                            
                        
                            
                                
                            
                            
                            
                    
                
            
                
                    
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                        
                            
                    
                        
                            
                                
                            
                            
                                
                            
                            
                            
                        
                            
                                
                            
                            
                            
                            
                            
                        
                            
                                
                            
                            
                            
                    
                
                    
                        
                            
                                
                            
                            
                                
                            
                            
                            
                            
                        
                            
                                
                            
                            
                            
                        
                            
                    
                        
                            
                                
                            
                            
                                
                            
                            
                            
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                                
                            
                            
                    
                
            
        
            
                
                    
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                                
                            
                            
                                
                            
                            
                    
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                    
                
                    
                        
                            
                                
                            
                            
                                
                            
                            
                        
                            
                                
                            
                            
                            
                        
                            
                                
                            
                            
                            
                    
                        
                            
                            
                        
                            
                                
                                    
                                          
                                          
                                          
                                          
                                
                                    
                                
                                
                                
                            
                            
                        
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                                
                            
                            
                    
                
            
                
                    
                        
                            
                                
                            
                            
                                
                            
                            
                        
                            
                                
                            
                            
                                
                            
                            
                            
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                    
                        
                            
                                
                            
                            
                        
                            
                                
                            
                            
                        
                            
                        
                            
                        
                            
                                
                            
                            
                    
                
                    
                        
                            
                                
                                    
                                
                                
                                    
                                
                                
                            
                                
                                    
                                
                                
                                    
                                
                                
                            
                                
                                    
                                
                                
                                    
                                
                                
                            
                                
                                    
                                
                                
                                    
                                
                                
                        
                            
                                
                                    
                                
                                
                                    
                                
                                
                            
                                
                                    
                                
                                
                                    
                                
                                
                            
                                
                                    
                                
                                
                                    
                                
                                
                                
                                
                            
                                
                                    
                                
                                
                                    
                                
                                
                                
                                
                        
                    
                        
                            
                                
                                    
                                        
                                    
                                
                                
                                    
                                
                                
                            
                                
                                    
                                        
                                    
                                
                                
                                    
                                
                                
                        
                            
                                
                                    
                                        
                                    
                                
                                
                                    
                                
                                
                            
                                
                                    
                                        
                                    
                                
                                
                                    
                                
                                
                            
                                
                        
                    
                
            
        
    

    
    
        

    
    




    
        
            
                
            
                
            
                
            
                
            
                
        
            
                
            
                
            
                
            
                
        
    
        
            
                
            
                
            
                
            
                
            
                
        
            
                
            
                
            
                
            
                
            
                
            
                
        
    


	
	
	
	
	
	

	
		
		
	

	
	
	

	
		
			
		
		
	
	
	

	
		
	

void main() {
    irisMain();

// alpha test disabled
}
