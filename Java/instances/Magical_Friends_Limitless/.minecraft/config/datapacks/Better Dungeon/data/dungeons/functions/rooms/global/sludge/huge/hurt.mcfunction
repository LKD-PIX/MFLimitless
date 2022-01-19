#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Kill display|=====#
    kill @e[tag=nb.sludge_huge_display,distance=..2]
#=====|Kill display|=====#

#=====|Hurt data|=====#
    execute store result score @s nb.smSlHurt run data get entity @s HurtTime
#=====|Hurt data|=====#

#=====|Display|=====#
    execute unless entity @s[tag=nb.sludge_huge,distance=..1,scores={nb.smSlHurt=1..}] run summon falling_block ~ ~ ~ {Time:1,NoGravity:1b,Tags:["nb.sludge_huge_display","nb.sludge_display"],BlockState:{Name:"minecraft:moss_block"}}
#=====|Display|=====#

#=====|Hurt|=====#
    execute if entity @s[tag=nb.sludge_huge,distance=..1,scores={nb.smSlHurt=1..}] run summon falling_block ~ ~ ~ {Time:1,NoGravity:1b,Tags:["nb.sludge_huge_display","nb.sludge_display"],BlockState:{Name:"minecraft:nether_wart_block"}}
#=====|Hurt|=====#