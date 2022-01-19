#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Kill|=====#
    execute positioned ~0.1 ~0.9 ~0.5 unless entity @e[tag=nb.scum_small,distance=..1] run scoreboard players remove @s nb.slDeath 10
    execute positioned ~0.1 ~0.9 ~0.5 unless entity @e[tag=nb.scum_small,distance=..1] unless score @s nb.slDeath matches ..-100 store result entity @s Pose.RightArm[2] float 1 run scoreboard players add @s nb.slDeath 0
    execute positioned ~0.1 ~0.9 ~0.5 unless entity @e[tag=nb.scum_small,distance=..1] if score @s nb.slDeath matches -10 unless entity @s[tag=nb.tinyscum] run summon marker ~ ~ ~ {Tags:["nb.killSmScum"]}
    execute positioned ~0.1 ~0.9 ~0.5 unless entity @e[tag=nb.scum_small,distance=..1] run data merge entity @s {HandItems:[{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-762246645,1158561904,-1464389253,-2146840546],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvN2YyNDc0NmJiODhlZmNhNzU2ZTUwZWMyNGJhYjNlMDRkNTg2YjA4MjViNmQ0MmVhMTI5MjNmYWVjMDYwMzY1MyJ9fX0="}]}}}}]}
    execute positioned ~0.1 ~0.9 ~0.5 unless entity @e[tag=nb.scum_small,distance=..1] if score @s nb.slDeath matches ..-50 positioned as @s run tp @s ~ ~-0.5 ~
    execute as @e[tag=nb.scum_small] at @s positioned ~-0.1 ~-0.9 ~-0.5 unless entity @e[tag=nb.scum_small_display,distance=..1] run tp @s ~ -5345 ~
#=====|Kill|=====#

#=====|Kill display|=====#
    kill @s[scores={nb.slDeath=..-100}]
#=====|Kill display|=====#