#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Spawn|=====#
    summon guardian ~ ~.5 ~ {DeathLootTable:"dungeons:entities/treasure_protector",Tags:["nb.cProtection"],CustomName:'{"text": "Treasure Protector"}',Health:40f,Attributes:[{Name:"generic.max_health",Base:40},{Name:"generic.follow_range",Base:50}],ActiveEffects:[{Id:14,Amplifier:1,Duration:1000000}]}
    summon marker ~ ~.5 ~ {Tags:["nb.cProtectionPort"]}
#=====|Spawn|=====#

#=====|Kill|=====#
    kill @s
#=====|Kill|=====#