#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Enable|=====#
    scoreboard players enable @s dun.get_items
    scoreboard players enable @s dun.spawn
    scoreboard players enable @s dun.default
    scoreboard players enable @s dun.Uninstall
#=====|Enable|=====#

#=====|Events|=====#
    #=====|Get|=====#
        execute if score @s dun.get_items matches 1.. run function dungeons:get
        execute if score @s dun.spawn matches 1.. run function dungeons:spawn
        execute if score @s dun.default matches 1.. run function dungeons:defaults
        execute if score @s dun.Uninstall matches 1.. run tag @s add nb.uIDGDP
    #=====|Get|=====#
#=====|Events|=====#

#=====|Reset|=====#
    scoreboard players set @s dun.get_items 0
    scoreboard players set @s dun.spawn 0
    scoreboard players set @s dun.default 0
    scoreboard players set @s dun.Uninstall 0
#=====|Reset|=====#