#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Kill|=====#
    execute positioned ~-0.05 ~0.4 ~0.17 unless entity @e[tag=nb.sludge_tiny,distance=..1.2] run scoreboard players remove @s nb.slDeath 10
    execute positioned ~-0.05 ~0.4 ~0.17 unless entity @e[tag=nb.sludge_tiny,distance=..1.2] unless score @s nb.slDeath matches ..-100 store result entity @s Pose.RightArm[2] float 1 run scoreboard players add @s nb.slDeath 0
    execute positioned ~-0.05 ~0.4 ~0.17 unless entity @e[tag=nb.sludge_tiny,distance=..1.2] run data modify entity @s HandItems[0].id set value "minecraft:nether_wart_block"
    execute positioned ~-0.05 ~0.4 ~0.17 unless entity @e[tag=nb.sludge_tiny,distance=..1.2] if score @s nb.slDeath matches ..-50 positioned as @s run tp @s ~ ~-0.5 ~
    execute as @e[tag=nb.sludge_tiny] at @s positioned ~-0.05 ~0.2 ~0.17 unless entity @e[tag=nb.sludge_tiny_display,distance=..1.2] run tp @s ~ -5345 ~
#=====|Kill|=====#

#=====|Kill display|=====#
    kill @s[scores={nb.slDeath=..-100}]
#=====|Kill display|=====#