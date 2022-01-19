#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Spawn|=====#
    tag @a[distance=..5,scores={nb.dRG=1..}] add nb.dunCurse
    execute unless entity @s[tag=nb.cGSP] if entity @a[tag=nb.dunCurse,distance=..5] run summon armor_stand ~ ~-2.2 ~ {Tags:["nb.dunGhost"],Invulnerable:1b,NoGravity:1b,DisabledSlots:4144959,ShowArms:1b,NoBasePlate:1b,Pose:{RightLeg:[180f,0f,0f],LeftLeg:[180f,0f,0f],RightArm:[-90f,0f,0f],LeftArm:[-90f,0f,0f]},ArmorItems:[{},{},{id:"minecraft:leather_chestplate",Count:1b,tag:{display:{color:5131854}}},{id:"minecraft:player_head",Count:1b,tag:{SkullOwner:{Id:[I;-1692129490,-1614657166,-2011638310,1010648271],Properties:{textures:[{Value:"eyJ0ZXh0dXJlcyI6eyJTS0lOIjp7InVybCI6Imh0dHA6Ly90ZXh0dXJlcy5taW5lY3JhZnQubmV0L3RleHR1cmUvOTZlOTM0NjdhM2EwNzkyMjdmNGE3ZDNlYmE3NjE3NTM2ZGE0OTFiYzJmYzZkNzNlZTM5NjhkM2NmMWE2YTUifX19"}]}}}}]}
    execute if entity @a[tag=nb.dunCurse,distance=..5] run tag @s add nb.cGSP
#=====|Spawn|=====#