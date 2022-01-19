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
uniform float blindFactor;
uniform float far, near;
uniform float frameTimeCounter;
uniform float rainStrengthS;
uniform float screenBrightness; 
uniform float viewWidth, viewHeight, aspectRatio;
uniform float eyeAltitude;

uniform ivec2 eyeBrightnessSmooth;

uniform vec3 cameraPosition;
uniform vec3 fogColor;
uniform vec3 skyColor;

uniform mat4 gbufferProjection, gbufferProjectionInverse;
uniform mat4 gbufferModelViewInverse;
uniform mat4 shadowModelView;
uniform mat4 shadowProjection;

uniform sampler2D colortex0;
uniform sampler2D colortex1;
uniform sampler2D depthtex0;
uniform sampler2D depthtex1;


	uniform sampler2DShadow shadowtex0;
	uniform sampler2DShadow shadowtex1;
	uniform sampler2D shadowcolor0;



	
	
	



	uniform sampler2D noisetex;



	


//Optifine Constants//
const bool colortex2Clear = false;

//Common Variables//
float eBS = eyeBrightnessSmooth.y / 240.0;
float sunVisibility = clamp(dot( sunVec,upVec) + 0.0625, 0.0, 0.125) * 8.0;
float vsBrightness = clamp(screenBrightness, 0.0, 1.0);







float modifiedWorldDay = mod(worldDay, 100.0) + 5.0;
float frametime = frameTimeCounter * 0.75;
float cloudtime = (worldTime + modifiedWorldDay * 24000) * 0.05 * 0.75;






vec3 lightVec = sunVec * (1.0 - 2.0 * float(timeAngle > 0.5325 && timeAngle < 0.9675));

//Common Functions//
float GetLuminance(vec3 color) {
	return dot(color,vec3(0.299, 0.587, 0.114));
}

float GetLinearDepth(float depth) {
   return (2.0 * near) / (far + near - depth * (far - near));
}


	float GetDepth(float depth) {
		return 2.0 * near * far / (far + near - (2.0 * depth - 1.0) * (far - near));
	}

	float GetDistX(float dist) {
		return (far * (dist - near)) / (dist * (far - near));
	}


//Includes//

    vec4 underwaterColor = vec4(pow(fogColor, vec3(0.33, 0.21, 0.26)) * 1.00 * 0.2, 1.0);

    


vec4 waterColorSqrt = vec4(172, 212, 255, 255.0) * 0.50 / 255.0;
vec4 waterColor = waterColorSqrt * waterColorSqrt;

const float waterFog = 64.0;

const float waterAlpha = 0.50;
vec3 sky_ColorSqrt = vec3(136.0, 172.0, 236.0) * 1.10 / 255.0;
vec3 skyColCustom = sky_ColorSqrt * sky_ColorSqrt;

vec3 skyMult = vec3(255, 255, 255) * 1.00 / 255.0;
//Thanks to Jessie for dithering
float Bayer2  (vec2 c) { c = 0.5 * floor(c); return fract(1.5 * fract(c.y) + c.x); }
float Bayer4  (vec2 c) { return 0.25 * Bayer2  (0.5 * c) + Bayer2(c); }
float Bayer8  (vec2 c) { return 0.25 * Bayer4  (0.5 * c) + Bayer2(c); }
float Bayer16 (vec2 c) { return 0.25 * Bayer8  (0.5 * c) + Bayer2(c); }
float Bayer32 (vec2 c) { return 0.25 * Bayer16 (0.5 * c) + Bayer2(c); }
float Bayer64 (vec2 c) { return 0.25 * Bayer32 (0.5 * c) + Bayer2(c); }
float Bayer128(vec2 c) { return 0.25 * Bayer64 (0.5 * c) + Bayer2(c); }
float Bayer256(vec2 c) { return 0.25 * Bayer128(0.5 * c) + Bayer2(c); }
//Water fog is now located in multiple programs in different forms. I will put all of them here when I feel like it.
//Update: It's been multiple months and I'm still feeling too lazy to do it.






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
	
vec4 DistortShadow(vec4 shadowpos, float distortFactor) {
	shadowpos.xy *= 1.0 / distortFactor;
	shadowpos.z = shadowpos.z * 0.2;
	shadowpos = shadowpos * 0.5 + 0.5;

	return shadowpos;
}

void GetShadowSpace(inout vec3 worldposition, inout vec4 vlposition, float shadowdepth, vec2 texCoord) {
	vec4 viewPos = gbufferProjectionInverse * (vec4(texCoord, shadowdepth, 1.0) * 2.0 - 1.0);
	viewPos /= viewPos.w;

	vec4 wpos = gbufferModelViewInverse * viewPos;
	worldposition = wpos.xyz / wpos.w;
	wpos = shadowModelView * wpos;
	wpos = shadowProjection * wpos;
	wpos /= wpos.w;
	
	float distb = sqrt(wpos.x * wpos.x + wpos.y * wpos.y);
	float distortFactor = 1.0 - shadowMapBias + distb * shadowMapBias;
	wpos = DistortShadow(wpos,distortFactor);
	
	
		if (isEyeInWater == 1.0) {
			vec3 worldPos = ViewToWorld(viewPos.xyz);
			vec3 causticpos = worldPos.xyz + cameraPosition.xyz;
			float caustic = getCausticWaves(causticpos.xyz * 0.25);
			wpos.xy *= 1.0 + caustic * 0.0125;
		}
	
	
	vlposition = wpos;
}

//Volumetric light from Robobo1221 (highly modified)
vec3 GetVolumetricRays(float depth0, float depth1, vec3 vlAlbedo, float dither, float cosS) {
	vec3 vl = vec3(0.0);

	
		dither = fract(dither + frameTimeCounter * 16.0);
	
	
	
		float visibility = 0.055;
		if (isEyeInWater == 1) visibility = 0.19;

		float endurance = 1.20;

		
			if (isEyeInWater == 0) endurance *= min(2.0 + rainStrengthS*rainStrengthS - sunVisibility * sunVisibility, 2.0);
			else visibility *= 1.0 + 2.0 * pow(max(cosS, 0.0), 128.0) * float(sunVisibility > 0.5) * (1.0 - rainStrengthS);

			if (endurance >= 1.0) visibility *= max((cosS + endurance) / (endurance + 1.0), 0.0);
			else visibility *= pow(max((cosS + 1.0) / 2.0, 0.0), (11.0 - endurance*10.0));
		
			
			

			
			
		
		
			visibility *= 1.0 - isEyeInCave;
		
	
	
	
		
	

	if (visibility > 0.0) {
		
			
		
			float maxDist = 288.0;
			if (isEyeInWater == 1) maxDist = min(288.0, shadowDistance * 0.75);
		
		
		vec3 worldposition = vec3(0.0);
		vec4 vlposition = vec4(0.0);
		
		vec3 watercol = underwaterColor.rgb / 1.00;
		watercol = pow(watercol, vec3(2.3)) * 55.0;

		
			
		
			float minDistFactor = 11.0;

			minDistFactor *= clamp(far, 128.0, 512.0) / 192.0;

			float fovFactor = gbufferProjection[1][1] / 1.37;
			float x = abs(texCoord.x - 0.5);
			x = 1.0 - x*x;
			x = pow(x, max(3.0 - fovFactor, 0.0));
			minDistFactor *= x;
			maxDist *= x;

			
			
				
			
		

		
			
		
			float addition = 0.5;

			
				int sampleCount = 9;
				if (isEyeInWater == 0) {
					sampleCount = 7;
					minDistFactor *= 0.5;
				}
				float sampleIntensity = 2.5;
			
				
				
			
			
			
				
					
					
						
					
						
					
					
					
					
				
			
			
				
					
					
					
					
					
				
			
		

		for(int i = 0; i < sampleCount; i++) {
			
				
			
				float minDist = 0.0;
				if (isEyeInWater == 0) {
				
					minDist = pow(i + dither + addition, 1.5) * minDistFactor;
				
					
				
				} else minDist = pow2(i + dither + 0.5) * minDistFactor * 0.045;
			

			//if (depth0 >= far*0.9999) break;
			if (minDist >= maxDist) break;

			if (depth1 < minDist || (depth0 < minDist && vlAlbedo == vec3(0.0))) break;

			GetShadowSpace(worldposition, vlposition, GetDistX(minDist), texCoord.st);
			//vlposition.z += 0.00002;

			if (length(vlposition.xy * 2.0 - 1.0) < 1.0) {
				vec3 vlsample = vec3(shadow2D(shadowtex0, vlposition.xyz).z);
			
				if (depth0 < minDist) vlsample *= vlAlbedo;

				
					
					
				
					if (isEyeInWater == 0) {
						
							vl += vlsample * sampleIntensity;
						
							

							
						
					} else {
						vlsample *= watercol;
						float sampleFactor = sqrt(minDist / maxDist);

						
							
						

						vl += vlsample * sampleFactor * 0.55;
					}
				
			} else {
				vl += 1.0;
			}
		}
		vl = sqrt(vl * visibility);

		
		
			
				if (isEyeInWater == 0) {
					float vlPower = max(1.75 - rainStrengthS + sunVisibility*0.25, 1.0);
					vl = pow(vl, vec3(vlPower));
				}
			
				
					
					
				
			
		

		vl *= 0.9;
		vl += vl * dither * 0.19;
	}

	
		
	
	
	return vl;
}




    

    
    
    

    
    
    

    
         
    
    
	
    

    
    
    
    
    

    
    
        

        

        
        
        
        
        

		
        
        
        
            
            
            
            
            
        

        
        
        
        
        
        
        
        
        
        
        
        
    

    
    
    

    




	

    
    
    
    

    
    
    

    

    
    

    
        
    

    
    
    
    
    
    

    
    
    
    
	
	
    
    
    
    
    
    

    
    
    
    
    

    
    
    
	
        
        
        
        
        
    

    
    
    
    
    
	
    

    

    

	
	

	
		
		
		
		
		
	

	
		
		
		
		
		
			
			
				
			
			
				
			
			
		
		
								
								
								

		
	

	
		
		
		
			
		

		
		
		
		
		
		
		
		

		
		
		

		
			
		
			
		
		
		
		
			
		

		

		
		

		
			
			
				
				
				
				
				
				
				
				
				
				
				
					  
					  
				
				
									
									
				
				
				
				
			

			
			
			
				
				
				
				
				
				
			

            
            

            
            
            
            
            

            

            
            
            
            
            
			
			
            	
			
            	
			
            

            

			
		

		
	

	
		
			
				  

			
		

		
			
				
			
			
			
			
			

			
				
			
			
				
			

			
				
			
				
			

			

			

			
			
			

			
				
				
					
					

					
						

					
						
						
						
						

						
										
										
										

						
					
					
				
			

			

			
		
	



	
		
	

	
		
		
		
		
			
		
		
		
		
		
		
		
			
		
		
		
		
			
			
			
		
		
		
		

		
	



	
		
	

	
		
			  

		
	

	
		

		
		
		

		
			
		

		
		
		

		
			
		
			
		

		

		

		
		
		
		
		
		

		
		

		
		
			
			
		

		
			
			

			
					

			
				
				
				
				
				

				
				
				

				
			
			
		

		
		
		
		
		
		
		
		
		
		
		
		

		
			
			
		

		
	



	
		
				

		
	

	
		

		
			
		

		
		
		

		
			
		
			
		

		

		

		
		

		
		
			
			

			
					

			
				
				
				
				
				

				
				

				
			
			
		

		
	

	




	
	
		
		
		
		
		

		
		
		

		

		
		
		

		

		

		
	
	
	





    
		
			
		
			
		

		

		
			
			
			
				
			
			
		
	

    
		
			
		
			
		
        
        
        

		
		
			
		
		
    

    
		
		
		
			
			
				
			
			
		
    

    
		
		

		
		
		
		
			
			
		
			
			
		
		

		
    
	
    
		
		
		
		
		
		
		
		
		
		
    
	
    
		
		

		
			
			
			
		
    
	
	




    
		
			
			
			
		
		
		
		
					
		
		
		
			
			
		
		
		
		
		
		
		
		
		
			
			
            
			
		
		
		
			
		

		
    

    
		
		
		
			
			
			
		
		
		
		
		
    
	
    
		
		
		
		
		
		
		
		
    
	
	



    
    
	
    

	



	
		
		
		
		
	
		
		
		
			
		
	
		
	
	



	
	
	

	



	
	
	
	
	



	
		
			
				
			
			
				
			
		
	
	
	
		
		
		
			
		
	
	
	







	
	

	
	
	
	
	
	

	

	
		
		
		
		

		

		
	

	
		
		
	
		
						 
		
	

	
	
	

	
					

	
	
		
		
		
		
		
		
	

	
	
		
	
    
	
		
	
    
    












							   
							   
							   
							   
							   
							   
							   
							   
							   
							   
							   
							   
							   


	
	

	
	
	

	
		
		
		
		
		
		
	
	
	
	

	

	
		
		
		
		
		
		
	




	
	

	
	
		
		
		              
		
		              
	

	



//Program//
void main() {
    vec4 color = texture2D(colortex0, texCoord.xy);
    vec3 translucent = texture2D(colortex1,texCoord.xy).rgb;
	float z0 = texture2D(depthtex0, texCoord.xy).r;
	float z1 = texture2D(depthtex1, texCoord.xy).r;
	bool water = false;

	if (translucent.b > 0.999 && z1 > z0) {
		water = true;
		translucent = vec3(1.0);
	}

	
		vec4 viewPos = gbufferProjectionInverse * (vec4(texCoord, z0, 1.0) * 2.0 - 1.0);
		viewPos /= viewPos.w;
	

	
		if (water) {
			vec3 worldPos = ViewToWorld(viewPos.xyz);
			vec3 refractPos = worldPos.xyz + cameraPosition.xyz;
			refractPos *= 0.005;
			float refractSpeed = 0.0035 * 1.25;
			vec2 refractPos2 = refractPos.xz + refractPos.y * 0.5 + refractSpeed * frametime;

			vec2 refractNoise = texture2D(noisetex, refractPos2).rg - vec2(0.5);

			float hand = 1.0 - float(z0 < 0.56);
			float d0 = GetLinearDepth(z0);
			float distScale0 = max((far - near) * d0 + near, 6.0);
			float fovScale = gbufferProjection[1][1] / 1.37;
			float refractScale = fovScale / distScale0;
			vec2 refractMult = vec2(0.07 * refractScale);
			refractMult *= hand * 1.00;
			refractNoise *= refractMult;
			vec2 refractCoord = texCoord.xy + refractNoise;

			float waterCheck = float(texture2D(colortex1, refractCoord).b > 0.999);
			float depthCheck0 = texture2D(depthtex0, refractCoord).r;
			float depthCheck1 = texture2D(depthtex1, refractCoord).r;
			float depthDif = GetLinearDepth(depthCheck1) - GetLinearDepth(depthCheck0);
			refractNoise *= clamp(depthDif * 150.0, 0.0, 1.0);
			refractCoord = texCoord.xy + refractNoise;
			if (depthCheck0 >= 0.56) {
				if (waterCheck > 0.95) {
					color.rgb = texture2D(colortex0, refractCoord).rgb;
					if (isEyeInWater == 1) {
						translucent = texture2D(colortex1, refractCoord).rgb;
						if (translucent.b > 0.999) translucent = vec3(1.0);
						z0 = texture2D(depthtex0, refractCoord).r;
						z1 = texture2D(depthtex1, refractCoord).r;
					}
				}
			}
		}
	
    
	
		float dither = Bayer64(gl_FragCoord.xy);
	

	
		
		
		
			
	
	
	
		
	

	if (isEyeInWater == 1 && z0 == 1.0) {
		color.rgb = 0.8 * pow(underwaterColor.rgb * (1.0 - blindFactor), vec3(2.0));
	}

	if (isEyeInWater == 2) color.rgb *= vec3(2.0, 0.4, 0.02);

	
		
			vec3 nViewPos = normalize(viewPos.xyz);
			float cosS = dot(nViewPos, lightVec);
		
			
		
	

	vec3 vl = vec3(0.0);
	vec4 clouds = vec4(0.0);
	
		vec3 vlAlbedo = translucent;
		if (isEyeInWater == 0 && water) vlAlbedo = vec3(0.0);
		float depth0 = GetDepth(z0);
		float depth1 = GetDepth(z1);
		
			vl = GetVolumetricRays(depth0, depth1, vlAlbedo, dither, cosS);
		
		
			
		
	

	


    



    
    

    
    
    
    
    
    
    
    
    
    
    
          
          
          
        
          
        

    
        
            
            
            
            
                
                
                
                
                
            
            
        
            
            
            
            
            
        

        
        
                    
                    
        

        
    

	

	
		
			
			
			
			
			
		
	
	
    /*DRAWBUFFERS:01*/
	gl_FragData[0] = color;
	gl_FragData[1] = vec4(vl, 1.0);

	
    
	
	
}



//////////Vertex Shader//////////Vertex Shader//////////Vertex Shader//////////








	

	
		
	
		
	




	
	
	

	
	
	
	

	

