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

        #=====|Title|=====#
            tellraw @s [{"text": "             Do you want to uninstall this Datapack?","color": "gray"}]
        #=====|Title|=====#

        #=====|Actions|=====#
            tellraw @s [{"text": "\n                          "},{"text": "No","color": "red","clickEvent": {"action": "run_command","value": "/function dungeons:uninstall/cancel"}},{"text": "               "},{"text": "Yes","color": "green","clickEvent": {"action": "run_command","value": "/function dungeons:uninstall/uninstall"}}]
        #=====|Actions|=====#
    #=====|Contents|=====#
    tellraw @s [{"text": "===========================================","color": "aqua","strikethrough": true,"bold": true}]
#=====|Menu|=====#