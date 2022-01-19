#Made by tetartos

execute at @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] run execute at @e[type=armor_stand,distance=..1,tag=altar] run summon iron_golem ~ ~ ~ {Glowing:1b,CustomNameVisible:1b,Team:"tetartos.Dia",DeathLootTable:"dungeon:boss",Health:250f,PlayerCreated:0b,AngerTime:120000000,Tags:["diaMonstrosity","ns"],CustomName:'{"text":"Diamond Monstrosity","color":"aqua","bold":true,"italic":false}',HandItems:[{id:'minecraft:iron_axe',Count:1b,tag:{Unbreakable:1b,Enchantments:[{id:'minecraft:knockback',lvl:3s},{id:'minecraft:efficiency',lvl:5s}],AttributeModifiers:[{AttributeName:'generic.attack_speed',Name:'generic.attack_speed',Amount:-1,Operation:0,UUID:[I;133940166,-1434105790,-1627410734,1647827074]}]}},{}],HandDropChances:[-327.670F,0.085F],ActiveEffects:[{Id:10b,Amplifier:0b,Duration:1999980,ShowParticles:0b},{Id:12b,Amplifier:5b,Duration:1999980,ShowParticles:0b},{Id:13b,Amplifier:5b,Duration:1999980,ShowParticles:0b},{Id:30b,Amplifier:2b,Duration:1999980,ShowParticles:0b}],Attributes:[{Name:generic.max_health,Base:300},{Name:generic.knockback_resistance,Base:0.7},{Name:generic.movement_speed,Base:0.5},{Name:generic.attack_damage,Base:11},{Name:generic.armor,Base:10},{Name:generic.armor_toughness,Base:4},{Name:generic.attack_knockback,Base:2}]}

execute at @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] run tag @e[type=armor_stand,distance=..1,tag=altar] add kill
execute at @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] run execute at @e[type=armor_stand,distance=..1,tag=altar] run effect give @e[distance=..15] resistance 1 15 true
execute at @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] run execute at @e[type=armor_stand,distance=..1,tag=altar] run execute as @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}},distance=..5] run tag @s add kill
execute at @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] run execute at @e[type=armor_stand,distance=..1,tag=altar] run tag @s add kill
execute at @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] run execute at @e[type=armor_stand,distance=..1,tag=altar] run particle minecraft:enchant ~ ~0.5 ~ 0.2 2 0.2 5 700 normal
execute at @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] run execute at @e[type=armor_stand,distance=..1,tag=altar] run particle minecraft:enchanted_hit ~ ~0.5 ~ 0.2 2 0.2 0.1 70 normal
execute at @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] run execute at @e[type=armor_stand,distance=..1,tag=altar] run particle minecraft:warped_spore ~ ~0.5 ~ 0 2 0 1 150 normal
execute at @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] run execute at @e[type=armor_stand,distance=..1,tag=altar] run particle minecraft:large_smoke ~ ~0.5 ~ 0 2 0 0.2 150 normal
execute at @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] run execute at @e[type=armor_stand,distance=..1,tag=altar] run playsound minecraft:entity.wither.spawn hostile @a ~ ~ ~ 2 1 1

execute at @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] run execute as @e[type=armor_stand,distance=..1,tag=altar] run fill ~-5 ~-1 ~-5 ~5 ~5 ~5 air

execute at @e[type=item,nbt={Item:{id:"minecraft:nether_star",Count:1b}}] run execute at @e[type=armor_stand,distance=..1,tag=altar] run summon creeper ~ ~1 ~ {ExplosionRadius:2b,Fuse:1,ignited:1b}

kill @e[tag=kill]