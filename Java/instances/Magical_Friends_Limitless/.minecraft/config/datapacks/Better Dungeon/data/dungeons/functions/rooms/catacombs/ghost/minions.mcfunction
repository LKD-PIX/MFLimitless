#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Timer|=====#
    execute unless score @s nb.sGM matches 1.. run scoreboard players set @s nb.sGM 100
    scoreboard players remove @s nb.sGM 1
#=====|Timer|=====#

#=====|AEC randomizer|=====|
    execute if score @s nb.sGM matches 0 run summon area_effect_cloud ~ ~ ~ {Tags:["nb.ghostMinionSpawn","nb.chance1"]}
    execute if score @s nb.sGM matches 0 run summon area_effect_cloud ~ ~ ~ {Tags:["nb.ghostMinionSpawn","nb.chance2"]}
    execute if score @s nb.sGM matches 0 run summon area_effect_cloud ~ ~ ~ {Tags:["nb.ghostMinionSpawn","nb.chance3"]}
    execute if score @s nb.sGM matches 0 run summon area_effect_cloud ~ ~ ~ {Tags:["nb.ghostMinionSpawn","nb.chance4"]}

    tag @e[limit=1,sort=random,distance=..0.1,tag=nb.ghostMinionSpawn] add nb.select
#=====|AEC randomizer|=====|

#=====|Result|=====#
    #=====|Blindness|=====#
        # Spawn
            execute at @e[tag=nb.ghostMinionSpawn,tag=nb.chance1,tag=nb.select] run function dungeons:rooms/catacombs/ghost/minions/blindness/spawn
            execute at @e[tag=nb.ghostMinionSpawn,tag=nb.chance2,tag=nb.select] run function dungeons:rooms/catacombs/ghost/minions/sickness/spawn
            execute at @e[tag=nb.ghostMinionSpawn,tag=nb.chance3,tag=nb.select] run function dungeons:rooms/catacombs/ghost/minions/slowness/spawn
            execute at @e[tag=nb.ghostMinionSpawn,tag=nb.chance4,tag=nb.select] run function dungeons:rooms/catacombs/ghost/minions/weakness/spawn
    #=====|Blindness|=====#
#=====|Result|=====#