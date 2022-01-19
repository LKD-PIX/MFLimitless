#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Spawn Chance|=====#
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.sizeChance","nb.chance1"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.sizeChance","nb.chance1"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.sizeChance","nb.chance1"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.sizeChance","nb.chance2"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.sizeChance","nb.chance2"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.sizeChance","nb.chance3"]}
    tag @e[limit=1,sort=random,tag=nb.sizeChance,distance=..0.1] add nb.spawn
#=====|Spawn Chance|=====#

#=====|Size|=====#
    execute if entity @e[distance=..0.1,tag=nb.sizeChance,tag=nb.chance1,tag=nb.spawn] run summon slime ~ ~ ~ {Size:0,Health:20f,Attributes:[{Name:"generic.max_health",Base:20}],Tags:["nb.dungeonSlime"]}
    execute if entity @e[distance=..0.1,tag=nb.sizeChance,tag=nb.chance2,tag=nb.spawn] run summon slime ~ ~ ~ {Size:1,Health:30f,Attributes:[{Name:"generic.max_health",Base:20}],Tags:["nb.dungeonSlime"]}
    execute if entity @e[distance=..0.1,tag=nb.sizeChance,tag=nb.chance3,tag=nb.spawn] run summon slime ~ ~ ~ {Size:2,Health:40f,Attributes:[{Name:"generic.max_health",Base:20}],Tags:["nb.dungeonSlime"]}
#=====|Size|=====#