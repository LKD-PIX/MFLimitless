#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Spawn|=====#
    setblock ~-1 ~ ~-1 structure_block{mode:"LOAD",name:"dungeons:catacombs",posX:-12,posY:-7,posZ:0,rotation:"COUNTERCLOCKWISE_90",ignoreEntities:0b}
    setblock ~-1 ~1 ~-1 redstone_block
#=====|Spawn|=====#

#=====|Reset|=====#
    execute positioned ~-1 ~ ~-1 if block ~ ~ ~ structure_block run setblock ~ ~ ~ stone 
    execute positioned ~-1 ~1 ~-1 if block ~ ~ ~ redstone_block run setblock ~ ~ ~ stone 
#=====|Reset|=====#

#=====|Kill|=====#
    kill @s
#=====|Kill|=====#