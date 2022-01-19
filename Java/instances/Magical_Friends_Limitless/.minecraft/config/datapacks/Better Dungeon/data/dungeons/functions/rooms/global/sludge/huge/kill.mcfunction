#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Kill|=====#
    execute unless entity @e[tag=nb.sludge_huge,distance=..1] run scoreboard players remove @s nb.slDeath 10
    execute unless entity @e[tag=nb.sludge_huge,distance=..1] if score @s nb.slDeath matches -10 run summon marker ~ ~ ~ {Tags:["nb.killHgSlimes"]}
    kill @s[scores={nb.slDeath=..-100}]
#=====|Kill|=====#