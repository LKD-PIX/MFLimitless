#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Reset ghost|=====#
    execute unless entity @a[tag=nb.dunCurse] run tp @s ^ ^ ^0.5 facing entity @e[limit=1,sort=nearest,tag=nb.cGSP]
    execute unless entity @a[tag=nb.dunCurse] if entity @e[tag=nb.cGSP,distance=..3] run function dungeons:rooms/catacombs/ghost/reset_grave
#=====|Reset ghost|=====#