#coords
data modify storage reduced_world_infos pos set from entity @s Pos
execute store result storage reduced_world_infos posY int 1 run data get storage reduced_world_infos pos[1]

#show infos
title @s actionbar [{"text":"Y: ","color":"white"},{"nbt":"posY","storage":"reduced_world_infos","color":"yellow"}]
tag @s add reduced_world_infos-using_action_bar