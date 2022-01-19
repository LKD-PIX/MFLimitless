#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Scores|=====#
    #=====|Global|=====#
        
    #=====|Global|=====#

    #=====|Dungeon|=====#
        scoreboard objectives add nb.spawnSlimes dummy
        scoreboard objectives add nb.dunSize dummy
        scoreboard objectives add nb.dunRun dummy
        scoreboard objectives add nb.dunHeight dummy
        scoreboard objectives add nb.yLevel dummy
        scoreboard objectives add nb.spNat dummy
        scoreboard objectives add nb.dgSpMsg dummy
        scoreboard objectives add nb.spDgTmr dummy

        #=====|Ghost|=====#
            scoreboard objectives add nb.ghTmr dummy
            scoreboard objectives add nb.dRG minecraft.mined:minecraft.coarse_dirt
            scoreboard objectives add nb.gHLV dummy
            scoreboard objectives add nb.gCIT dummy
            scoreboard objectives add nb.gFT dummy
            scoreboard objectives add nb.sGM dummy
        #=====|Ghost|=====#

        #=====|Curse lift|=====#
            scoreboard objectives add nb.rmCurseDie minecraft.custom:minecraft.deaths
            scoreboard objectives add nb.rmCurseKill minecraft.killed:minecraft.vex
        #=====|Curse lift|=====#
    #=====|Dungeon|=====#

    #=====|Sludge|=====#
        scoreboard objectives add nb.smSlHurt dummy
        scoreboard objectives add nb.slDeath dummy
        scoreboard objectives add nb.killSmSlime dummy
        scoreboard objectives add nb.killMult dummy
    #=====|Sludge|=====#

    #=====|Counters|=====#
        scoreboard objectives add nb.sludgeCount dummy
        scoreboard objectives add nb.scumCount dummy
        scoreboard objectives add nb.slimeCount dummy
    #=====|Counters|=====#

    #=====|Triggers|=====#
        scoreboard objectives add dun.get_items trigger
        scoreboard objectives add dun.spawn trigger
        scoreboard objectives add dun.default trigger
        scoreboard objectives add dun.Uninstall trigger
    #=====|Triggers|=====#

    #=====|Set|=====#
        execute unless score nb.global nb.dunSize matches 0.. run scoreboard players set nb.global nb.dunSize 3
        execute unless score nb.global nb.dunHeight matches 0.. run scoreboard players set nb.global nb.dunHeight 30
        execute unless score nb.global nb.spNat matches 0.. run scoreboard players set nb.global nb.spNat 1
        execute unless score nb.global nb.dgSpMsg matches 0.. run scoreboard players set nb.global nb.dgSpMsg 1
    #=====|Set|=====#
#=====|Scores|=====#

#=====|Gamerules|=====#
    gamerule sendCommandFeedback false
#=====|Gamerules|=====#

#=====|Functions|=====#
    #=====|Menu|=====#
        execute as @a run function dungeons:menu
    #=====|Menu|=====#
#=====|Functions|=====#