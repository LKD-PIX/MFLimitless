#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Functions|=====#
    #=====|Dungeon|=====#
        #=====|Global|=====#
            execute as @e[tag=nb.spawnSlimes] at @s run function dungeons:rooms/global/slime/slimes_chance
            execute as @e[tag=nb.slimeSpawn] at @s run function dungeons:rooms/global/slime/slimes_chance
            execute as @e[tag=nb.spawnSlimes] at @s if block ~ ~ ~ #dungeons:non_solid if block ~ ~-1 ~ #dungeons:non_solid if block ~ ~-2 ~ #dungeons:non_solid if block ~ ~-3 ~ #dungeons:non_solid run kill @s
            execute as @e[tag=nb.slimeSpawn] at @s if block ~ ~ ~ #dungeons:non_solid if block ~ ~-1 ~ #dungeons:non_solid if block ~ ~-2 ~ #dungeons:non_solid if block ~ ~-3 ~ #dungeons:non_solid run kill @s
            execute at @a[limit=1] run function dungeons:natural_spawn
        #=====|Global|=====#

        #=====|Loot|=====#
            # Dead end
                execute as @e[tag=nb.deadEndLoot] at @s run function dungeons:rooms/dead_end/loot/dead_end_loot
            # Prison
                execute as @e[tag=nb.prisonLoot] at @s run function dungeons:rooms/prison/loot/prison_loot
            # Hall
                execute as @e[tag=nb.hallLoot] at @s run function dungeons:rooms/hall/loot/hall_loot
            # Catacombs
                execute as @e[tag=nb.catacombLoot] at @s run function dungeons:rooms/catacombs/loot/catacombs_loot
            # Center
                execute as @e[tag=nb.centerLoot] at @s run function dungeons:rooms/center/loot/center_loot
        #=====|Loot|=====#

        #=====|Rooms|=====#
            #=====|Center|=====#
                # Spawn
                    execute as @e[tag=nb.centerProtection] at @s run function dungeons:rooms/center/protection/spawn
                # Kill
                    function dungeons:rooms/center/protection/kill
                # Teleport
                    execute as @e[tag=nb.cProtection] at @s at @e[limit=1,sort=nearest,tag=nb.cProtectionPort] run function dungeons:rooms/center/protection/teleport
                # Particle
                    execute at @e[tag=nb.cProtectionPort] run function dungeons:rooms/center/protection/particle
                # Effects
                    execute as @e[tag=nb.cProtection] at @s run function dungeons:rooms/center/protection/effects
            #=====|Center|=====#

            #=====|Catacombs|=====#
                #=====|Ghost|=====#
                     # Lift curse on death
                        execute as @a[scores={nb.rmCurseDie=1..}] at @s run function dungeons:rooms/catacombs/ghost/rm_curse
                    # Lift curse on kill ghost
                        execute as @e[tag=nb.dunGhost] at @s run function dungeons:rooms/catacombs/ghost/rm_curse_kill
                    
                    execute as @e[tag=nb.catacombSpawn] at @s run function dungeons:rooms/catacombs/ghost/spawn
                    execute as @e[tag=nb.dunGhost] at @s run function dungeons:rooms/catacombs/ghost/start
                    function dungeons:rooms/catacombs/ghost/kill
                    execute as @e[tag=nb.dunGhost] at @s run function dungeons:rooms/catacombs/ghost/display
                    execute as @e[tag=nb.gAI] at @s run function dungeons:rooms/catacombs/ghost/range
                    execute as @e[tag=nb.gAI] at @s run function dungeons:rooms/catacombs/ghost/health_level
                    execute as @e[tag=nb.gAI] at @s run function dungeons:rooms/catacombs/ghost/cavein
                    execute as @e[tag=nb.gAI] at @s run function dungeons:rooms/catacombs/ghost/reset
                    execute as @e[tag=nb.gAI] at @s run function dungeons:rooms/catacombs/ghost/minions
                    execute at @e[tag=nb.gAI] run function dungeons:rooms/catacombs/ghost/effects

                    #=====|Minions|=====#
                        function dungeons:rooms/catacombs/ghost/minions/kill
                        execute as @e[tag=nb.gMHitbox] at @s run function dungeons:rooms/catacombs/ghost/minions/hitbox
                        execute as @e[tag=nb.gMDisplay] at @s run function dungeons:rooms/catacombs/ghost/minions/teleport

                        # Blindness
                            execute as @e[tag=nb.blindnessSpirit] at @s run function dungeons:rooms/catacombs/ghost/minions/blindness/effects

                        # Slowness
                            execute as @e[tag=nb.slownessSpirit] at @s run function dungeons:rooms/catacombs/ghost/minions/slowness/effects

                        # Sickness
                            execute as @e[tag=nb.sicknessSpirit] at @s run function dungeons:rooms/catacombs/ghost/minions/sickness/effects

                        # Weakness
                            execute as @e[tag=nb.weaknessSpirit] at @s run function dungeons:rooms/catacombs/ghost/minions/weakness/effects
                    #=====|Minions|=====#

                    # Gear buffs
                        execute as @a[nbt={Inventory:[{Slot:100b,tag:{nb.ghostArmor:1b}},{Slot:101b,tag:{nb.ghostArmor:1b}},{Slot:102b,tag:{nb.ghostArmor:1b}},{Slot:103b,tag:{nb.ghostArmor:1b}}]}] run function dungeons:rooms/catacombs/ghost/gear_buffs
                #=====|Ghost|=====#
            #=====|Catacombs|=====#
        #=====|Rooms|=====#

        #=====|Sludge|=====#
            #=====|Small|=====#
                execute as @e[tag=nb.sludge_small_display] at @s run function dungeons:rooms/global/sludge/small/kill
                execute as @e[tag=nb.sludge_small_display] at @s run function dungeons:rooms/global/sludge/small/hurt
                execute as @e[tag=nb.sludge_small] at @s run function dungeons:rooms/global/sludge/small/teleport
            #=====|Small|=====#

            #=====|Tiny|=====#
                execute as @e[tag=nb.sludge_tiny_display] at @s run function dungeons:rooms/global/sludge/tiny/kill
                execute as @e[tag=nb.sludge_tiny_display] at @s run function dungeons:rooms/global/sludge/tiny/hurt
                execute as @e[tag=nb.sludge_tiny] at @s run function dungeons:rooms/global/sludge/tiny/teleport
            #=====|Tiny|=====#

            #=====|Large|=====#
                execute as @e[tag=nb.sludge_large_display] at @s run function dungeons:rooms/global/sludge/large/kill
                execute as @e[tag=nb.sludge_large_display] at @s run function dungeons:rooms/global/sludge/large/hurt
                execute as @e[tag=nb.sludge_large] at @s run function dungeons:rooms/global/sludge/large/teleport
            #=====|Large|=====#

            #=====|Huge|=====#
                execute as @e[tag=nb.sludge_huge_display] at @s run function dungeons:rooms/global/sludge/huge/kill
                execute as @e[tag=nb.sludge_huge] at @s run function dungeons:rooms/global/sludge/huge/hurt
            #=====|Huge|=====#

            #=====|Multiply|=====#
                execute as @e[tag=nb.killSmSlimes] at @s run function dungeons:rooms/global/sludge/multiply_small
                execute as @e[tag=nb.killLgSlimes] at @s run function dungeons:rooms/global/sludge/multiply_large
                execute as @e[tag=nb.killHgSlimes] at @s run function dungeons:rooms/global/sludge/multiply_huge
            #=====|Multiply|=====#

            #=====|Effects|=====#
                execute at @e[tag=nb.sludge,tag=!nb.sludge_tiny,tag=!nb.sludge_huge] run function dungeons:rooms/global/sludge/effects
                execute at @e[tag=nb.sludge_huge] run function dungeons:rooms/global/sludge/effects_huge
            #=====|Effects|=====#

            #=====|Sound|=====#
                execute at @e[tag=nb.sludge,nbt={HurtTime:10s}] run function dungeons:rooms/global/sludge/sound
                execute at @e[tag=nb.sludge_display,scores={nb.slDeath=-10}] run function dungeons:rooms/global/sludge/sound
            #=====|Sound|=====#

            #=====|Spawn egg|=====#
                execute as @e[tag=nb.spawnSludge] at @s run function dungeons:rooms/global/sludge/sludge_size
            #=====|Spawn egg|=====#
        #=====|Sludge|=====#

        #=====|Scum|=====#
            #=====|Large|=====#
                execute as @e[tag=nb.scum_large_display] at @s run function dungeons:rooms/global/scum/large/kill
                execute as @e[tag=nb.scum_large_display] at @s run function dungeons:rooms/global/scum/large/hurt
                execute as @e[tag=nb.scum_large] at @s run function dungeons:rooms/global/scum/large/teleport
            #=====|Large|=====#

            #=====|Small|=====#
                execute as @e[tag=nb.scum_small_display] at @s run function dungeons:rooms/global/scum/small/kill
                execute as @e[tag=nb.scum_small_display] at @s run function dungeons:rooms/global/scum/small/hurt
                execute as @e[tag=nb.scum_small] at @s run function dungeons:rooms/global/scum/small/teleport
            #=====|Small|=====#

            #=====|Tiny|=====#
                execute as @e[tag=nb.scum_tiny_display] at @s run function dungeons:rooms/global/scum/tiny/kill
                execute as @e[tag=nb.scum_tiny_display] at @s run function dungeons:rooms/global/scum/tiny/hurt
                execute as @e[tag=nb.scum_tiny] at @s run function dungeons:rooms/global/scum/tiny/teleport
            #=====|Tiny|=====#

            #=====|Multiply|=====#
                execute as @e[tag=nb.killSmScum] at @s run function dungeons:rooms/global/scum/multiply_small
                execute as @e[tag=nb.killLgScum] at @s run function dungeons:rooms/global/scum/multiply_large
            #=====|Multiply|=====#

             #=====|Effects|=====#
                execute at @e[tag=nb.scum,tag=!nb.scum_tiny] run function dungeons:rooms/global/scum/effects
            #=====|Effects|=====#

            #=====|Sound|=====#
                execute at @e[tag=nb.scum,nbt={HurtTime:10s}] run function dungeons:rooms/global/scum/sound
                execute at @e[tag=nb.scum_display,scores={nb.slDeath=-10}] run function dungeons:rooms/global/scum/sound
            #=====|Sound|=====#

            #=====|Spawn egg|=====#
                execute as @e[tag=nb.spawnScum] at @s run function dungeons:rooms/global/scum/scum_size
            #=====|Spawn egg|=====#
        #=====|Scum|=====#

        #=====|Slime|=====#
            #=====|Sweetberry|=====#
                execute as @e[tag=nb.dungeonSlime] at @s run function dungeons:rooms/global/slime/sweetberry
            #=====|Sweetberry|=====#

            #=====|Honey Slime boost|=====#
                execute as @e[tag=nb.dungeonSlime] at @s run function dungeons:rooms/global/slime_boost
            #=====|Honey Slime boost|=====#
        #=====|Slime|=====#

        #=====|Expand|=====#
            #=====|Score|=====#
                execute if score nb.global nb.dunSize matches ..-1 run scoreboard players set nb.global nb.dunSize 0
                scoreboard players operation nb.global nb.dunRun = nb.global nb.dunSize
            #=====|Score|=====#

            #=====|Function|=====#
                execute if entity @e[tag=nb.roomSpawn] run function dungeons:rooms/expand
            #=====|Function|=====#
        #=====|Expand|=====#
    #=====|Dungeon|=====#

    #=====|Entity Counter|=====#
        function dungeons:entity_counter
    #=====|Entity Counter|=====#

    #=====|Triggers|=====#
        execute as @a at @s run function dungeons:triggers
    #=====|Triggers|=====#

    #=====|Spread dungeon|=====#
        execute as @e[tag=nb.dungeonSpawn] at @s run function dungeons:spread
    #=====|Spread dungeon|=====#

    #=====|Uninstall|=====#
        execute as @a[tag=nb.uIDGDP] run function dungeons:uninstall/menu
    #=====|Uninstall|=====#
#=====|Functions|=====#

#=====|Reset scores|=====#
    scoreboard players set @a nb.dRG 0
    scoreboard players set @a nb.rmCurseDie 0
    scoreboard players set @a nb.rmCurseKill 0
#=====|Reset scores|=====#