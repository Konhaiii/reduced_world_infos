#day
execute store result storage reduced_world_infos day int 1 run time of minecraft:overworld query minecraft:day repetition

#show infos
title @s actionbar [{"text":"Day: ","color":"white"},{"plain":true,"nbt":"day","storage":"reduced_world_infos","color":"yellow"}]
tag @s add reduced_world_infos-using_action_bar