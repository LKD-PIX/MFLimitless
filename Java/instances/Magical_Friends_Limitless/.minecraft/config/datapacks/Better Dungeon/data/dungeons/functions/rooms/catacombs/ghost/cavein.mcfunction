#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Timer|=====#
    execute unless score @s nb.gCIT matches 1.. run scoreboard players set @s nb.gCIT 600
    scoreboard players remove @s nb.gCIT 1
#=====|Timer|=====#

#=====|AEC randomizer|=====#
    execute if score @s nb.gCIT matches 0 run summon area_effect_cloud ~ ~ ~ {Tags:["nb.caveinAtk","nb.chance1"]}
    execute if score @s nb.gCIT matches 0 run summon area_effect_cloud ~ ~ ~ {Tags:["nb.caveinAtk","nb.chance2"]}
    execute if score @s nb.gCIT matches 0 run summon area_effect_cloud ~ ~ ~ {Tags:["nb.caveinAtk","nb.chance3"]}
    tag @e[limit=1,sort=random,distance=..0.1,tag=nb.caveinAtk] add nb.select
#=====|AEC randomizer|=====#

#=====|Cavein|=====#
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~1 ~-1 ~ run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~ ~-1 ~ run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~-1 ~-1 ~ run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~ ~-1 ~1 run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~ ~-1 ~-1 run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~1 ~-1 ~1 run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~-1 ~-1 ~-1 run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~1 ~-1 ~-1 run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~-1 ~-1 ~1 run function dungeons:rooms/catacombs/ghost/falling_blocks

    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~1 ~ ~ run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~ ~ ~ run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~-1 ~ ~ run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~ ~ ~1 run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~ ~ ~-1 run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~1 ~ ~1 run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~-1 ~ ~-1 run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~1 ~ ~-1 run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~-1 ~ ~1 run function dungeons:rooms/catacombs/ghost/falling_blocks

    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~1 ~1 ~ run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~ ~1 ~ run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~-1 ~1 ~ run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~ ~1 ~1 run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~ ~1 ~-1 run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~1 ~1 ~1 run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~-1 ~1 ~-1 run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~1 ~1 ~-1 run function dungeons:rooms/catacombs/ghost/falling_blocks
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] positioned ~-1 ~1 ~1 run function dungeons:rooms/catacombs/ghost/falling_blocks
    
    
    execute if entity @e[distance=..0.1,tag=nb.caveinAtk,tag=nb.chance1,tag=nb.select] at @a[tag=nb.dunCurse,distance=..10,limit=1,sort=nearest] run fill ~1 ~-1 ~1 ~-1 ~-5 ~-1 air destroy
#=====|Cavein|=====#