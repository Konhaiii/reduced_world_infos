#time
execute store result score $daytime reduced_world_infos-cl run time of minecraft:overworld query minecraft:day
scoreboard players add $daytime reduced_world_infos-cl 6000
execute if score $daytime reduced_world_infos-cl matches 24000.. run scoreboard players remove $daytime reduced_world_infos-cl 24000
execute store result score $hours reduced_world_infos-cl run scoreboard players get $daytime reduced_world_infos-cl
scoreboard players operation $hours reduced_world_infos-cl /= $hourfactor reduced_world_infos-cl
execute store result score $minutes reduced_world_infos-cl run scoreboard players get $daytime reduced_world_infos-cl
scoreboard players operation $minutes reduced_world_infos-cl %= $hourfactor reduced_world_infos-cl
scoreboard players operation $minutes reduced_world_infos-cl *= $hourfactor reduced_world_infos-cl
scoreboard players operation $minutes reduced_world_infos-cl /= $minutefactor reduced_world_infos-cl

execute store result storage reduced_world_infos hour int 1 run scoreboard players get $hours reduced_world_infos-cl
execute store result storage reduced_world_infos minute int 1 run scoreboard players get $minutes reduced_world_infos-cl

#show infos
execute if score $hours reduced_world_infos-cl matches 0..9 if score $minutes reduced_world_infos-cl matches 0..9 run title @s actionbar [{"text":"Time: ","color":"white"},{"text": "0","color":"yellow"},{"plain":true,"nbt":"hour","storage":"reduced_world_infos","color":"yellow"},{"text": ":0","color":"yellow"},{"plain":true,"nbt":"minute","storage":"reduced_world_infos","color":"yellow"}]
execute if score $hours reduced_world_infos-cl matches 0..9 if score $minutes reduced_world_infos-cl matches 10.. run title @s actionbar [{"text":"Time: ","color":"white"},{"text": "0","color":"yellow"},{"plain":true,"nbt":"hour","storage":"reduced_world_infos","color":"yellow"},{"text": ":","color":"yellow"},{"plain":true,"nbt":"minute","storage":"reduced_world_infos","color":"yellow"}]
execute if score $hours reduced_world_infos-cl matches 10.. if score $minutes reduced_world_infos-cl matches 0..9 run title @s actionbar [{"text":"Time: ","color":"white"},{"plain":true,"nbt":"hour","storage":"reduced_world_infos","color":"yellow"},{"text": ":0","color":"yellow"},{"plain":true,"nbt":"minute","storage":"reduced_world_infos","color":"yellow"}]
execute if score $hours reduced_world_infos-cl matches 10.. if score $minutes reduced_world_infos-cl matches 10.. run title @s actionbar [{"text":"Time: ","color":"white"},{"plain":true,"nbt":"hour","storage":"reduced_world_infos","color":"yellow"},{"text": ":","color":"yellow"},{"plain":true,"nbt":"minute","storage":"reduced_world_infos","color":"yellow"}]
tag @s add reduced_world_infos-using_action_bar