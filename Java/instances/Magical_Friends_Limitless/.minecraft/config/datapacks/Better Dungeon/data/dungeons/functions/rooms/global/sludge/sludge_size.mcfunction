#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Size Chance|=====#
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.sludgeChance","nb.chance1"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.sludgeChance","nb.chance1"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.sludgeChance","nb.chance2"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.sludgeChance","nb.chance2"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.sludgeChance","nb.chance2"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.sludgeChance","nb.chance3"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.sludgeChance","nb.chance3"]}
    summon area_effect_cloud ~ ~ ~ {Tags:["nb.sludgeChance","nb.chance4"]}
    tag @e[limit=1,sort=random,tag=nb.sludgeChance,distance=..0.1] add nb.spawn
#=====|Size Chance|=====#

#=====|Size|=====#
    execute if entity @e[distance=..0.1,tag=nb.sludgeChance,tag=nb.chance1,tag=nb.spawn] run function dungeons:rooms/global/sludge/tiny/spawn
    execute if entity @e[distance=..0.1,tag=nb.sludgeChance,tag=nb.chance2,tag=nb.spawn] run function dungeons:rooms/global/sludge/small/spawn
    execute if entity @e[distance=..0.1,tag=nb.sludgeChance,tag=nb.chance3,tag=nb.spawn] run function dungeons:rooms/global/sludge/large/spawn
    execute if entity @e[distance=..0.1,tag=nb.sludgeChance,tag=nb.chance4,tag=nb.spawn] run function dungeons:rooms/global/sludge/huge/spawn
#=====|Size|=====#