#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|False|=====#
    title @a actionbar [{"text": "Dungeon spawn messages is now set to ","color": "yellow"},{"text": "False","color": "red","bold": true}]
    execute as @a at @s run playsound block.note_block.hat master @s ~ ~ ~ 1000
    scoreboard players set nb.global nb.dgSpMsg 0
    function dungeons:menu
#=====|False|=====#