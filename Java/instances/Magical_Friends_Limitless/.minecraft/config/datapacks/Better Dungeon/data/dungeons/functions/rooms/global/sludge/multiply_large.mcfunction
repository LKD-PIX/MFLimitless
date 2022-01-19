#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Score|=====#
    scoreboard players add @s nb.killSmSlime 1
#=====|Score|=====#

#=====|Multiply|=====#
    execute if score @s nb.killSmSlime matches 21 as @e[type=slime,tag=!nb.dungeonSlime,distance=..8,name="Sludge"] at @s run function dungeons:rooms/global/sludge/small/spawn
    execute if score @s nb.killSmSlime matches 21 as @e[type=slime,tag=!nb.dungeonSlime,distance=..8,name="Sludge"] at @s run tp @s ~ -53453 ~
#=====|Multiply|=====#

#=====|Remove|=====#
    execute if score @s nb.killSmSlime matches 21.. run kill @s
#=====|Remove|=====#