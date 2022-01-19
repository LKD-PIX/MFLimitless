#dont touch
#datapack made by Tetartos


team add tetartos.Dia
team modify tetartos.Dia color aqua
scoreboard objectives add dMT20 dummy
scoreboard objectives add dMR dummy
scoreboard objectives add dM.hp dummy
gamerule universalAnger true
scoreboard objectives add t10 dummy

function dungeon:bossbar
function dungeon:boss_abilities
function dungeon:phase2
function dungeon:boss_spawn
function dungeon:pbone

advancement grant @a[nbt={SelectedItem:{id:"minecraft:filled_map",Count:1b,tag:{display:{Name:'{"text":"Forbidden Map"}'}}}}] only tetartos:overgrown_locate
advancement grant @a[nbt={SelectedItem:{id:"minecraft:filled_map",Count:1b,tag:{display:{Name:'{"text":"Discarded Map"}'}}}}] only tetartos:overgrown_locate
advancement grant @a[nbt={Inventory:[{tag:{golemChest:1b}}]}] through tetartos:boss_golem

team modify tetartos.Dia friendlyFire false
execute as @e[tag=diaMonstrosity] run execute at @s run team join tetartos.Dia @e[distance=..20,type=!minecraft:player]