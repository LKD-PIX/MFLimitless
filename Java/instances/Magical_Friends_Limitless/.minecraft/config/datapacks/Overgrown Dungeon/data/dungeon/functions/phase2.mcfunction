#Made by tetartos

execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dM.hp=..100,dMR=0}] run playsound minecraft:entity.ender_dragon.hurt hostile @a[distance=..24] ~ ~ ~ 2 0.7 1
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dM.hp=..100,dMR=0}] run playsound minecraft:entity.elder_guardian.curse hostile @a[distance=..24] ~ ~ ~ 2 0.7 1
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dM.hp=..100,dMR=0}] run particle minecraft:flame ~ ~1 ~ 0.3 0.3 0.3 0.3 120 force
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dM.hp=..100,dMR=0}] run particle minecraft:enchant ~ ~1 ~ 0.3 0.3 0.3 1.2 120 force
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dM.hp=..100,dMR=0}] run particle minecraft:lava ~ ~1 ~ 0.3 0.3 0.3 1.2 12 normal
execute at @e[type=iron_golem,tag=diaMonstrosity,scores={dM.hp=..100,dMR=0}] run particle minecraft:enchanted_hit ~ ~1 ~ 0.3 0.3 0.3 1.2 160 force
effect give @e[type=iron_golem,tag=diaMonstrosity,scores={dM.hp=..100,dMR=0}] minecraft:instant_health 30 1
scoreboard players set @e[type=iron_golem,tag=diaMonstrosity,scores={dM.hp=..100,dMR=0}] dMR 1