#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Timer|=====#
    execute unless score nb.global nb.spDgTmr matches 0.. run scoreboard players set nb.global nb.spDgTmr 5000
    execute if score nb.global nb.spDgTmr matches 0 run scoreboard players set nb.global nb.spDgTmr 5000
    scoreboard players remove nb.global nb.spDgTmr 1
#=====|Timer|=====#

#=====|AEC randomizer|=====#
    execute unless entity @e[tag=nb.cProtection,distance=..500] if score nb.global nb.spDgTmr matches 0 if score nb.global nb.spNat matches 1 run summon area_effect_cloud ~ ~ ~ {Tags:["nb.dgSpawn","nb.chance1"]}
    execute unless entity @e[tag=nb.cProtection,distance=..500] if score nb.global nb.spDgTmr matches 0 if score nb.global nb.spNat matches 1 run summon area_effect_cloud ~ ~ ~ {Tags:["nb.dgSpawn","nb.chance2"]}
    execute unless entity @e[tag=nb.cProtection,distance=..500] if score nb.global nb.spDgTmr matches 0 if score nb.global nb.spNat matches 1 run summon area_effect_cloud ~ ~ ~ {Tags:["nb.dgSpawn","nb.chance3"]}
    execute unless entity @e[tag=nb.cProtection,distance=..500] if score nb.global nb.spDgTmr matches 0 if score nb.global nb.spNat matches 1 run summon area_effect_cloud ~ ~ ~ {Tags:["nb.dgSpawn","nb.chance4"]}

    tag @e[limit=1,sort=random,distance=..0.1,tag=nb.dgSpawn] add nb.select
#=====|AEC randomizer|=====#

#=====|Spread|=====#
    execute if entity @e[distance=..0.1,tag=nb.dgSpawn,tag=nb.chance1,tag=nb.select] run summon area_effect_cloud ~ ~ ~ {Tags:["nb.spDgSpread"]}
    execute as @e[tag=nb.spDgSpread] at @s run spreadplayers ~ ~ 130 130 true @s
#=====|Spread|=====#

#=====|Spawn|=====#
    execute at @e[tag=nb.spDgSpread] unless entity @e[tag=nb.cProtection,distance=..500] run function dungeons:spawn
#=====|Spawn|=====#