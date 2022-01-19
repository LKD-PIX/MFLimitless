#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Size Chance|=====#
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.scumChance","nb.chance1"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.scumChance","nb.chance1"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.scumChance","nb.chance2"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.scumChance","nb.chance2"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.scumChance","nb.chance2"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.scumChance","nb.chance3"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.scumChance","nb.chance3"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.scumChance","nb.chance4"]}
    tag @e[limit=1,sort=random,tag=nb.scumChance,distance=..0.1] add nb.spawn
#=====|Size Chance|=====#

#=====|Size|=====#
    execute if entity @e[distance=..0.1,tag=nb.scumChance,tag=nb.chance1,tag=nb.spawn] run function dungeons:rooms/global/scum/tiny/spawn
    execute if entity @e[distance=..0.1,tag=nb.scumChance,tag=nb.chance2,tag=nb.spawn] run function dungeons:rooms/global/scum/small/spawn
    execute if entity @e[distance=..0.1,tag=nb.scumChance,tag=nb.chance3,tag=nb.spawn] run function dungeons:rooms/global/scum/large/spawn
    execute if entity @e[distance=..0.1,tag=nb.scumChance,tag=nb.chance4,tag=nb.spawn] run function dungeons:rooms/global/scum/huge/spawn
#=====|Size|=====#