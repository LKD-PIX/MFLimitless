#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Kill|=====#
    execute as @e[tag=nb.gMDisplay] at @s unless entity @e[tag=nb.gMHitbox,distance=..2] run kill @s
    execute as @e[tag=nb.gMHitbox] at @s unless entity @e[tag=nb.gMDisplay,distance=..2] run tp @s ~ -53453 ~
#=====|Kill|=====#

#=====|Non cursed|=====#
    execute as @e[tag=nb.gMDisplay] at @s unless entity @a[tag=nb.dunCurse] run kill @s
#=====|Non cursed|=====#