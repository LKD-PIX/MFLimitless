#Made by tetartos

scoreboard players set @e[type=iron_golem,tag=diaMonstrosity,tag=!dMR] dMR 0
tag @e[type=iron_golem,tag=diaMonstrosity,tag=!dMR] add dMR

execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dMT20=95..100,dMR=1}] run summon vex ~ ~3 ~ {Glowing:1b,Team:"tetartos.Dia",LifeTicks:300}
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dMT20=95,dMR=1}] run playsound minecraft:entity.evoker.prepare_summon hostile @a[distance=..24] ~ ~ ~ 2 0.6 1
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dMT20=95,dMR=1}] run playsound minecraft:entity.evoker.cast_spell hostile @a[distance=..24] ~ ~ ~ 2 0.6 1

execute as @a run data merge entity @e[type=iron_golem,tag=diaMonstrosity,limit=1] {AngerTime:10000}
execute at @e[type=iron_golem,tag=diaMonstrosity] run effect clear @e[distance=..64] minecraft:levitation
execute at @e[type=iron_golem,tag=diaMonstrosity,limit=1] run particle minecraft:enchanted_hit ~ ~1.2 ~ 0.2 1.6 0.2 0.1 4 normal
scoreboard players add @e[type=iron_golem,tag=diaMonstrosity] dMT20 1
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dMT20=350..}] run particle minecraft:large_smoke ~ ~1.2 ~ 0.1 1.6 0.1 0.01 1 normal
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dMT20=350..351}] run playsound minecraft:block.lava.extinguish hostile @a[distance=..24] ~ ~ ~ 0.8 0.4
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dMT20=360,dMR=0}] run playsound minecraft:entity.fox.screech hostile @a[distance=..24] ~ ~ ~ 2 0.16 1
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dMT20=360,dMR=1}] run playsound minecraft:entity.ravager.roar hostile @a[distance=..24] ~ ~ ~ 2 0.8 1
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dMT20=200..210,dMR=0}] run summon shulker_bullet ~ ~3 ~ {Glowing:1b,Target:[I;0,1,0,1],TXD:5d,TYD:1d,TZD:5d,Steps:1,Tags:["eMS"],Passengers:[{id:"minecraft:potion",Glowing:1b,Item:{id:"minecraft:quartz",Count:1b,tag:{Potion:"minecraft:empty",CustomPotionColor:0,CustomPotionEffects:[{Id:20b,Amplifier:2b,Duration:100,ShowParticles:1b}]}}}]}
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dMT20=200..216,dMR=1}] run summon shulker_bullet ~ ~3 ~ {Glowing:1b,Target:[I;0,1,0,1],TXD:5d,TYD:1d,TZD:5d,Steps:1,Tags:["eMS"],Passengers:[{id:"minecraft:potion",Glowing:1b,Item:{id:"minecraft:ender_pearl",Count:1b,tag:{Potion:"minecraft:empty",CustomPotionColor:0,CustomPotionEffects:[{Id:20b,Amplifier:3b,Duration:140,ShowParticles:1b}]}}}]}
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dMT20=200..210}] run particle minecraft:enchant ~ ~0.5 ~ 0.2 2 0.2 4 16 normal
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dMT20=200..202}] run playsound minecraft:entity.shulker.shoot hostile @a[distance=..24] ~ ~ ~ 2 1 1
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dMT20=200..203,dMR=1}] run playsound minecraft:entity.shulker.shoot hostile @a[distance=..24] ~ ~ ~ 2 0.6 1
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dMT20=200..201,dMR=1}] run playsound minecraft:entity.phantom.bite hostile @a[distance=..24] ~ ~ ~ 2 0.8 1
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dMT20=400..}] run playsound minecraft:item.totem.use hostile @a[distance=..24] ~ ~ ~ 2 0.8 1
effect give @e[type=iron_golem,tag=diaMonstrosity,scores={dMT20=400..}] resistance 1 5 true
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dMT20=400..,dMR=0}] run summon creeper ~ ~2 ~ {powered:1b,ExplosionRadius:3b,Fuse:1,ignited:1b}
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dMT20=400..,dMR=1}] run summon creeper ~ ~2 ~ {powered:1b,ExplosionRadius:4b,Fuse:1,ignited:1b}

scoreboard players set @e[type=iron_golem,tag=diaMonstrosity,scores={dMT20=400..}] dMT20 0
#also made by tetartos
execute as @e[type=minecraft:shulker_bullet,tag=eMS] at @s run data modify entity @s Target set from entity @p UUID

effect clear @e[type=iron_golem,tag=diaMonstrosity] minecraft:wither