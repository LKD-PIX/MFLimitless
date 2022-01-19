#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Remove curse|=====#
    execute as @a[tag=nb.dunCurse,scores={nb.rmCurseKill=1..}] unless entity @e[tag=nb.gAI,distance=..3] run tag @s remove nb.dunCurse
#=====|Remove curse|=====#