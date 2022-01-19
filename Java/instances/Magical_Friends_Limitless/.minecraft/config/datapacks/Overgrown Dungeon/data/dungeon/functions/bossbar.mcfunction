#Made by tetartos

bossbar add dungeon.boss {"text":"Diamond Monstrosity","color":"aqua","bold":true,"italic":false}
bossbar set dungeon.boss color blue
bossbar set dungeon.boss style notched_6

execute at @e[type=iron_golem,tag=diaMonstrosity,limit=1] run bossbar set dungeon.boss players @a[distance=..32]

execute store result bossbar dungeon.boss max run attribute @e[type=iron_golem,tag=diaMonstrosity,limit=1] generic.max_health get

execute store result bossbar dungeon.boss value run data get entity @e[type=iron_golem,tag=diaMonstrosity,limit=1] Health

execute unless entity @e[type=iron_golem,tag=diaMonstrosity,limit=1] run bossbar remove dungeon.boss

execute store result score @e[type=iron_golem,tag=diaMonstrosity,limit=1] dM.hp run data get entity @e[type=iron_golem,tag=diaMonstrosity,limit=1] Health