#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Kill|=====#
    execute as @e[tag=nb.dunGhost,scores={nb.ghTmr=120..}] at @s unless entity @e[tag=nb.gAI,distance=..3] run kill @s
    execute as @e[tag=nb.gAI] at @s unless entity @e[tag=nb.dunGhost,distance=..3] run tp @s ~ -53453 ~
#=====|Kill|=====#