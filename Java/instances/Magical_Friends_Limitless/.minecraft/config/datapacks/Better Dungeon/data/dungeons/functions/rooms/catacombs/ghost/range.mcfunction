#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Range|=====#
    # Tag
        execute unless entity @a[tag=nb.dunCurse,distance=..10] run tag @s add nb.gPW
        execute at @a[tag=nb.dunCurse,distance=..2] unless entity @e[tag=nb.babyMinion,distance=..4] run summon zombie ~ ~ ~ {Health:1f,Attributes:[{Name:"generic.max_health",Base:1}],IsBaby:1b,Tags:["nb.babyMinion"]}
        execute if entity @a[tag=nb.dunCurse,distance=..2] run tag @s remove nb.gPW
    # Rotation
        tp @s[tag=nb.gPW] ^ ^ ^0.2 facing entity @a[limit=1,tag=nb.dunCurse,sort=nearest]
    # AI
        execute if entity @s[tag=nb.gPW] run data merge entity @s {NoAI:1b}
        execute unless entity @s[tag=nb.gPW] run data merge entity @s {NoAI:0b}
#=====|Range|=====#

#=====|Follow timer|=====#
    execute unless score @s nb.gFT matches 1.. run scoreboard players set @s nb.gFT 200
    scoreboard players remove @s nb.gFT 1

    execute if score @s nb.gFT matches 0 run tag @s add nb.gPW
#=====|Follow timer|=====#