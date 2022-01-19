#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Kill|=====#
    execute positioned ~ ~1.5 ~ unless entity @e[tag=nb.sludge_large,distance=..1] run scoreboard players remove @s nb.slDeath 10
    execute positioned ~ ~1.5 ~ unless entity @e[tag=nb.sludge_large,distance=..1] unless score @s nb.slDeath matches ..-100 store result entity @s Pose.Head[2] float 1 run scoreboard players add @s nb.slDeath 0
    execute positioned ~ ~1.5 ~ unless entity @e[tag=nb.sludge_large,distance=..1] if score @s nb.slDeath matches -10 unless entity @s[tag=nb.tinySludge] run summon marker ~ ~ ~ {Tags:["nb.killLgSlimes"]}
    execute positioned ~ ~1.5 ~ unless entity @e[tag=nb.sludge_large,distance=..1] run data modify entity @s ArmorItems[3].id set value "minecraft:nether_wart_block"
    execute positioned ~ ~1.5 ~ unless entity @e[tag=nb.sludge_large,distance=..1] if score @s nb.slDeath matches ..-50 positioned as @s run tp @s ~ ~-0.5 ~
    execute as @e[tag=nb.sludge_large] at @s positioned ~ ~-1.5 ~ unless entity @e[tag=nb.sludge_large_display,distance=..1] run tp @s ~ -5345 ~
#=====|Kill|=====#

#=====|Kill display|=====#
    kill @s[scores={nb.slDeath=..-100}]
#=====|Kill display|=====#