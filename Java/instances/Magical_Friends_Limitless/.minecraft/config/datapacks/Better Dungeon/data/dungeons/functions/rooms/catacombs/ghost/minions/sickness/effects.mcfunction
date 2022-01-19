#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Effects|=====#
    effect give @a[sort=nearest,limit=1,tag=nb.dunCurse,distance=..0.5] nausea 15 3 false
    effect give @a[sort=nearest,limit=1,tag=nb.dunCurse,distance=..0.5] poison 10 0 false
    execute if entity @a[tag=nb.dunCurse,distance=..0.5] run particle dust 0.11 0.392 0 3 ~ ~1 ~ 0 0 0 10 20
#=====|Effects|=====#

#=====|Kill|=====#
    execute if entity @a[tag=nb.dunCurse,distance=..0.5] run kill @s
#=====|Kill|=====#