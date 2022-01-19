#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Hurt data|=====#
    execute as @e[tag=nb.sludge_small] store result score @s nb.smSlHurt run data get entity @s HurtTime
#=====|Hurt data|=====#

#=====|Hurt|=====#
    execute positioned ~-0.05 ~0.6 ~0.35 if entity @e[tag=nb.sludge_small,distance=..1,scores={nb.smSlHurt=1..}] unless score @s nb.slDeath matches ..-1 run data modify entity @s HandItems[0].id set value "minecraft:nether_wart_block"
    execute positioned ~-0.05 ~0.6 ~0.35 unless entity @e[tag=nb.sludge_small,distance=..1,scores={nb.smSlHurt=1..}] unless score @s nb.slDeath matches ..-1 run data modify entity @s HandItems[0].id set value "minecraft:moss_block"
#=====|Hurt|=====#