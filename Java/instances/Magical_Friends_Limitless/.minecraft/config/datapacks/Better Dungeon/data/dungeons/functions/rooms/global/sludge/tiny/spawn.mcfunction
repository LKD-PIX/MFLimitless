#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Spawn|=====#
    summon slime ~ ~ ~ {CustomName:'{"text": "Sludge"}',ActiveEffects:[{Id:14,Amplifier:1,Duration:99999,ShowParticles:0b}],DeathLootTable:"dungeons:entities/sludge",Size:0,Tags:["nb.sludge_tiny","nb.dungeonSlime","nb.sludge"],Health:10f,Attributes:[{Name:"generic.max_health",Base:10}]}
    summon armor_stand ~0.05 ~-0.27 ~-0.17 {Invisible:1,Tags:["nb.sludge_tiny_display","nb.sludge_display"],NoGravity:1,Marker:1,Small:1b,Pose:{RightArm:[-15f,-45f,0f]},HandItems:[{id:"minecraft:moss_block",Count:1b}]}
#=====|Spawn|=====#