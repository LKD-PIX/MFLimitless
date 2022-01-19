#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Spawn|=====#
    summon slime ~ ~ ~ {CustomName:'{"text": "Sludge"}',ActiveEffects:[{Id:14,Amplifier:1,Duration:99999,ShowParticles:0b}],Size:1,Tags:["nb.sludge_large","nb.dungeonSlime","nb.sludge"],Health:30f,Attributes:[{Name:"generic.max_health",Base:30},{Name:"generic.attack_damage",Base:7}]}
    summon armor_stand ~ ~-1.2 ~ {Invisible:1,Tags:["nb.sludge_large_display","nb.sludge_display"],NoGravity:1,Marker:1,Pose:{RightArm:[-15f,-45f,0f],Head:[0f,0f,0f]},ArmorItems:[{},{},{},{id:"minecraft:moss_block",Count:1b}]}
#=====|Spawn|=====#