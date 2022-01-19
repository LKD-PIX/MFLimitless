#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Spawn|=====#
    summon marker ~ ~ ~ {Tags:["nb.dungeonSpawn"]}
#=====|Spawn|=====#

#=====|Spread|=====#
    execute as @e[tag=nb.dungeonSpawn] at @s run spreadplayers ~ ~ 40 40 true @s
#=====|Spread|=====#

#=====|Height|=====#
    execute as @e[tag=nb.dungeonSpawn] at @s store result entity @s Pos[1] double 1 run scoreboard players add nb.global nb.dunHeight 0
#=====|Height|=====#

#=====|Msg|=====#
    execute if score nb.global nb.dgSpMsg matches 1 run tellraw @a[gamemode=!creative,gamemode=!spectator] [{"text": "A dungeon has been spawned!","color": "green"}]
    execute if score nb.global nb.dgSpMsg matches 1 run tellraw @a[gamemode=!survival,gamemode=!adventure] [{"text": "A dungeon has been spawned! ","color": "green"},{"text": "[Teleport]","color": "yellow","hoverEvent": {"action": "show_text","value": [{"text": "Click to teleport to dungeon"}]},"clickEvent": {"action": "run_command","value": "/execute at @e[limit=1,sort=nearest,tag=nb.cProtection] run tp @s ~ ~ ~5"}}]
#=====|Msg|=====#