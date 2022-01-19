#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Spawn|=====#
    summon slime ~ ~ ~ {CustomName:'{"text": "Sludge"}',ActiveEffects:[{Id:14,Amplifier:1,Duration:99999,ShowParticles:0b}],Size:1,Tags:["nb.sludge_small","nb.dungeonSlime","nb.sludge"],Health:20f,Attributes:[{Name:"generic.max_health",Base:20},{Name:"generic.attack_damage",Base:5}]}
    summon armor_stand ~0.05 ~-0.6 ~-0.35 {Invisible:1,Tags:["nb.sludge_small_display","nb.sludge_display"],NoGravity:1,Marker:1,Pose:{RightArm:[-15f,-45f,0f]},HandItems:[{id:"minecraft:moss_block",Count:1b}]}
#=====|Spawn|=====#