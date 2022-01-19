#version 150 core
#define varying out
#define attribute in
#define gl_Vertex vec4(Position, 1.0)
#define gl_ModelViewProjectionMatrix (gl_ProjectionMatrix * gl_ModelViewMatrix)
#define gl_ModelViewMatrix (iris_ModelViewMat * _iris_internal_translate(iris_ChunkOffset))
#define gl_NormalMatrix mat3(transpose(inverse(gl_ModelViewMatrix)))
#define gl_Normal Normal
#define gl_Color (Color * iris_ColorModulator)
#define gl_MultiTexCoord7  vec4(0.0, 0.0, 0.0, 1.0)
#define gl_MultiTexCoord6  vec4(0.0, 0.0, 0.0, 1.0)
#define gl_MultiTexCoord5  vec4(0.0, 0.0, 0.0, 1.0)
#define gl_MultiTexCoord4  vec4(0.0, 0.0, 0.0, 1.0)
#define gl_MultiTexCoord3  vec4(0.0, 0.0, 0.0, 1.0)
#define gl_MultiTexCoord2  vec4(0.0, 0.0, 0.0, 1.0)
#define gl_MultiTexCoord1 vec4(UV2, 0.0, 1.0)
#define gl_MultiTexCoord0 vec4(UV0, 0.0, 1.0)
#define gl_ProjectionMatrix iris_ProjMat
#define gl_FrontColor iris_FrontColor
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
out float iris_FogFragCoord;
vec4 iris_FrontColor;
uniform mat4 iris_ProjMat;
in vec2 UV0;
in ivec2 UV2;
uniform vec4 iris_ColorModulator;
in vec4 Color;
in vec3 Normal;
uniform mat4 iris_ModelViewMat;
uniform vec3 iris_ChunkOffset;
mat4 _iris_internal_translate(vec3 offset) {
    // NB: Column-major order
    return mat4(1.0, 0.0, 0.0, 0.0,
                0.0, 1.0, 0.0, 0.0,
                0.0, 0.0, 1.0, 0.0,
                offset.x, offset.y, offset.z, 1.0);
}
in vec3 Position;
vec4 ftransform() { return gl_ModelViewProjectionMatrix * gl_Vertex; }
vec4 texture2D(sampler2D sampler, vec2 coord) { return texture(sampler, coord); }
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

varying vec2 texCoord;

varying vec4 color;
varying vec4 position;

//////////Fragment Shader//////////Fragment Shader//////////Fragment Shader//////////


















	

	















	
		
		
		
		
		
		
		

		
			

			
				
				
				
				
					
					
					
					
					
					
				

				

				
				
				
			
			
		
		
		
		
	
		
	




    
		
	

	

	
		
  			
		
  			
		
	
		
			
		
			
		
	

	
		
	

	

    
	
	

	
		
	

	
	
		
			
			
		
			
			
		
	

	
	
		
	
	
	
	

	
		
		

		
			
		
			
		

		
	




//////////Vertex Shader//////////Vertex Shader//////////Vertex Shader//////////


//Uniforms//


uniform float frameTimeCounter;



uniform vec3 cameraPosition;

uniform mat4 shadowProjection, shadowProjectionInverse;
uniform mat4 shadowModelView, shadowModelViewInverse;
uniform mat4 gbufferModelView;

//Attributes//
attribute vec4 mc_Entity;
attribute vec4 mc_midTexCoord;

//Common Variables//

	

	float frametime = frameTimeCounter * 0.75;


vec2 lmCoord = vec2(0.0);

//Includes//
float wavingTime = frametime * 1.00;

const float PI = 3.1415927;
float pi2wt = 6.2831854 * (wavingTime * 24.0);

vec3 calcWave(vec3 pos, float fm, float mm, float ma, float f0, float f1, float f2, float f3, float f4, float f5) {
    vec3 ret;
    float magnitude, d0, d1, d2, d3;
    magnitude = sin(pi2wt * fm + pos.x*0.5 + pos.z*0.5 + pos.y*0.5) * mm + ma;
    d0 = sin(pi2wt * f0);
    d1 = sin(pi2wt * f1);
    d2 = sin(pi2wt * f2);
    ret.x = sin(pi2wt*f3 + d0 + d1 - pos.x + pos.z + pos.y) * magnitude;
    ret.z = sin(pi2wt*f4 + d1 + d2 + pos.x - pos.z + pos.y) * magnitude;
    ret.y = sin(pi2wt*f5 + d2 + d0 + pos.z + pos.y - pos.y) * magnitude;
    return ret * 1.00;
}

vec3 calcMove(in vec3 pos, float lmCoordY, float f0, float f1, float f2, float f3, float f4, float f5, vec3 amp1, vec3 amp2) {
    vec3 move1 = calcWave(pos      , 0.0027, 0.0400, 0.0400, 0.0127, 0.0089, 0.0114, 0.0063, 0.0224, 0.0015) * amp1;
    vec3 move2 = calcWave(pos+move1, 0.0348, 0.0400, 0.0400, f0, f1, f2, f3, f4, f5) * amp2;
    vec3 returner = move1 + move2;
    
        
    
    return returner;
}

float calcLilypadMove(vec3 worldPos, float lmCoordY) {
    float wave = sin(2 * PI * (wavingTime*0.7 + worldPos.x * 0.14 + worldPos.z * 0.07))
                + sin(2 * PI * (wavingTime*0.5 + worldPos.x * 0.10 + worldPos.z * 0.20));
    
        
    
    return wave * 0.0125;
}

vec3 WavingBlocks(vec3 position, float istopv, float lmCoordY) {
    vec3 wave = vec3(0.0);
    vec3 worldpos = position + cameraPosition;

    
    if (mc_Entity.x == 59 && (istopv > 0.9 || fract(worldpos.y + 0.0675) > 0.01)) { // Crops
        if (length(position) < 2.0) wave.xz += position.xz*max(5.0/pow(max(length(position*vec3(8.0,2.0,8.0)-vec3(0.0,2.0,0.0)),2.0),1.0)-0.625,0.0);
        wave += calcMove(worldpos, lmCoordY, 0.0041, 0.0070, 0.0044, 0.0038, 0.0240, 0.0000, vec3(0.4,0.0,0.4), vec3(0.2,0.0,0.2));
    }
    if (mc_Entity.x == 104 && (istopv > 0.9 || fract(worldpos.y + 0.0675) > 0.01)) { // Stems
        wave += calcMove(worldpos, lmCoordY, 0.0041, 0.0070, 0.0044, 0.0038, 0.0240, 0.0000, vec3(0.1,0.4,0.1), vec3(0.05,0.2,0.05));
	}
    
    
    if (mc_Entity.x == 31 && istopv > 0.9) { // Foliage
        if (length(position) < 2.0) wave.xz += position.xz*max(5.0/pow(max(length(position*vec3(8.0,2.0,8.0)-vec3(0.0,2.0,0.0)),2.0),1.0)-0.625,0.0);
        wave += calcMove(worldpos, lmCoordY, 0.0041, 0.0070, 0.0044, 0.0038, 0.0063, 0.0000, vec3(0.8,0.0,0.8), vec3(0.4,0.0,0.4));
    }
    if (mc_Entity.x == 175 || (mc_Entity.x == 176.0 && (istopv > 0.9 || fract(worldpos.y+0.005)>0.01))) { // Double Plants
        wave += calcMove(worldpos, lmCoordY, 0.0041, 0.005, 0.0044, 0.0038, 0.0240, 0.0000, vec3(0.8,0.1,0.8), vec3(0.4,0.0,0.4));
	}
    if (mc_Entity.x == 6 && (istopv > 0.9 || fract(worldpos.y + 0.015) > 0.01)) { // Plants
        wave += calcMove(worldpos, lmCoordY, 0.0041, 0.005, 0.0044, 0.0038, 0.0240, 0.0000, vec3(0.6,0.0,0.6), vec3(0.3,0.0,0.3));
	}
    
    
    if (mc_Entity.x == 18) // Leaves
        wave += calcMove(worldpos, lmCoordY, 0.0040, 0.0064, 0.0043, 0.0035, 0.0037, 0.0041, vec3(0.5,0.5,0.5), vec3(0.25,0.25,0.25));
    
    
    if (mc_Entity.x == 9600) // Vines
        wave += calcMove(worldpos, lmCoordY, 0.0040, 0.0064, 0.0043, 0.0035, 0.0037, 0.0041, vec3(0.25,0.5,0.25), vec3(0.125,0.25,0.125));
    
    
    if (mc_Entity.x == 9100) // Lily Pads
        wave.y += calcLilypadMove(worldpos, lmCoordY);
    

    
        
    

    return wave;
}

float WavingWater(vec3 worldPos) {
	float fractY = fract(worldPos.y + cameraPosition.y + 0.005);
	worldPos += cameraPosition.xyz;

    float waterWaveTime = frametime * 1.25 * 0.8;
	
	float wave = sin(6.28 * (waterWaveTime * 0.7 + worldPos.x * 0.14 + worldPos.z * 0.07)) +
				sin(6.28 * (waterWaveTime * 0.5 + worldPos.x * 0.10 + worldPos.z * 0.20));
	if (fractY > 0.01) return wave * 0.0125;
	else return 0.0;
}



    
        
        
            
        
    
        
        
            
        
    
        
        
            
        
    

    



//Program//
void main() {
	texCoord = gl_MultiTexCoord0.xy;
	color = gl_Color;
	
	lmCoord = (iris_LightmapTextureMatrix * gl_MultiTexCoord1).xy;
	lmCoord = clamp((lmCoord - 0.03125) * 1.06667, 0.0, 1.0);
	
	position = shadowModelViewInverse * shadowProjectionInverse * ftransform();

	mat = 0;
	if (mc_Entity.x == 79) mat = 1; //premult
	if (mc_Entity.x == 7979) mat = 3; //ice
	if (mc_Entity.x == 8) {  //water
		
			
		
		mat = 2;
	}
	
	float istopv = gl_MultiTexCoord0.t < mc_midTexCoord.t ? 1.0 : 0.0;
	position.xyz += WavingBlocks(position.xyz, istopv, lmCoord.y);

	
		
	
	
	gl_Position = shadowProjection * shadowModelView * position;

	float dist = sqrt(gl_Position.x * gl_Position.x + gl_Position.y * gl_Position.y);
	float distortFactor = dist * shadowMapBias + (1.0 - shadowMapBias);

	if (mc_Entity.x ==  31 || mc_Entity.x ==   6 || mc_Entity.x ==  59 || 
		mc_Entity.x == 175 || mc_Entity.x == 176 || mc_Entity.x ==  83 || 
		mc_Entity.x == 104 || mc_Entity.x == 105 || mc_Entity.x == 11019) { // Foliage
		
			// Counter Shadow Bias
			
				float timeAngleM = timeAngle;
			
				
					
				
					
				
			
			const vec2 sunRotationData = vec2(cos(sunPathRotation * 0.01745329251994), -sin(sunPathRotation * 0.01745329251994));
			float ang = fract(timeAngleM - 0.25);
			ang = (ang + (cos(ang * 3.14159265358979) * -0.5 + 0.5 - ang) / 3.0) * 6.28318530717959;
			vec3 sunVec = normalize((gbufferModelView * vec4(vec3(-sin(ang), cos(ang) * sunRotationData) * 2000.0, 1.0)).xyz);
			
				vec3 lightVec = sunVec * ((timeAngle < 0.5325 || timeAngle > 0.9675) ? 1.0 : -1.0);
			
				
			
			vec3 upVec = normalize(gbufferModelView[1].xyz);
			float NdotLm = clamp(dot(upVec, lightVec) * 1.01 - 0.01, 0.0, 1.0) * 0.99 + 0.01;

			float distortBias = distortFactor * shadowDistance / 256.0;
			distortBias *= 8.0 * distortBias;
			float biasFactor = sqrt(1.0 - NdotLm * NdotLm) / NdotLm;
			float bias = (distortBias * biasFactor + 0.05) / shadowMapResolution;

			
				bias += 0.0025 / 16;
			
			gl_Position.z -= bias * 11.0;
		
			
		
	}
	
	gl_Position.xy *= 1.0 / distortFactor;
	gl_Position.z = gl_Position.z * 0.2;
}




