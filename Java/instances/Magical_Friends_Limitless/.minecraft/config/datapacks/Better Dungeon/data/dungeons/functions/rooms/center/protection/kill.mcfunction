#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Kill|=====#
    execute as @e[tag=nb.cProtectionPort] at @s unless entity @e[tag=nb.cProtection,distance=..2] run fill ~1 ~ ~1 ~-1 ~1 ~-1 air replace iron_bars
    execute as @e[tag=nb.cProtectionPort] at @s unless entity @e[tag=nb.cProtection,distance=..2] run fill ~ ~ ~ ~ ~1 ~ air destroy
    execute as @e[tag=nb.cProtectionPort] at @s unless entity @e[tag=nb.cProtection,distance=..2] run kill @s
    execute as @e[tag=nb.cProtection] at @s unless entity @e[tag=nb.cProtectionPort,distance=..2] run data merge entity @s {PersistenceRequired:0b}
    execute as @e[tag=nb.cProtection] at @s unless entity @e[tag=nb.cProtectionPort,distance=..2] run tp @s ~ -5345 ~
#=====|Kill|=====#