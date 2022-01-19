#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Display|=====#
    execute at @e[limit=1,sort=nearest,tag=nb.gAI,distance=..3] run tp @s ~ ~-0.8 ~
    data modify entity @s Rotation set from entity @e[limit=1,sort=nearest,tag=nb.gAI,distance=..3] Rotation
#=====|Display|=====#