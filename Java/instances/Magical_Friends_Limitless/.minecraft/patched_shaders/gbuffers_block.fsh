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
varying vec2 texCoord, lmCoord;

varying vec3 normal;
varying vec3 sunVec, upVec;

varying vec4 color;


	



	varying float fullLightmap;



	
		
		
	

	
		
		
	

	
		
	

	
		
	


//////////Fragment Shader//////////Fragment Shader//////////Fragment Shader//////////


//Uniforms//
uniform int blockEntityId;
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
uniform mat4 shadowProjection;
uniform mat4 shadowModelView;

uniform sampler2D texture;


	uniform sampler2D noisetex;



	
	



	uniform sampler2D colortex9;



	


//Common Variables//
float eBS = eyeBrightnessSmooth.y / 240.0;
float sunVisibility = clamp(dot( sunVec,upVec) + 0.0625, 0.0, 0.125) * 8.0;
float vsBrightness = clamp(screenBrightness, 0.0, 1.0);


	

	float frametime = frameTimeCounter * 0.75;



	
	



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



                  
                  
	
		
			
		
			
		
	
		
	

	
		

		
		
		
	
	
	
		
		
		
		
		

		

		

		
			
		
	
		

		
		
		
	
		
			
		
			
		
		

		
		
		
			
			
			
				
				
				
			
				
				
			
		
	
	
	
	
	
	





    
	



    
    
	
    
        
		
        
        

        
            
                                
            
            
                
            
            
                
                
                    
                    
                        
                    
                
            
            
        
    



    
    
    

    
        
            
        
            
        

        
            
            
            
            
            

            
                
            

            
                
                
                                     
                
                
                    
                
                
                
            
            
            
        
    

    




//Program//
void irisMain() {
    vec4 albedoP = texture2D(texture, texCoord);
    vec4 albedo = albedoP * color;
	
	vec3 newNormal = normal;
	
	float skymapMod = 0.0;
	float emissive = 0.0;

	float signBlockEntity = float(blockEntityId == 63);

	
		float smoothness = 0.0, metalData = 0.0, metalness = 0.0, f0 = 0.0;
		vec3 rawAlbedo = vec3(0.0);
		vec4 normalMap = vec4(0.0, 0.0, 1.0, 1.0);

		
			
		
		
		
			
			
			
		
		
		
			
				
				
			
		
	
	
	
		float albedocheck = albedo.a;
	
		
	

	if (albedocheck > 0.00001) {
		if (albedo.a > 0.99) albedo.a = 1.0;

		vec2 lightmap = clamp(lmCoord, vec2(0.0), vec2(1.0));

		float subsurface = float(blockEntityId == 983);

		vec3 screenPos = vec3(gl_FragCoord.xy / vec2(viewWidth, viewHeight), gl_FragCoord.z);
		
			vec3 viewPos = ScreenToView(vec3(TAAJitter(screenPos.xy, -0.5), screenPos.z));
		
			
		
		vec3 worldPos = ViewToWorld(viewPos);

		float lViewPos = length(viewPos.xyz);

		float ao = 1.0;
		
			
				
			
				if (blockEntityId == 12001) { // Conduit
					emissive = float(albedo.b > albedo.r) * pow2(length(albedo.rgb));
				}

				
					
				
			
			
			
				
					
					
					
					
					
					
					
					
					
					
					
					
					
						
							
							
							
							
							
							

							
							
							
							
							

							
							
							
							
							
							
							
								
							
							
								
							
							
								
							
							
								
							
							
						
						
						
					
				

				
									  
									  

				
					
			
		

		float quarterNdotU = clamp(0.25 * dot(newNormal, upVec) + 0.75, 0.5, 1.0);
			  quarterNdotU*= quarterNdotU * (subsurface > 0.5 ? 1.8 : 1.0);

		
			
			
				
					
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
						
					

					
						
						
						
						
						
						

						
						
							
							
							
							
						
							
							
								
								
								
								
							
								
								
								
								
							
						
						

						
						
						
						
						
						
					
					
						
					
				
					
					
				
				
			
		

    	albedo.rgb = pow(albedo.rgb, vec3(2.2));

		
			
		
		
		float NdotL = clamp(dot(newNormal, lightVec) * 1.01 - 0.01, 0.0, 1.0);

		float parallaxShadow = 1.0;
		float materialAO = 1.0;
		
			rawAlbedo = albedo.rgb * 0.999 + 0.001;
			
				albedo.rgb *= ao;
				if (metalness > 0.80) {
					albedo.rgb *= (1.0 - metalness*0.65);
				}
			
				
				
			

			float doParallax = 0.0;
			
				
					
				
				
					
				
				
				
					
					
				
			
		

		
			if (color.r + color.g + color.b <= 2.99 && signBlockEntity > 0.5) {
				
					if (fullLightmap < 0.5)
				
				albedo.rgb *= 8.0;
				NdotL = 0.0;
			}
		
		
			if (blockEntityId == 10364) { // Enchanting Table Book
				float ETBEF = albedo.r + albedo.g - albedo.b * 4.0;
				if (ETBEF > 0.7) { 
					emissive = 0.25;
				}
			}
		
		if (blockEntityId == 11032) { // Beacon Beam
			lightmap = vec2(0.0, 0.0);
			// duplicate 39582069
			
				emissive = length(albedoP.rgb);
				emissive *= emissive;
				emissive *= emissive;
				if (color.a < 0.9) emissive = pow2(emissive * emissive) * 0.01;
				else emissive = emissive * 0.1;
			
				
			
		}
		
		vec3 shadow = vec3(0.0);
		vec3 lightAlbedo = vec3(0.0);
		GetLighting(albedo.rgb, shadow, lightAlbedo, viewPos, lViewPos, worldPos, lightmap, color.a, NdotL, quarterNdotU,
					parallaxShadow, emissive, subsurface, 0.0, materialAO);

		//albedo.rgb = vec3(lightmap.y);

		
			
				
					vec3 lightME = mix(lightMorning, lightEvening, mefade);
					vec3 lightDayTint = lightDay * lightME * 1.40;
					vec3 lightDaySpec = mix(lightME, sqrt(lightDayTint), timeBrightness);
					vec3 specularColor = mix(sqrt(lightNight*0.3),
												lightDaySpec,
												sunVisibility);
					
						if (isEyeInWater == 1) specularColor *= underwaterColor.rgb * 8.0;
					
					specularColor *= specularColor;

					
						
						
							
						
							
						
							
						
						
					
				
				
					
				
				
				
					
													
					
						
					
					
						
						
					
					
					
				
			

			
				smoothness *= 0.5;
			
		
		
		
			
				
			
				
			
			

    
        
    
        
    
        

    
    






    

    



    
    
    
    
    

            
    

    
    

			
		

		
			
			
		
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

    if (!(gl_FragData[0].a > 0.1)) {
        discard;
    }
}
