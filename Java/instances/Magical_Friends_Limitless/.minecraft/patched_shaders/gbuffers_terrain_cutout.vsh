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









	

	
	






















	



	
		
		
	

	
		
	

	
		
	

	
		
	



	



	

	



	








	

	



	
	



	

	

 


	



	
	

















	
	
		
		
		
	
	
























	
	
	
	
	
	



								 

								 




    

    
    












	
						  
						  
    
    
    



	



	
	


    

    









	














                                    
                                    
                                    
                                    
                                    
                                    
                                    


	
    



    

    
        
        
            
            
                
                    
                
                
                    
                
            
        

        
    
        
    



    

    
        
    

    



    
    
    
    

    
        
        
        
    
    
    



    
        
            
        
            
        
    
       
    

    


	
		
		
		
	




	
	
	
	
	
	
	
	

	
	


	
	
	
	
	
	

	
		  
		  
	




	

	
		
		
	
		
			
		
			
		
	

	



                 
                 
	
	
	
	
	
	
	
	
		
	

    
		
			
			
				
				
				

				
					
				

				
					
					
					
					

					
								 
					
					
				

				
					
						
						
						
						
					

					
						
						
					
						
					

					
					
					
					
					
					
					
					

					
						
							
							
							
						
						
					
					

					
						
					

					
					

					
						
							
							
							
							
						
						
							
								
							
						
					
				

				
				
					
					
					
					
					
					
					
					
				

				
					
						
						
						
						
					
				
			
		
			
		
		
		
			
			
			
			
			
			
			
			
		

		
			
				
				
				
			
		
		
		

		

		
			
		

		
			
			
			
			
			
			
			
				
			
				
			
			
			
			
				
			
				
			
			
			
			
			
			
			
			
				
			
		

		
			
			
			
			
			
		

		
			
				
			
				
			
		
		
		
			
		
		
			
		
		
			
		
		
		
			
				
				
				
				
				
			
		
    
		
			
				
			
		
			
				
			
				
			
		
			
		
    

	
		

		
			
				
			
				
			
		
			

		
		
			
		
		
			
		
		
		
	

	
	
	
	

	
		
		
					
					
					
		
	

	
		
		
		
		
		
	

	
		
			
				
					
				
				
					
					
					
					
					
				
				
					
				
				
					
				
				
					
				
			
			
		

		
		

		

		




















    
        
            
        
            
        
            
    
        
            
        
            
        
            
        
            
    

    
        
            
        
            
        
            
        
            
    
        
            
        
            
        
            
        
            
    


    
        
            
        
            
        
            
    
        
            
        
            
        
            
        
            
    

    
        
            
        
            
        
            
        
            
    
        
            
        
            
        
            
        
            
    





    
    
    
    


		
	

    

	
	
		
	
	
		
	
	
	

	

    

	
		
		
			
		
			
		
	

	
		
	

    
	
	

	
		
		
		
		
		
		
			

			
			
			
			
			

			
			
			
			
			
				
					
					

					
					
						
						
					
						
						
					
				
			
					
					
					

					
					
						
					
					
					
			
				
			

			
			

			
				
				
			
				
			
		
	

	
		
		
	








							
							
							
							
							
							
							
							
						
							   

	
	
	








							
							
							
							
							
							
							
							
						
							   

	
	
	






    
    



    
    
    
    
    
    
    



    
    
    
    
        

    
    
    

    
    
    
    
    
    
    
                   
    
    
    
    
    
    
    
    
    
    
    



    
        
    
    

    



    
    
    
    
    
    

    
    
    
    
    
    
    
    
    

    
    
    

    
    
    

    
    

    




    

    
    
    

    
    
    

    
    
    
    
    
    
    
    

    
    
    

    
    
    
    
    
    

    
        
        
    

    



    

    
    
    
    
    
    
    
    
    



                          
    

    
        
    

    
                         
    

    
        
    
    
    
	
	
		
	
		
            
                
                
            
		
		    
		
	

    




                  
                  
	
		
			
		
			
		
	
		
	

	
		

		
		
		
	
	
	
		
		
		
		
		

		

		

		
			
		
	
		

		
		
		
	
		
			
		
			
		
		

		
		
		
			
			
			
				
				
				
			
				
				
			
		
	
	
	
	
	
	














    
	



    
    
	
    
        
		
        
        

        
            
                                
            
            
                
            
            
                
                
                    
                    
                        
                    
                
            
            
        
    



    
    
    

    
        
            
        
            
        

        
            
            
            
            
            

            
                
            

            
                
                
                                     
                
                
                    
                
                
                
            
            
            
        
    

    





    
    

    



    

    
    
                              
                              
    
    
    
        
    
        

	





	
		  
		  
		  

		
		
		
			
		
			
		
		
		
		
			
		
		
			
		

	

	






	
	
		
			
			
		
			
		
	
		
	
	
	
	
	
	
	
	
	
		
	
	
		
	

	
		
		
		

		
			
		
		
		
			
			
		

		
			
			
				
				
				
			
		
	
	
	
		
	
		
	

	
		
		

		
		
		
		
		
		
			
		
			
		
			
		
		
			
			
		

		
			
		
			
				
					
						
						
						
							
								
						
						
							
								
						
					
						
						
						
					
				
					
						
						
					
						
					
				
				
			

			
			
				
			

			
			
			
				
				
				
				
				
			

			
			
			
				
				
			
		

		
		
		
			
		
			
		
		
		

		
		

		
			
				
			

			
				
			

    
        
            
                
                    
                        
                    
                        
                    
                    
                    
                    
                    
                        
                    
                
                
                    
                        
                        
                        
                    
                
            
                
                    
                        
                        
                    
                
                
                    
                        
                    
                        
                    
                    
                    
                    
                    
                        
                        
                        
                        
                        
                            
                                
                                
                                
                            
                        
                    
                    
                    
                    
                    
                    
                
            
        
            
                
                    
                    
                
                
                    
                    
                    
                        
                        
                    
                    
                        
                    
                
                
                    
            
                
                    
                    

















                
                    
                    
                        
                        
                        
                        
                    
                        
                            
                            
                            
                        
                        
                            
                            
                        
                    
                
            
        
    
        
            
                
                    
                    
                    
                    
                
                
                    
                        
                        
                        
                            
                        
                        
                            
                        
                            
                        
                            
                                                        
                            
                            
                        
                        
                            
                            
                            
                            
                            
                            
                            
                        
                    
                    
                    
                        
                        

                        
                            
                        
                            
                        
                        
                        
                            
                            
                        
                    
                    
                        
                        
                        
                    
                    
                
            
                
                    
                        
                    
                
                
                    
                    
                    
                    
                    
                
                
                    

                    
                        
                            
                        
                            
                        
                        
                        
                        
                        
                            
                            
                            
                            
                            
                            
                            
                            
                        
                    
                
            
        
            
                
                    
                    
                    
                
                
                    
                    
                    
                    
                    

                    
                    
                        
                        
                    
                
                
                    
                        
                    
                        
                    
                    
                    
                    
                        
                        
                        
                        
                        
                        
                    
                
            
                
                    
                        
                        
                    
                
                
                    
                        
                            
                        
                            
                            
                        
                    
                        
                            
                            
                        
                    
                
            
        
    



    
        
        
        
        
        
    


				
					
					
				

				
				

				
					
					
					
						
						
						
					
				

				
					
					
					
					
					
				
			
			
			
				
					
					
					
					
					
					
					
					
					
					
					
						
							
							
							
							
							
							

							
							
							
							
							

							
							
							
							
							
							
							
								
							
							
								
							
							
								
							
							
								
							
							
						
						
						
					
				

				
									  
									  

				
					
			
		

    	

		
			
				
				
					
					
					
					
					
					
					
					
					
					
					
					
						
						
						
					
				
			
		

		
			
				
				
				
				
				
				
					
				
					
				
				
				
				
				
				
					
				
				
				
				
				
				
			
		

		
			
		

		

		
		
		
		

		
		
			
			
			
				
				
				

				
				
				

				
				
			
		

		
		
			
			
				
				
					
				
			
				
			

			
				
				
					
				
				
					
				
				
					
				
			

			
				
				
				
			
		
		
		
		
					

		
			
				
					
						
							
							
							
								

								
								
								

								
								

								
								
								
								
								

								
													  
													  
								
								
								
								

								
								
								
								

								
								
								

								
								

								

								
							
							
							
						
					

					
					
					
					
												
												
					
						
					
					

					
						
						
							
						
							
						
							
						
						
					
				
				
					
					
						
						
					
					
				
				
				
					
					
													
					
						
					
					
						
						
					
					
				
			

			
				
				
			
		
		
		
			
				
			
				
			
			

    
        
    
        
    
        

    
    






    

    



    
    
    
    
    

            
    

    
    

			
		

		
			
			
		

		
			
		

		
			
				
				
					
					
					
				
			
		
		
			
				
				
					
					
					
				
			
		
	

    
    

	
		
		
		
		

		
			
			
		
	
		
			
			
		
	




//////////Vertex Shader//////////Vertex Shader//////////Vertex Shader//////////


//Uniforms//

uniform float frameTimeCounter;

uniform vec3 cameraPosition;

uniform mat4 gbufferModelView, gbufferModelViewInverse;


uniform int frameCounter;

uniform float viewWidth, viewHeight;


//Attributes//
attribute vec4 mc_Entity;
attribute vec4 mc_midTexCoord;


attribute vec4 at_tangent;


//Common Variables//

	

	float frametime = frameTimeCounter * 0.75;



	float timeAngleM = timeAngle;

	
		
	
		
	


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
    if (mc_Entity.x == 6 && (istopv > 0.9 || fract(worldpos.y + 0.005) > 0.01)) { // Plants
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
void main() {
	vec4 position = gbufferModelViewInverse * gl_ModelViewMatrix * gl_Vertex;
	
	
		
			
			
		
	

	texCoord = (iris_TextureMat * gl_MultiTexCoord0).xy;
	
	lmCoord = (iris_LightmapTextureMatrix * gl_MultiTexCoord1).xy;
	lmCoord = clamp((lmCoord - 0.03125) * 1.06667, 0.0, 1.0);

	normal = normalize(gl_NormalMatrix * gl_Normal);

	
		
			binormal = normalize(gl_NormalMatrix * cross(at_tangent.xyz, gl_Normal.xyz) * at_tangent.w);
			tangent  = normalize(gl_NormalMatrix * at_tangent.xyz);
			
			
				
									  
									  
			
				
				
			
		

		vec2 midCoord = (iris_TextureMat * mc_midTexCoord).st;
		vec2 texMinMidCoord = texCoord - midCoord;

		
			vTexCoordAM.pq  = abs(texMinMidCoord) * 2;
			vTexCoordAM.st  = min(texCoord, midCoord - texMinMidCoord);
			
			vTexCoord.xy    = sign(texMinMidCoord) * 0.5 + 0.5;
		
	
	
	color = gl_Color;
	
	upVec = normalize(gbufferModelView[1].xyz);

	
		
	
	
		
	
	
		
	
	
	mat = 0.0; mipmapDisabling = 0.0; quarterNdotUfactor = 1.0; specB = 0.0;
	
	
		specR = 0.0; specG = 0.0; extraSpecular = 0.0;
	

if (mc_Entity.x ==  31 || mc_Entity.x ==   6 || mc_Entity.x ==  59 || 
    mc_Entity.x == 175 || mc_Entity.x == 176 || mc_Entity.x ==  83 || 
    mc_Entity.x == 104 || mc_Entity.x == 105 || mc_Entity.x == 11019) // Foliage++
    
        
    
    
        
    
        mat = 1.0,
    
    lmCoord.x = clamp(lmCoord.x, 0.0, 0.87), quarterNdotUfactor = 0.0;
    
if (mc_Entity.x == 18 || mc_Entity.x == 9600 || mc_Entity.x == 9100) // Leaves, Vine, Lily Pad
    
        specR = 12.065, specG = 0.003,
    
    
        
    
    mat = 2.0;

if (mc_Entity.x == 10) // Lava
    
        
    
    mat = 4.0,
    specB = 0.25, quarterNdotUfactor = 0.0, color.a = 1.0, lmCoord.x = 0.9,
    color.rgb = normalize(color.rgb) * vec3(1.70 * 1.45);
if (mc_Entity.x == 1010) // Fire
    
        
    
    specB = 0.25, lmCoord.x = 0.98, color.a = 1.0, color.rgb = vec3(1.70 * 0.67);
if (mc_Entity.x == 210) // Soul Fire
    
        
    
    
        
    
    specB = 0.25, lmCoord.x = 0.0, color.a = 1.0, color.rgb = vec3(1.70 * 0.53);

if (mc_Entity.x == 12345) // Custom Emissive
    lmCoord = vec2(0.0), specB = 2.05;

if (mc_Entity.x == 300) // No Vanilla AO
    
        
    
    color.a = 1.0;

if (lmCoord.x > 0.99) // Clamp full bright emissives
    lmCoord.x = 0.9;


    if (mc_Entity.x < 10380.5) {
        if (mc_Entity.x < 10115.5) {
            if (mc_Entity.x < 10052.5) {
                if (mc_Entity.x < 10008.5) {
                    if (mc_Entity.x < 10002.5) {
                        if (mc_Entity.x == 10000) { // Grass Block
                            
                                if (color.b < 0.99) { // Grass Block Grass
                                    specR = 8.034, specG = 0.003;
                                } else // Grass Block Dirt
                            
                                specR = 2.035, specG = 0.003;
                        }
                        else if (mc_Entity.x == 10001) // Snowy Grass Block
                            mat = 136.0, // Separation of Snow and Dirt will be handled in terrainFragment.glsl
                            specR = 2.035;
                        else if (mc_Entity.x == 10002) // Sand
                            specR = 80.004, mat = 3.0;
                    } else {
                        if (mc_Entity.x == 10003) // Stone+, Coal Ore
                            
                                
                            
                            specR = 20.04;
                        else if (mc_Entity.x == 10007) // Dirt, Coarse Dirt, Podzol, Grass Path, Dirt Path, Farmland Dry
                            specR = 2.035, specG = 0.003;
                        else if (mc_Entity.x == 10008) // Glass, Glass Pane
                            specR = 0.8, lmCoord.x = clamp(lmCoord.x, 0.0, 0.87), mipmapDisabling = 1.0;
                    }
                } else {
                    if (mc_Entity.x < 10012.5) {
                        if (mc_Entity.x == 10009) // Snow+, Snow Block
                            specR = 18.037, mat = 3.0;
                        else if (mc_Entity.x == 10010) // Gravel
                            specR = 32.06;
                        else if (mc_Entity.x == 10012) // Cobblestone+, Clay
                            specR = 18.037;
                    } else {
                        if (mc_Entity.x == 10050) // Red Sand
                            specR = 80.115, mat = 3.0;
                        else if (mc_Entity.x == 10051) // Andesite, Diorite, Granite, Basalt+, Tuff, Dripstone+
                            specR = 12.05;
                        else if (mc_Entity.x == 10052) // Terracottas
                            
                                
                            
                            specR = 2.045, mat = 15000.0, color.rgb = vec3(0.03, 1.0, 0.0);
                    }
                }
            } else {
                if (mc_Entity.x < 10106.5) {
                    if (mc_Entity.x < 10102.5) {
                        if (mc_Entity.x == 10053) // Packed Ice, Purpur Block+, Beehive
                            
                                
                            
                            specR = 20.055;
                        else if (mc_Entity.x == 10058) // Blue Ice, Calcite
                            
                                
                            
                            specR = 20.065, extraSpecular = 1.0;
                        else if (mc_Entity.x == 10101) // Birch Log+
                            specR = 3.055;
                        else if (mc_Entity.x == 10102) // Oak Log+
                            specR = 8.055;
                    } else {
                        if (mc_Entity.x == 10103) // Jungle Log+, Acacia Log+
                            specR = 6.055;
                        else if (mc_Entity.x == 10105) // Spruce Log+, Scaffolding, Cartography Table, Bee Nest
                            specR = 6.06;
                        else if (mc_Entity.x == 10106) // Warped Log+
                            specR = 10.07, mat = 124.0,
                            mipmapDisabling = 1.0;
                    }
                } else {
                    if (mc_Entity.x < 10111.5) {
                        if (mc_Entity.x == 10107) // Crimson Log+
                            specR = 10.07, mat = 128.0,
                            mipmapDisabling = 1.0;
                        else if (mc_Entity.x == 10108) // Dark Oak Log+
                            specR = 2.04;		
                        else if (mc_Entity.x == 10111) // Birch Planks+, Fletching Table, Loom
                            
                                
                            
                            specR = 20.036;
                    } else {
                        if (mc_Entity.x == 10112) // Oak Planks+, Jungle Planks+, Bookshelf, Composter
                            
                                
                            
                            specR = 20.055;
                        else if (mc_Entity.x == 10114) // Acacia Planks+, Barrel
                            
                                
                            
                            specR = 20.075;
                        else if (mc_Entity.x == 10115) // Spruce Planks+, Smithing Table
                            
                                
                            
                            specR = 20.12;
                    }
                }
            }
        } else {
            if (mc_Entity.x < 10338.5) {
                if (mc_Entity.x < 10312.5) {
                    if (mc_Entity.x < 10118.5) {
                        if (mc_Entity.x == 10116) // Warped Planks+
                            
                                
                            
                            specR = 12.075;
                        else if (mc_Entity.x == 10117) // Crimson Planks+, Note Block, Jukebox
                            
                                
                            
                            specR = 12.095;
                        else if (mc_Entity.x == 10118) // Dark Oak Planks+
                            specR = 20.4;
                    } else {
                        if (mc_Entity.x == 10300) // Stone Bricks++, Dried Kelp Block
                            
                                
                            
                            specR = 20.09;
                        else if (mc_Entity.x == 10304) // Nether Ores, Blackstone++
                            
                                
                            
                            
                                
                            
                            specR = 12.087, mat = 20000.0, color.rgb = vec3(1.0, 0.7, 1.0);
                        else if (mc_Entity.x == 10308) // Netherrack, Crimson/Warped Nylium
                            
                                
                            
                            specR = 12.087, mat = 20000.0, color.rgb = vec3(1.0, 0.7, 1.0);
                        else if (mc_Entity.x == 10312) // Polished Andesite, Polished Diorite, Polished Granite, Melon
                            specR = 6.085;
                    }
                } else {
                    if (mc_Entity.x < 10328.5) {
                        if (mc_Entity.x == 10316) // Nether Bricks+
                            
                                
                            
                            specR = 12.375, mat = 20000.0, color.rgb = vec3(0.55, 1.0, 1.0);
                        else if (mc_Entity.x == 10320 || mc_Entity.x == 10324) // Iron Block+
                            specR = 6.07, specG = 131.0;
                        else if (mc_Entity.x == 10328) // Gold Block+
                            specR = 8.1, mat = 30000.0, color.rgb = vec3(1.0, 1.0, 1.0), specG = 1.0;
                    } else {
                        if (mc_Entity.x == 10332) // Diamond Block
                            
                                
                            
                            specR = 100.007, mat = 201.0, extraSpecular = 1.0;
                        else if (mc_Entity.x == 10336) // Emerald Block
                            
                                
                            
                            specR = 7.2, mat = 201.0, extraSpecular = 1.0;
                        else if (mc_Entity.x == 10338) { // Block of Amethyst, Budding Amethyst
                            mat = 170.0, extraSpecular = 1.0;
                        }
                            
                    }
                }
            } else {
                if (mc_Entity.x < 10356.5) {
                    if (mc_Entity.x < 10344.5) {
                        if (mc_Entity.x == 10340) // Netherite Block
                            specR = 12.135, specG = 0.7;
                        else if (mc_Entity.x == 10342) // Amethyst Buds/Cluster
                            
                                
                            
                            mat = 170.0;
                        else if (mc_Entity.x == 10344) // Ancient Debris
                            
                                
                            
                            
                                
                            
                            specR = 8.07, specG = 0.7;
                    } else {
                        if (mc_Entity.x == 10348) // Block of Redstone
                            
                                
                            
                            specR = 8.05, specG = 1.0;
                        else if (mc_Entity.x == 10352) // Lapis Lazuli Block
                            
                                
                            
                            specR = 16.11;
                        else if (mc_Entity.x == 10356) // Carpets, Wools
                            specR = 2.02, mat = 15000.0, color.rgb = vec3(0.03, 1.0, 0.0), specG = 0.003, lmCoord.x *= 0.96;
                    }
                } else {
                    if (mc_Entity.x < 10368.5) {
                        if (mc_Entity.x == 10360) // Obsidian
                            
                                
                            
                            specR = 2.15, specG = 0.6, mat = 152.0, extraSpecular = 1.0;
                        else if (mc_Entity.x == 10364) // Enchanting Table
                            specR = 2.15, specG = 0.6, mat = 152.0, extraSpecular = 1.0;
                        else if (mc_Entity.x == 10368) // Chain
                            specR = 0.5, specG = 1.0,
                            lmCoord.x = clamp(lmCoord.x, 0.0, 0.87);
                    } else {
                        if (mc_Entity.x == 10372) // Cauldron, Hopper, Anvils
                            specR = 1.08, specG = 1.0, mat = 160.0,
                            lmCoord.x = clamp(lmCoord.x, 0.0, 0.87);
                        else if (mc_Entity.x == 10376) // Sandstone+
                            specR = 24.029;
                        else if (mc_Entity.x == 10380) // Red Sandstone+
                            specR = 24.085;
                    }
                }
            }
        }
    } else {
        if (mc_Entity.x < 11036.5) {
            if (mc_Entity.x < 10432.5) {
                if (mc_Entity.x < 10408.5) {
                    if (mc_Entity.x < 10392.5) {
                        if (mc_Entity.x == 10384) // Quartz+, Daylight Detector, Honeycomb Block
                            
                                
                            
                            specR = 16.082, extraSpecular = 1.0;
                        else if (mc_Entity.x == 10388) // Chorus Plant, Chorus Flower Age 5
                            mat = 164.0, specR = 6.1,
                            mipmapDisabling = 1.0, lmCoord.x = clamp(lmCoord.x, 0.0, 0.87);
                        else if (mc_Entity.x == 10392) // Chorus Flower Age<=4
                            specB = 5.0001, specR = 5.07,
                            mipmapDisabling = 1.0, lmCoord.x = clamp(lmCoord.x, 0.0, 0.87);
                    } else {
                        if (mc_Entity.x == 10396) // End Stone++, Smooth Stone+, Lodestone, TNT, Pumpkin+, Mushroom Blocks, Deepslate++
                            
                                
                            
                            specR = 12.065;
                        else if (mc_Entity.x == 10400) // Bone Block
                            
                                
                            
                            specR = 8.055;
                        else if (mc_Entity.x == 10404) // Concretes
                            
                                
                            
                            specR = 3.044, mat = 15000.0, color.rgb = vec3(0.03, 1.0, 0.0);
                        else if (mc_Entity.x == 10408) // Concrete Powders
                            specR = 6.014, mat = 15000.0, color.rgb = vec3(0.01, 1.0, 0.0);
                    }
                } else {
                    if (mc_Entity.x < 10420.5) {
                        if (mc_Entity.x == 10412) // Bedrock
                            
                                
                            
                            specR = 16.0675;
                        else if (mc_Entity.x == 10416) // Hay Block, Target
                            specR = 16.085, specG = 0.003, mat = 20000.0, color.rgb = vec3(1.0, 0.0, 0.0);
                        else if (mc_Entity.x == 10420) // Bricks+, Furnaces Unlit, Dispenser, Dropper
                            specR = 10.07;
                    } else {
                        if (mc_Entity.x == 10424) { // Farmland Wet
                            if (dot(upVec, normal) > 0.75) { // Top (Actual Farmland Wet)
                                mat = 172.0;
                            } else {                         // Sides And Bottom (Dirt)
                                specR = 2.035, specG = 0.003;
                            }
                        }
                        else if (mc_Entity.x == 10428) // Crafting Table
                            specR = 24.06;
                        else if (mc_Entity.x == 10432) // Cave Vines With Glow Berries
                            
                                
                            
                            specB = 8.3, mat = 20000.0, color.rgb = vec3(1.2, -5.0, 0.0),
                            mipmapDisabling = 1.0, lmCoord.x = clamp(lmCoord.x, 0.0, 0.87);
                    }
                }
            } else {
                if (mc_Entity.x < 11012.5) {
                    if (mc_Entity.x < 10444.5) {
                        if (mc_Entity.x == 10436) // Prismarine+
                            
                                
                            
                            specR = 3.08, specG = 0.75;
                        else if (mc_Entity.x == 10440) // Dark Prismarine+
                            
                                
                            
                            specR = 3.11, specG = 0.75;
                        else if (mc_Entity.x == 10444) // Glazed Terracottas
                            specR = 0.5;
                    } else {
                        if (mc_Entity.x == 11004) // Glowstone
                            
                                
                            
                            
                                
                            
                            lmCoord.x = 0.87, specB = 3.08, color.rgb = vec3(0.69, 0.65, 0.6),
                            mipmapDisabling = 1.0;
                        else if (mc_Entity.x == 11008) // Sea Lantern
                            
                                
                            
                            specR = 3.1, specG = 0.75,
                            lmCoord.x = 0.85, specB = 16.04,
                            mat = 17000.0, color.rgb = vec3(1.5, 0.67, 2.9),
                            quarterNdotUfactor = 0.0, mipmapDisabling = 1.0;
                        else if (mc_Entity.x == 11012) // Magma Block
                            
                                
                            
                            lmCoord = vec2(0.0), specB = 2.05, color.rgb = vec3(0.85, 0.84, 0.7),
                            quarterNdotUfactor = 0.0, mipmapDisabling = 1.0;
                    }
                } else {
                    if (mc_Entity.x < 11024.5) {
                        if (mc_Entity.x == 11016) // Shroomlight
                            
                                
                            
                            
                                
                            
                            lmCoord.x = 0.81, specB = 16.005,
                            mat = 17000.0, color.rgb = vec3(1.5, 0.8, 1.0),
                            quarterNdotUfactor = 0.0;
                        else if (mc_Entity.x == 11020) // Redstone Lamp Lit
                            
                                
                            
                            lmCoord.x = 0.915, specB = 5.099, color.rgb = vec3(0.6), quarterNdotUfactor = 0.0,
                            specG = 0.63, specR = 0.55, mipmapDisabling = 1.0, extraSpecular = 1.0;
                        else if (mc_Entity.x == 11024) // Redstone Lamp Unlit
                            specG = 0.63, specR = 3.15,	mipmapDisabling = 1.0, extraSpecular = 1.0;
                    } else {
                        if (mc_Entity.x == 11028) // Jack o'Lantern
                            
                                
                            
                            
                                
                            
                            mat = 17000.0, color.rgb = vec3(1.54, 1.0, 1.15),
                            specR = 12.065, lmCoord.x = 0.87, specB = 16.0001, mipmapDisabling = 1.0;
                        else if (mc_Entity.x == 11032) // Beacon
                            
                                
                            
                            mat = 176.0, lmCoord.x = 0.87;
                        else if (mc_Entity.x == 11036) // End Rod
                            
                                
                            
                            
                                
                            
                            specR = 1.0, lmCoord.x = 0.88, mat = 180.0;
                    }
                }
            }
        } else {
            if (mc_Entity.x < 11084.5) {
                if (mc_Entity.x < 11060.5) {
                    if (mc_Entity.x < 11048.5) {
                        if (mc_Entity.x == 11040) // Dragon Egg, Spawner
                            
                                
                            
                            mat = 140.0;
                        else if (mc_Entity.x == 11044) // Redstone Wire
                            
                                
                            
                            specB = smoothstep(0.0, 1.0, pow2(length(color.rgb))) * 0.07;
                        else if (mc_Entity.x == 11048) // Redstone Torch
                            
                                
                            
                            
                                
                            
                            
                                
                            
                            mat = 120.0, lmCoord.x = min(lmCoord.x, 0.86), mipmapDisabling = 1.0;
                    } else {
                        if (mc_Entity.x == 11052) // Redstone Repeater & Comparator Powered
                            
                                
                            
                            mat = 120.0, mipmapDisabling = 1.0;
                        else if (mc_Entity.x == 11056) // Redstone Repeater & Comparator Unpowered
                            
                                
                            
                            mat = 120.0, mipmapDisabling = 1.0;
                        else if (mc_Entity.x == 11060) // Observer
                            
                                
                            
                            specR = 10.07, mat = 120.0, specB = 1000.0;
                    }
                } else {
                    if (mc_Entity.x < 11072.5) {
                        if (mc_Entity.x == 11064) // Command Blocks
                            
                                
                            
                            
                                
                            
                            mat = 132.0, mipmapDisabling = 1.0;
                        else if (mc_Entity.x == 11068) // Lantern
                            
                                
                            
                            lmCoord.x = 0.87, specB = 3.4, mat = 20000.0, color.rgb = vec3(1.0, 0.0, 0.0),
                            specR = 0.5, specG = 1.0;
                        else if (mc_Entity.x == 11072) // Soul Lantern
                            
                                
                            
                            lmCoord.x = min(lmCoord.x, 0.87), specB = 4.15, mat = 20000.0, color.rgb = vec3(0.0, 1.0, 0.0),
                            specR = 0.5, specG = 1.0;
                    } else {
                        if (mc_Entity.x == 11076) // Crimson Fungus, Warped Fungus, Twisting Vines, Weeping Vines
                            quarterNdotUfactor = 0.0,
                            specB = 16.007, mat = 20000.0, color.rgb = vec3(1.0, 0.0, 0.0);
                        else if (mc_Entity.x == 11078) { // Glow Lichen
                            
                                
                                    
                                          
                                          
                                          
                                          
                                
                                    float lightFactor = 1.0;
                                
                                specB = 20.0002 + 0.7 * lightFactor;
                                mat = 17000, color.rgb = vec3(1.11, 0.8, 1.0 + lightFactor * 0.07);
                            
                            lmCoord.x = clamp(lmCoord.x, 0.0, 0.9);
                        }
                        else if (mc_Entity.x == 11080) // Furnaces Lit
                            
                                
                            
                            specR = 10.07, mat = 144.0, lmCoord.x = pow(lmCoord.x, 1.35);
                        else if (mc_Entity.x == 11084) // Torch
                            
                                
                            
                            
                                
                            
                            lmCoord.x = min(lmCoord.x, 0.86), mat = 148.0, mipmapDisabling = 1.0;
                    }
                }
            } else {
                if (mc_Entity.x < 11112.5) {
                    if (mc_Entity.x < 11100.5) {
                        if (mc_Entity.x == 11088) // Soul Torch
                            
                                
                            
                            
                                
                            
                            lmCoord.x = min(lmCoord.x, 0.86), mat = 148.0, mipmapDisabling = 1.0;
                        else if (mc_Entity.x == 11092) // Crying Obsidian, Respawn Anchor
                            
                                
                            
                            
                                
                            
                            specR = 2.15, specG = 0.6, mat = 152.0,
                            specB = 0.75, lmCoord.x = min(lmCoord.x, 0.88), mipmapDisabling = 1.0, extraSpecular = 1.0;
                        else if (mc_Entity.x == 11096) // Campfire, Powered Lever
                            
                                
                            
                            lmCoord.x = min(lmCoord.x, 0.885), mat = 156.0;
                        else if (mc_Entity.x == 11100) // Soul Campfire
                            
                                
                            
                            lmCoord.x = min(lmCoord.x, 0.885), mat = 156.0;
                    } else {
                        if (mc_Entity.x == 11104) // Jigsaw Block, Structure Block
                            
                                
                            
                            specB = 8.003, quarterNdotUfactor = 0.0;
                        else if (mc_Entity.x == 11108) // Sea Pickle
                            
                                
                            
                            specB = 12.0003, lmCoord.x = min(lmCoord.x, 0.885), mipmapDisabling = 1.0;
                        else if (mc_Entity.x == 11110) // Sculk Sensor Inactive
                            specB = 0.01, lmCoord = vec2(0.0);
                        else if (mc_Entity.x == 11111) // Sculk Sensor Active
                            specB = 0.05, lmCoord = vec2(0.0);
                        else if (mc_Entity.x == 11112) // Lit Candles
                            
                                
                            
                            lmCoord.x = clamp(lmCoord.x, 0.0, 0.87);
                    }
                } else {
                    if (mc_Entity.x < 11129.5) {
                        if (mc_Entity.x < 11121.5) {
                            if (mc_Entity.x == 11116) // Diamond Ore, Emerald Ore
                                
                                    
                                
                                
                                    
                                
                                specR = 20.04;
                            else if (mc_Entity.x == 11117) // Deepslate Diamond Ore, Deepslate Emerald Ore
                                
                                    
                                
                                
                                    
                                
                                specR = 12.065;
                            else if (mc_Entity.x == 11120) // Gold Ore, Lapis Ore
                                
                                    
                                
                                
                                    
                                
                                specR = 20.04;
                            else if (mc_Entity.x == 11121) // Deepslate Gold Ore, Deepslate Lapis Ore
                                
                                    
                                
                                
                                    
                                
                                specR = 12.065;
                        } else {
                            if (mc_Entity.x == 11124) // Redstone Ore Unlit
                                
                                    
                                
                                
                                    
                                
                                specR = 20.04;
                            else if (mc_Entity.x == 11125) // Deepslate Redstone Ore Unlit
                                
                                    
                                
                                
                                    
                                
                                specR = 12.065;
                            else if (mc_Entity.x == 11128) // Redstone Ore Lit
                                
                                    
                                
                                
                                    
                                
                                lmCoord.x *= 0.95,
                                specB = 4.27, mat = 174.0,
                                specR = 20.04;
                            else if (mc_Entity.x == 11129) // Deepslate Redstone Ore Lit
                                
                                    
                                
                                
                                    
                                
                                lmCoord.x *= 0.95,
                                specB = 4.27, mat = 174.0,
                                specR = 12.065;
                        }
                    } else {
                        if (mc_Entity.x < 11135.5) {
                            if (mc_Entity.x == 11132) // Iron Ore
                                
                                    
                                        
                                    
                                
                                
                                    
                                
                                specR = 20.04;
                            else if (mc_Entity.x == 11133) // Deepslate Iron Ore
                                
                                    
                                        
                                    
                                
                                
                                    
                                
                                specR = 12.065;
                        } else {
                            if (mc_Entity.x == 11136) // Copper Ore
                                
                                    
                                        
                                    
                                
                                
                                    
                                
                                specR = 20.04;
                            else if (mc_Entity.x == 11137) // Deepslate Copper Ore
                                
                                    
                                        
                                    
                                
                                
                                    
                                
                                specR = 12.065;
                            else if (mc_Entity.x == 11200) // Rails
                                mat = 184.0, lmCoord.x = clamp(lmCoord.x, 0.0, 0.87), mipmapDisabling = 1.0;
                        }
                    }
                }
            }
        }
    }

    // Too bright near a light source fix
    if (mc_Entity.x == 99 || mc_Entity.x == 10324)
        lmCoord.x = clamp(lmCoord.x, 0.0, 0.87);

    // Mipmap Fix
    /*if (mc_Entity.x == 98465498894)
        mipmapDisabling = 1.0; */



    
        
            
                
            
                
            
                
            
                
            
                
        
            
                
            
                
            
                
            
                
        
    
        
            
                
            
                
            
                
            
                
            
                
        
            
                
            
                
            
                
            
                
            
                
            
                
        
    


	mat += 0.25;
	
	const vec2 sunRotationData = vec2(cos(sunPathRotation * 0.01745329251994), -sin(sunPathRotation * 0.01745329251994));
	float ang = fract(timeAngleM - 0.25);
	ang = (ang + (cos(ang * 3.14159265358979) * -0.5 + 0.5 - ang) / 3.0) * 6.28318530717959;
	sunVec = normalize((gbufferModelView * vec4(vec3(-sin(ang), cos(ang) * sunRotationData) * 2000.0, 1.0)).xyz);

	
		
		
	

	float istopv = gl_MultiTexCoord0.t < mc_midTexCoord.t ? 1.0 : 0.0;
	vec3 wave = WavingBlocks(position.xyz, istopv, lmCoord.y);
	position.xyz += wave;

	
		
			
		
		
	
	
	gl_Position = gl_ProjectionMatrix * gbufferModelView * position;

	
		gl_Position.xy = TAAJitter(gl_Position.xy, gl_Position.w);
	
}




