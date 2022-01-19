#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Timer|=====#
    execute unless score @s nb.spawnSlimes matches 1.. run scoreboard players set @s nb.spawnSlimes 1200
    scoreboard players remove @s nb.spawnSlimes 1
#=====|Timer|=====#

#=====|Spawn Chance|=====#
    execute unless score nb.count nb.slimeCount matches 40.. if score @s nb.spawnSlimes matches 0 if predicate dungeons:spawn_chance run function dungeons:rooms/global/slime/slime_size
    execute unless score nb.count nb.sludgeCount matches 30.. if score @s nb.spawnSlimes matches 0 if predicate dungeons:sludge_spawn_chance run function dungeons:rooms/global/sludge/sludge_size
    execute unless score nb.count nb.sludgeCount matches 10.. if score @s nb.spawnSlimes matches 0 if predicate dungeons:scum_spawn_chance run function dungeons:rooms/global/scum/scum_size
#=====|Spawn Chance|=====#