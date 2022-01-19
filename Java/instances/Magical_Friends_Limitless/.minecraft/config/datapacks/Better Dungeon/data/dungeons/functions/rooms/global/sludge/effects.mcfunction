#==================================================#
#                  Extra Dungeons                  #
#           Datapack created by Njb1286            #
#          Do not claim as your own work           #
#==================================================#

#=====|Effects|=====#
    effect give @e[distance=..1.5,type=!slime,nbt={HurtTime:10s}] poison 20 0 true
    effect give @e[distance=..1.5,type=!slime,nbt={HurtTime:10s}] hunger 120 1 true
#=====|Effects|=====#

#=====|Sound|=====#
    execute if entity @e[distance=..1.5,type=!slime,nbt={HurtTime:10s}] run playsound block.slime_block.break ambient @a ~ ~ ~ 1
    execute if entity @e[distance=..1.5,type=!slime,nbt={HurtTime:10s}] as @a[distance=..5] run playsound block.netherrack.break ambient @s ~ ~ ~ 1
    execute if entity @e[distance=..1.5,type=!slime,nbt={HurtTime:10s}] as @a[distance=..5] run playsound block.netherrack.break ambient @s ~ ~ ~ 1
    execute if entity @e[distance=..1.5,type=!slime,nbt={HurtTime:10s}] as @a[distance=..5] run playsound block.netherrack.break ambient @s ~ ~ ~ 1
    execute if entity @e[distance=..1.5,type=!slime,nbt={HurtTime:10s}] as @a[distance=..5] run playsound block.netherrack.break ambient @s ~ ~ ~ 1
    execute if entity @e[distance=..1.5,type=!slime,nbt={HurtTime:10s}] as @a[distance=..5] run playsound block.netherrack.break ambient @s ~ ~ ~ 1
    execute if entity @e[distance=..1.5,type=!slime,nbt={HurtTime:10s}] as @a[distance=..5] run playsound block.honey_block.break ambient @s ~ ~ ~ 1
    execute if entity @e[distance=..1.5,type=!slime,nbt={HurtTime:10s}] as @a[distance=..5] run playsound block.honey_block.break ambient @s ~ ~ ~ 1
    execute if entity @e[distance=..1.5,type=!slime,nbt={HurtTime:10s}] as @a[distance=..5] run playsound block.honey_block.break ambient @s ~ ~ ~ 1
    execute if entity @e[distance=..1.5,type=!slime,nbt={HurtTime:10s}] as @a[distance=..5] run playsound block.honey_block.break ambient @s ~ ~ ~ 1
    execute if entity @e[distance=..1.5,type=!slime,nbt={HurtTime:10s}] as @a[distance=..5] run playsound block.honey_block.break ambient @s ~ ~ ~ 1
#=====|Sound|=====#