#Made by tetartos

execute at @e[type=item,scores={t10=199..},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:block.enchantment_table.use hostile @a[distance=..12] ~ ~ ~ 0.6 0.6
scoreboard players add @e[type=item,nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] t10 1
execute at @e[type=item,nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run particle minecraft:enchant ~ ~1 ~ 0.1 0 0.1 0.05 1 normal
execute at @e[type=item,scores={t10=170..},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run particle minecraft:end_rod ~ ~0.4 ~ 0.1 0 0.1 0.05 1 normal
execute at @e[scores={t10=200..},type=item,nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run summon skeleton ~ ~ ~ {DeathLootTable:"dungeon:mobs/pbone",HandItems:[{id:"minecraft:stone_sword",Count:1b},{}],HandDropChances:[-327.670F,-327.670F]}
kill @e[scores={t10=200..},type=item,nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}]


execute at @e[type=item,scores={t10=1},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.hurt hostile @a[distance=..12] ~ ~ ~ 0.6 1.4
execute at @e[type=item,scores={t10=50},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.hurt hostile @a[distance=..12] ~ ~ ~ 0.7 1.5
execute at @e[type=item,scores={t10=100},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.hurt hostile @a[distance=..12] ~ ~ ~ 0.8 1.6
execute at @e[type=item,scores={t10=150},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.hurt hostile @a[distance=..12] ~ ~ ~ 0.9 1.7
execute at @e[type=item,scores={t10=199},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.hurt hostile @a[distance=..12] ~ ~ ~ 1 1.8

execute at @e[type=item,scores={t10=10},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.step hostile @a[distance=..12] ~ ~ ~ 0.6 1.6
execute at @e[type=item,scores={t10=20},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.step hostile @a[distance=..12] ~ ~ ~ 0.6 1.6
execute at @e[type=item,scores={t10=30},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.step hostile @a[distance=..12] ~ ~ ~ 0.6 1.6
execute at @e[type=item,scores={t10=40},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.step hostile @a[distance=..12] ~ ~ ~ 0.6 1.6
execute at @e[type=item,scores={t10=50},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.step hostile @a[distance=..12] ~ ~ ~ 0.6 1.6
execute at @e[type=item,scores={t10=60},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.step hostile @a[distance=..12] ~ ~ ~ 0.6 1.6
execute at @e[type=item,scores={t10=70},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.step hostile @a[distance=..12] ~ ~ ~ 0.6 1.6
execute at @e[type=item,scores={t10=90},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.step hostile @a[distance=..12] ~ ~ ~ 0.6 1.6
execute at @e[type=item,scores={t10=100},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.step hostile @a[distance=..12] ~ ~ ~ 0.6 1.6

execute at @e[type=item,scores={t10=110},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.step hostile @a[distance=..12] ~ ~ ~ 0.6 1.6
execute at @e[type=item,scores={t10=120},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.step hostile @a[distance=..12] ~ ~ ~ 0.6 1.6
execute at @e[type=item,scores={t10=130},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.step hostile @a[distance=..12] ~ ~ ~ 0.6 1.6
execute at @e[type=item,scores={t10=140},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.step hostile @a[distance=..12] ~ ~ ~ 0.6 1.6
execute at @e[type=item,scores={t10=150},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.step hostile @a[distance=..12] ~ ~ ~ 0.6 1.6
execute at @e[type=item,scores={t10=160},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.step hostile @a[distance=..12] ~ ~ ~ 0.6 1.6
execute at @e[type=item,scores={t10=170},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.step hostile @a[distance=..12] ~ ~ ~ 0.6 1.6
execute at @e[type=item,scores={t10=190},nbt={Item:{id:"minecraft:bone",Count:1b,tag:{pBone:1b}}}] run playsound minecraft:entity.skeleton.step hostile @a[distance=..12] ~ ~ ~ 0.6 1.6