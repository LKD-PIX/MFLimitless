#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Score|=====#
    scoreboard players add @s nb.ghTmr 1
#=====|Score|=====#

#=====|Rotation|=====#
    execute if score @s nb.ghTmr matches 1 run tp @s ~ ~ ~ facing entity @a[limit=1,sort=nearest,tag=nb.dunCurse]
#=====|Rotation|=====#

#=====|Raise|=====#
    execute if score @s nb.ghTmr matches 1..40 run tp @s ~ ~0.05 ~
#=====|Raise|=====#

#=====|Raise sound|=====#
    execute if score @s nb.ghTmr matches 1..35 run playsound block.gravel.step block @a ~ ~ ~ 1 0.8
#=====|Raise sound|=====#

#=====|Particle|=====#
    execute if score @s nb.ghTmr matches 1..35 at @e[tag=nb.catacombSpawn,limit=1,sort=nearest,distance=..4] run particle block coarse_dirt ~ ~ ~ 0 0 0 1 30
#=====|Particle|=====#

#=====|Speech|=====#
    #=====|AEC randomizer|=====#
        execute if score @s nb.ghTmr matches 55 run summon area_effect_cloud ~ ~ ~ {Tags:["nb.gSpeech","nb.chance1"]}
        execute if score @s nb.ghTmr matches 55 run summon area_effect_cloud ~ ~ ~ {Tags:["nb.gSpeech","nb.chance2"]}

        tag @e[limit=1,sort=random,distance=..0.1,tag=nb.gSpeech] add nb.select
    #=====|AEC randomizer|=====#

    execute if entity @e[distance=..0.1,tag=nb.gSpeech,tag=nb.chance1,tag=nb.select] run data merge entity @s {CustomNameVisible:1b,CustomName:'{"text": "Blargity blarg!","color": "dark_red","bold": true}'}
    execute if entity @e[distance=..0.1,tag=nb.gSpeech,tag=nb.chance2,tag=nb.select] run data merge entity @s {CustomNameVisible:1b,CustomName:'{"text": "Harga blarga flarg blarg!","color": "dark_red","bold": true}'}
#=====|Speech|=====#

#=====|Speech end|=====#
    execute if score @s nb.ghTmr matches 100 run data merge entity @s {CustomNameVisible:0b,CustomName:'',Marker:1b}
#=====|Speech end|=====#

#=====|Rotation|=====#
    execute if score @s nb.ghTmr matches 35..100 run tp @s ~ ~ ~ facing entity @a[limit=1,sort=nearest,tag=nb.dunCurse]
#=====|Rotation|=====#

#=====|AI|=====#    
    execute if score @s nb.ghTmr matches 120 run summon vex ~ ~ ~ {DeathLootTable:"dungeons:entities/ghost",CustomName:'{"text": "Ghost","color": "white","bold": true}',Tags:["nb.gAI"],ActiveEffects:[{Id:14,Amplifier:1,Duration:1000000,ShowParticles:0b}],Silent:1b,Health:50f,Attributes:[{Name:"generic.max_health",Base:50}],ArmorItems:[{id:"minecraft:leather_boots",Count:1b,tag:{nb.ghostArmor:1b,Damage:0,display:{Name:'{"text": "Ghost Shoes","italic": false,"bold": true,"color": "white"}',color:16777215},Enchantments:[{id:"unbreaking",lvl:5},{id:"protection",lvl:2}]}},{id:"minecraft:leather_leggings",Count:1b,tag:{nb.ghostArmor:1b,Damage:0,display:{Name:'{"text": "Ghost Pants","italic": false,"bold": true,"color": "white"}',color:16777215},Enchantments:[{id:"unbreaking",lvl:5},{id:"protection",lvl:3}]}},{id:"minecraft:leather_chestplate",Count:1b,tag:{nb.ghostArmor:1b,Damage:0,display:{Name:'{"text": "Ghost Shirt","italic": false,"bold": true,"color": "white"}',color:16777215},Enchantments:[{id:"unbreaking",lvl:5},{id:"protection",lvl:5}]}},{id:"minecraft:leather_helmet",Count:1b,tag:{nb.ghostArmor:1b,Damage:0,display:{Name:'{"text": "Ghost Hat","italic": false,"bold": true,"color": "white"}',color:16777215},Enchantments:[{id:"unbreaking",lvl:5},{id:"protection",lvl:2}]}}],HandItems:[{id:"minecraft:iron_sword",Count:1b,tag:{display:{Name:'{"text": "Ghost Blade","italic": false,"bold": true,"color": "white"}'},Enchantments:[{id:"sharpness",lvl:5},{id:"unbreaking",lvl:1},{id:"looting",lvl:1}]}}],ArmorDropChances:[0.2f,0.2f,0.2f,0.2f],HandDropChances:[0.2f]}
#=====|AI|=====#