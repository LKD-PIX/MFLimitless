#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Score|=====#
    scoreboard players remove nb.global nb.dunRun 1
#=====|Score|=====#

#=====|Expand|=====#
    #=====|Type|=====#
        execute as @e[tag=nb.roomSpawn] at @s run summon area_effect_cloud ~ ~ ~ {Tags:["nb.expand","nb.deadEndSpawn"]}
        execute as @e[tag=nb.roomSpawn] at @s run summon area_effect_cloud ~ ~ ~ {Tags:["nb.expand","nb.deadEndSpawn"]}
        execute as @e[tag=nb.roomSpawn] at @s run summon area_effect_cloud ~ ~ ~ {Tags:["nb.expand","nb.prisonSpawn"]}
        execute as @e[tag=nb.roomSpawn] at @s run summon area_effect_cloud ~ ~ ~ {Tags:["nb.expand","nb.prisonSpawn"]}
        execute as @e[tag=nb.roomSpawn] at @s run summon area_effect_cloud ~ ~ ~ {Tags:["nb.expand","nb.centerSpawn"]}
        execute as @e[tag=nb.roomSpawn] at @s run summon area_effect_cloud ~ ~ ~ {Tags:["nb.expand","nb.hallSpawn"]}
        execute as @e[tag=nb.roomSpawn] at @s run summon area_effect_cloud ~ ~ ~ {Tags:["nb.expand","nb.hallSpawn"]}
        execute as @e[tag=nb.roomSpawn] at @s run summon area_effect_cloud ~ ~ ~ {Tags:["nb.expand","nb.catacombsSpawn"]}
        execute as @e[tag=nb.roomSpawn] at @s run summon area_effect_cloud ~ ~ ~ {Tags:["nb.expand","nb.catacombsSpawn"]}

        execute as @e[tag=nb.roomSpawn] at @s run tag @e[limit=1,tag=nb.expand,sort=random,distance=..0.1] add nb.spawn
    #=====|Type|=====#

    #=====|Structure|=====#
        #=====|Center|=====#
            # North
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.centerSpawn,tag=nb.spawn] if block ~-1 ~ ~ cracked_stone_bricks run function dungeons:rooms/center/north
            # South
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.centerSpawn,tag=nb.spawn] if block ~1 ~ ~ cracked_stone_bricks run function dungeons:rooms/center/south
            # East
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.centerSpawn,tag=nb.spawn] if block ~ ~ ~-1 cracked_stone_bricks run function dungeons:rooms/center/east
            # West
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.centerSpawn,tag=nb.spawn] if block ~ ~ ~1 cracked_stone_bricks run function dungeons:rooms/center/west
        #=====|Center|=====#

        #=====|Dead end|=====#
            # North
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.deadEndSpawn,tag=nb.spawn] if block ~-1 ~ ~ cracked_stone_bricks run function dungeons:rooms/dead_end/north
            # South
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.deadEndSpawn,tag=nb.spawn] if block ~1 ~ ~ cracked_stone_bricks run function dungeons:rooms/dead_end/south
            # East
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.deadEndSpawn,tag=nb.spawn] if block ~ ~ ~-1 cracked_stone_bricks run function dungeons:rooms/dead_end/east
            # West
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.deadEndSpawn,tag=nb.spawn] if block ~ ~ ~1 cracked_stone_bricks run function dungeons:rooms/dead_end/west
        #=====|Dead end|=====#

        #=====|Prison|=====#
            # North
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.prisonSpawn,tag=nb.spawn] if block ~-1 ~ ~ cracked_stone_bricks run function dungeons:rooms/prison/north
            # South
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.prisonSpawn,tag=nb.spawn] if block ~1 ~ ~ cracked_stone_bricks run function dungeons:rooms/prison/south
            # East
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.prisonSpawn,tag=nb.spawn] if block ~ ~ ~-1 cracked_stone_bricks run function dungeons:rooms/prison/east
            # West
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.prisonSpawn,tag=nb.spawn] if block ~ ~ ~1 cracked_stone_bricks run function dungeons:rooms/prison/west
        #=====|Prison|=====#

        #=====|Hall|=====#
            # North
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.hallSpawn,tag=nb.spawn] if block ~-1 ~ ~ cracked_stone_bricks run function dungeons:rooms/hall/north
            # South
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.hallSpawn,tag=nb.spawn] if block ~1 ~ ~ cracked_stone_bricks run function dungeons:rooms/hall/south
            # East
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.hallSpawn,tag=nb.spawn] if block ~ ~ ~-1 cracked_stone_bricks run function dungeons:rooms/hall/east
            # West
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.hallSpawn,tag=nb.spawn] if block ~ ~ ~1 cracked_stone_bricks run function dungeons:rooms/hall/west
        #=====|Hall|=====#

        #=====|Catacombs|=====#
            # North
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.catacombsSpawn,tag=nb.spawn] if block ~-1 ~ ~ cracked_stone_bricks run function dungeons:rooms/catacombs/north
            # South
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.catacombsSpawn,tag=nb.spawn] if block ~1 ~ ~ cracked_stone_bricks run function dungeons:rooms/catacombs/south
            # East
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.catacombsSpawn,tag=nb.spawn] if block ~ ~ ~-1 cracked_stone_bricks run function dungeons:rooms/catacombs/east
            # West
                execute as @e[tag=nb.roomSpawn] at @s positioned ~1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~-1 ~ ~ unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s positioned ~ ~ ~-1 unless entity @e[tag=nb.cancelStructure,distance=..1] positioned as @s if entity @e[distance=..0.1,tag=nb.expand,tag=nb.catacombsSpawn,tag=nb.spawn] if block ~ ~ ~1 cracked_stone_bricks run function dungeons:rooms/catacombs/west
        #=====|Catacombs|=====#
    #=====|Structure|=====#
#=====|Expand|=====#

#=====|Repeat|=====#
    execute if score nb.global nb.dunRun matches 1.. run function dungeons:rooms/expand
#=====|Repeat|=====#

#=====|Kill|=====#
    kill @e[tag=nb.roomSpawn]
#=====|Kill|=====#