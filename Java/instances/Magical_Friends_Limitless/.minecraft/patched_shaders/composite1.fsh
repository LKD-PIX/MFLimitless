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
uniform int isEyeInWater;

uniform float blindFactor;
uniform float rainStrengthS;
uniform float screenBrightness; 
uniform float viewWidth, viewHeight;

uniform ivec2 eyeBrightnessSmooth;

uniform vec3 skyColor;

uniform mat4 gbufferProjectionInverse;

uniform sampler2D colortex0;
uniform sampler2D colortex1;


	



	


//Optifine Constants//

	const bool colortex1MipmapEnabled = true;



	


//Common Variables//
float eBS = eyeBrightnessSmooth.y / 240.0;
float sunVisibility = clamp(dot( sunVec,upVec) + 0.0625, 0.0, 0.125) * 8.0;
float sunVisibilityLSM = clamp(dot( sunVec,upVec) + 0.125, 0.0, 0.25) * 4.0;
float vsBrightness = clamp(screenBrightness, 0.0, 1.0);
float rainStrengthSp2 = rainStrengthS * rainStrengthS;
float lightShaftTime = pow(abs(sunVisibility - 0.5) * 2.0, 10.0);
float worldBrightness = max(timeBrightness, moonBrightness);

//Common Functions//
float GetLuminance(vec3 color) {
	return dot(color,vec3(0.299, 0.587, 0.114));
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




    

    
    









//Program//
void main() {
    vec4 color = texture2D(colortex0,texCoord.xy);

	
		
		
		
		
		
		
		
		
	

	
		
		
	
		
			float lod = 1.0;
		
			
		
			
		
		
		
			if (fract(viewHeight / 2.0) > 0.25 || fract(viewWidth / 2.0) > 0.25) 
				lod = 0.0;
		

		float offset = 1.0;
		vec3 vl1 = texture2DLod(colortex1, texCoord.xy + vec2( 0.0,  offset / viewHeight), lod).rgb;
		vec3 vl2 = texture2DLod(colortex1, texCoord.xy + vec2( 0.0, -offset / viewHeight), lod).rgb;
		vec3 vl3 = texture2DLod(colortex1, texCoord.xy + vec2( offset / viewWidth,   0.0), lod).rgb;
		vec3 vl4 = texture2DLod(colortex1, texCoord.xy + vec2(-offset / viewWidth,   0.0), lod).rgb;
		vec3 vlSum = (vl1 + vl2 + vl3 + vl4) * 0.25;
		vec3 vl = vlSum;

		vl *= vl;
	
	vec3 vlP = vl;

	
		if (isEyeInWater == 0) {
			
				vec4 screenPos = vec4(gl_FragCoord.xy / vec2(viewWidth, viewHeight), gl_FragCoord.z, 1.0);
				vec4 viewPos = gbufferProjectionInverse * (screenPos * 2.0 - 1.0);
				viewPos /= viewPos.w;
				vec3 nViewPos = normalize(viewPos.xyz);

				float NdotU = dot(nViewPos, upVec);
				NdotU = max(NdotU, 0.0);
				NdotU = 1.0 - NdotU;
				if (NdotU > 0.5) NdotU = smoothstep(0.0, 1.0, NdotU);
				NdotU *= NdotU;
				NdotU *= NdotU;
				NdotU = mix(NdotU, 1.0, rainStrengthSp2 * 0.75);
				vl *= NdotU * NdotU;
			
				
				
				
				

				
				
				
				
				
				
				
			
			vlP = vl;

			vec3 dayLightCol = lightCol*lightCol*lightCol;
			vec3 nightLightCol = lightCol * lightCol * 20.0;
			vec3 vlColor = mix(nightLightCol, dayLightCol, sunVisibility);
			//duplicate 98765
			vec3 weatherSky = weatherCol * weatherCol;
			weatherSky *= GetLuminance(ambientCol / (weatherSky)) * 1.4;
			weatherSky *= mix(0.30, 0.90, sunVisibility);
			weatherSky = max(weatherSky, skyColor * skyColor * 0.75); // Lightning Sky Color
			weatherSky *= rainStrengthS;
			vlColor = mix(vlColor, weatherSky * 10.0, rainStrengthSp2);
			vl *= vlColor;

			float rainMult = mix(1.50,
									1.50 * (0.65 + 0.2 * vsBrightness),
									sunVisibility);
			
				vl *= mix(1.0, 0.50 * 0.4, timeBrightness * (1.0 - rainStrengthS * 0.8));
				vl *= mix(2.00 * 0.65, 2.0, sunVisibility);
				vl *= mix(1.0, rainMult, rainStrengthSp2);
			
				
				
				
				
				
			
		} else vl *= length(lightCol) * 0.175 * 1.00  * (1.0 - rainStrengthS * 0.85);
	

	
   		
    	
	
		vl *= 0.50 * shadowFade * (1.0 - blindFactor);

		float vlFactor = (1.0 - min((timeBrightness)*2.0, 0.75));
		vlFactor = mix(vlFactor, 0.05, rainStrengthS);
		if (isEyeInWater == 1) vlFactor = 3.0;
		vl *= vlFactor * 1.15;
	

	
		
			
		
	

	
		
	
		vec3 addedColor = color.rgb + vl * lightShaftTime;
		
			vec3 vlMixBlend = vlP * (1.0 - 0.5 * rainStrengthS);
		
			
			
		
		float mixedTime = sunVisibility < 0.5 ?
						  sqrt3(max(moonBrightness - 0.3, 0.0) / 0.7) * lightShaftTime
						  : pow2(pow2((sunVisibilityLSM - 0.5) * 2.0));
		vec3 mixedColor = mix(color.rgb, vl / max(vlP, 0.01), vlMixBlend * mixedTime);
		color.rgb = mix(mixedColor, addedColor, sunVisibility * (1.0 - rainStrengthS));
	

	
		
		
	
	
	/*DRAWBUFFERS:0*/
	gl_FragData[0] = color;
}



//////////Vertex Shader//////////Vertex Shader//////////Vertex Shader//////////








	

	
		
	
		
	




	
	
	

	
	
	
	

	

