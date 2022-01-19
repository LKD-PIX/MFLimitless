#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Hurt data|=====#
    execute as @e[tag=nb.scum_large] store result score @s nb.smSlHurt run data get entity @s HurtTime
#=====|Hurt data|=====#

#=====|Hurt|=====#
    execute positioned ~ ~1.7 ~ if entity @e[tag=nb.scum_large,distance=..3,scores={nb.smSlHurt=1..}] unless score @s nb.slDeath matches ..-1 run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-762246645,1158561904,-1464389253,-2146840546],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvN2YyNDc0NmJiODhlZmNhNzU2ZTUwZWMyNGJhYjNlMDRkNTg2YjA4MjViNmQ0MmVhMTI5MjNmYWVjMDYwMzY1MyJ9fX0="}]}}}}]}
    execute positioned ~ ~1.7 ~ unless entity @e[tag=nb.scum_large,distance=..3,scores={nb.smSlHurt=1..}] unless score @s nb.slDeath matches ..-1 run data merge entity @s {ArmorItems:[{},{},{},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;1975380144,-1933357559,-1346623821,797845941],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvYzUwY2Y5NTU2Njg5OTVlMTcwOWZlZDM1ZTA1MmViN2EwZjU2MThhOGFmN2MxYzIyODc4Njc2MmM5N2UwZjczYSJ9fX0="}]}}}}]}
#=====|Hurt|=====#