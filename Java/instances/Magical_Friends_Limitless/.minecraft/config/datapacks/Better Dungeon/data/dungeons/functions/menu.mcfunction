#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

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

        #=====|Actions Wrapper|=====#
            #=====|Title|=====#
                tellraw @s[gamemode=!adventure,gamemode=!survival] [{"text": "                          Actions","color": "gray","bold": true}]
            #=====|Title|=====#

            #=====|Actions|=====#
                tellraw @s[gamemode=!adventure,gamemode=!survival] [{"text": "                               "},{"text":"[Get items]","color": "green","hoverEvent": {"action": "show_text","value": [{"text": "Get all the items of this datapack","color": "yellow"},{"text": "\n/trigger dun.get_itms","color": "gray"}]},"clickEvent": {"action": "run_command","value": "/function dungeons:get"}}]
                tellraw @s[gamemode=!adventure,gamemode=!survival] [{"text": "                           "},{"text":"[Spawn Dungeon]","color": "green","hoverEvent": {"action": "show_text","value": [{"text": "Spawn a dungeon around your area","color": "yellow"},{"text": "\n/trigger dun.spawn","color": "gray"}]},"clickEvent": {"action": "run_command","value": "/function dungeons:spawn"}}]
                tellraw @s[gamemode=!adventure,gamemode=!survival] [{"text": "                            "},{"text":"[Dungeon size]","color": "green","hoverEvent": {"action": "show_text","value": [{"text": "Change dungeon spawn sizes","color": "yellow"},{"text": "\nDungeons spawn by dy determining what the dungeon size is from the score. Example: ","color": "light_purple"},{"text": "If the score value is 3, the dungeon will expand 3 times.","color": "dark_purple","italic": true},{"text": "\n/scoreboard players set nb.global nb.dunSize <value>","color": "gray"},{"text": "\n(Default 3)","color": "dark_gray"}]},"clickEvent": {"action": "suggest_command","value": "/scoreboard players set nb.global nb.dunSize "}}]
                tellraw @s[gamemode=!adventure,gamemode=!survival] [{"text": "                           "},{"text":"[Dungeon height]","color": "green","hoverEvent": {"action": "show_text","value": [{"text": "Change dungeon spawn height","color": "yellow"},{"text": "\n/scoreboard players set nb.global nb.dunHeight <value>","color": "gray"},{"text": "\n(Default 30)","color": "dark_gray"}]},"clickEvent": {"action": "suggest_command","value": "/scoreboard players set nb.global nb.dunHeight "}}]
                execute if score nb.global nb.spNat matches 1 run tellraw @s[gamemode=!adventure,gamemode=!survival] [{"text": "                      "},{"text":"[Spawn naturally: True]","color": "green","hoverEvent": {"action": "show_text","value": [{"text": "Spawn dungeons naturally","color": "yellow"},{"text": "\nCurrently ","color": "yellow"},{"text": "True","color": "green"}]},"clickEvent": {"action": "run_command","value": "/function dungeons:spawn_naturally/false"}}]
                execute if score nb.global nb.spNat matches 0 run tellraw @s[gamemode=!adventure,gamemode=!survival] [{"text": "                      "},{"text":"[Spawn naturally: False]","color": "red","hoverEvent": {"action": "show_text","value": [{"text": "Spawn dungeons naturally","color": "yellow"},{"text": "\nCurrently ","color": "yellow"},{"text": "False","color": "red"}]},"clickEvent": {"action": "run_command","value": "/function dungeons:spawn_naturally/true"}}]
                execute if score nb.global nb.dgSpMsg matches 1 run tellraw @s[gamemode=!adventure,gamemode=!survival] [{"text": "                  "},{"text":"[Dungeon spawn message: True]","color": "green","hoverEvent": {"action": "show_text","value": [{"text": "Run a message when a dungeon is spawned","color": "yellow"},{"text": "\nCurrently ","color": "yellow"},{"text": "True","color": "green"}]},"clickEvent": {"action": "run_command","value": "/function dungeons:spawn_message/false"}}]
                execute if score nb.global nb.dgSpMsg matches 0 run tellraw @s[gamemode=!adventure,gamemode=!survival] [{"text": "                  "},{"text":"[Dungeon spawn message: False]","color": "red","hoverEvent": {"action": "show_text","value": [{"text": "Run a message when a dungeon is spawned","color": "yellow"},{"text": "\nCurrently ","color": "yellow"},{"text": "False","color": "red"}]},"clickEvent": {"action": "run_command","value": "/function dungeons:spawn_message/true"}}]
                tellraw @s[gamemode=!adventure,gamemode=!survival] [{"text": "                         "},{"text":"[Reset to defaults]","color": "yellow","hoverEvent": {"action": "show_text","value": [{"text": "Reset all values back to default (Dungeon spawn height, spawn size, etc)","color": "yellow"},{"text": "\n/trigger dun.default","color": "gray"}]},"clickEvent": {"action": "run_command","value": "/function dungeons:defaults"}}]
                tellraw @s[gamemode=!adventure,gamemode=!survival] [{"text": "                                [Uninstall]","color": "gray","hoverEvent": {"action": "show_text","value": [{"text": "Uninstall this Datapack","color": "yellow"},{"text": "\n/trigger dun.Uninstall","color": "gray"}]},"clickEvent": {"action": "run_command","value": "/tag @s add nb.uIDGDP"}}]
            #=====|Actions|=====#
        #=====|Actions Wrapper|=====#
    #=====|Contents|=====#
    tellraw @s [{"text": "===========================================","color": "aqua","strikethrough": true,"bold": true}]
#=====|Menu|=====#