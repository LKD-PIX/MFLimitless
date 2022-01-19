#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Spawn center|=====#
    execute unless entity @e[tag=nb.centerProtection,distance=..50] run setblock ~ ~ ~ structure_block{ignoreEntities:0b,name:"dungeons:center",mode:"LOAD"}
    execute unless entity @e[tag=nb.centerProtection,distance=..50] run setblock ~ ~1 ~ redstone_block
#=====|Spawn center|=====#

#=====|Reset|=====#
    fill ~ ~ ~ ~ ~1 ~ stone
    kill @s
#=====|Reset|=====#