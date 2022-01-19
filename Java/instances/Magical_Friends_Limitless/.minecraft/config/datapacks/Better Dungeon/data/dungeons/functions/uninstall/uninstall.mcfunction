#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Uninstall|=====#
    #=====|Scores|=====#
        #=====|Global|=====#

        #=====|Global|=====#

        #=====|Dungeon|=====#
            scoreboard objectives remove nb.spawnSlimes 
            scoreboard objectives remove nb.dunSize 
            scoreboard objectives remove nb.dunRun 
            scoreboard objectives remove nb.dunHeight 
            scoreboard objectives remove nb.yLevel 
            scoreboard objectives remove nb.spNat 
            scoreboard objectives remove nb.dgSpMsg 
            scoreboard objectives remove nb.spDgTmr 

            #=====|Ghost|=====#
                scoreboard objectives remove nb.ghTmr 
                scoreboard objectives remove nb.dRG
                scoreboard objectives remove nb.gHLV 
                scoreboard objectives remove nb.gCIT 
                scoreboard objectives remove nb.gFT 
                scoreboard objectives remove nb.sGM 
            #=====|Ghost|=====#

            #=====|Curse lift|=====#
                scoreboard objectives remove nb.rmCurseDie
                scoreboard objectives remove nb.rmCurseKill
            #=====|Curse lift|=====#
        #=====|Dungeon|=====#

        #=====|Sludge|=====#
            scoreboard objectives remove nb.smSlHurt 
            scoreboard objectives remove nb.slDeath 
            scoreboard objectives remove nb.killSmSlime 
            scoreboard objectives remove nb.killMult 
        #=====|Sludge|=====#

        #=====|Counters|=====#
            scoreboard objectives remove nb.sludgeCount 
            scoreboard objectives remove nb.scumCount 
            scoreboard objectives remove nb.slimeCount 
        #=====|Counters|=====#

        #=====|Triggers|=====#
            scoreboard objectives remove dun.get_items
            scoreboard objectives remove dun.spawn
            scoreboard objectives remove dun.default
            scoreboard objectives remove dun.Uninstall
        #=====|Triggers|=====#
    #=====|Scores|=====#

    #=====|Gamerules|=====#
        gamerule sendCommandFeedback true
    #=====|Gamerules|=====#

    #=====|Kill entities|=====#
        kill @e[tag=nb.cProtection]
        kill @e[tag=nb.cProtectionPort]
        kill @e[tag=nb.spawnSlimes]
        kill @e[tag=nb.slimeSpawn]
        kill @e[tag=nb.grave]
        kill @e[tag=nb.gAI]
        kill @e[tag=nb.gMHitbox]
        kill @e[tag=nb.gMDisplay]
        kill @e[tag=nb.dunGhost]
    #=====|Kill entities|=====#

    #=====|Remove tags|=====#
        tag @a remove nb.dunCurse
        tag @a remove nb.uIDGDP
    #=====|Remove tags|=====#

    #=====|Menu|=====#
        #=====|Menu|=====#
            tellraw @s [{"text": "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"}]
            tellraw @s [{"text": "===========================================","color": "aqua","strikethrough": true,"bold": true}]
            #=====|Contents|=====#
                #=====|Title|=====#
                    tellraw @s [{"text": "                    Better Dungeons","color": "gold","bold": true}]
                #=====|Title|=====#

                #=====|Version|=====#
                    tellraw @s [{"text": "                              Version","color": "gray"},{"text": " 1.0","color": "light_purple"}]
                #=====|Version|=====#

                #=====|Credits|=====#
                    tellraw @s [{"text": "                        Created by ","color": "gray"},{"text": "Njb1286","color": "aqua","bold": true,"hoverEvent": {"action": "show_text","value": [{"text": "Click to go to my Planet Minecraft page!","color": "green","bold": true}]},"clickEvent": {"action": "open_url","value": "https://www.planetminecraft.com/member/njb1286/"}}]
                #=====|Credits|=====#

                #=====|Warning|=====#
                    tellraw @s [{"text": "          (DO NOT CLAIM AS YOUR OWN WORK!)","color": "red","bold": true}]
                #=====|Warning|=====#

                #=====|Title|=====#
                    tellraw @s [{"text": "             This Datapack has been uninstalled","color": "gray"}]
                #=====|Title|=====#

                #=====|Actions|=====#
                    tellraw @s [{"text": "\n                                "},{"text": "Reinstall","color": "green","hoverEvent": {"action": "show_text","value": [{"text": "Reinstall this Datapack","color": "yellow"}]},"clickEvent": {"action": "run_command","value": "/datapack enable \"file/Better Dungeons\""}}]
                #=====|Actions|=====#
            #=====|Contents|=====#
            tellraw @s [{"text": "===========================================","color": "aqua","strikethrough": true,"bold": true}]
        #=====|Menu|=====#
    #=====|Menu|=====#  

    #=====|Disable|=====#
        datapack disable "file/Better Dungeons"
    #=====|Disable|=====#
#=====|Uninstall|=====#