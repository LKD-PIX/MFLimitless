#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Get health|=====#
    execute store result score @s nb.gHLV run data get entity @s Health
#=====|Get health|=====#

#=====|Suppose poses|=====#
    #=====|Pose1|=====#
        execute if score @s nb.gHLV matches ..35 as @e[tag=nb.dunGhost,limit=1,sort=nearest,distance=..2] run data merge entity @s {Pose:{RightArm:[-90f,-90f,0f]}}
    #=====|Pose1|=====#

    #=====|Pose2|=====#
        execute if score @s nb.gHLV matches ..20 as @e[tag=nb.dunGhost,limit=1,sort=nearest,distance=..2] run data merge entity @s {Pose:{LeftArm:[-90f,90f,0f]}}
    #=====|Pose2|=====#

    #=====|Pose3|=====#
        execute if score @s nb.gHLV matches ..8 as @e[tag=nb.dunGhost,limit=1,sort=nearest,distance=..2] run data merge entity @s {Pose:{Head:[180f,0f,0f]},ArmorItems:[{},{},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:5131854}}},{}]}
    #=====|Pose3|=====#
#=====|Suppose poses|=====#

#=====|Suppose poses reset|=====#
    #=====|Pose1|=====#
        execute unless score @s nb.gHLV matches ..35 as @e[tag=nb.dunGhost,limit=1,sort=nearest,distance=..2] run data merge entity @s {Pose:{RightArm:[-90f,0f,0f]}}
    #=====|Pose1|=====#

    #=====|Pose2|=====#
        execute unless score @s nb.gHLV matches ..20 as @e[tag=nb.dunGhost,limit=1,sort=nearest,distance=..2] run data merge entity @s {Pose:{LeftArm:[-90f,0f,0f]}}
    #=====|Pose2|=====#

    #=====|Pose3|=====#
        execute unless score @s nb.gHLV matches ..8 as @e[tag=nb.dunGhost,limit=1,sort=nearest,distance=..2] run data merge entity @s {Pose:{Head:[0f,0f,0f]},ArmorItems:[{},{},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:5131854}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-1692129490,-1614657166,-2011638310,1010648271],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOTZlOTM0NjdhM2EwNzkyMjdmNGE3ZDNlYmE3NjE3NTM2ZGE0OTFiYzJmYzZkNzNlZTM5NjhkM2NmMWE2YTUifX19"}]}}}}]}
    #=====|Pose3|=====#
#=====|Suppose poses reset|=====#