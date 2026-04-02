#rotation
execute store result score $rotationY reduced_world_infos-rY run data get entity @s Rotation[0] 10
execute if score $rotationY reduced_world_infos-rY matches ..-1575 run data modify storage reduced_world_infos facing set value "North"
execute if score $rotationY reduced_world_infos-rY matches -1574..-1125 run data modify storage reduced_world_infos facing set value "North-East"
execute if score $rotationY reduced_world_infos-rY matches -1124..-675 run data modify storage reduced_world_infos facing set value "East"
execute if score $rotationY reduced_world_infos-rY matches -674..-225 run data modify storage reduced_world_infos facing set value "South-East"
execute if score $rotationY reduced_world_infos-rY matches -224..224 run data modify storage reduced_world_infos facing set value "South"
execute if score $rotationY reduced_world_infos-rY matches 225..674 run data modify storage reduced_world_infos facing set value "South-West"
execute if score $rotationY reduced_world_infos-rY matches 675..1124 run data modify storage reduced_world_infos facing set value "West"
execute if score $rotationY reduced_world_infos-rY matches 1125..1574 run data modify storage reduced_world_infos facing set value "North-West"
execute if score $rotationY reduced_world_infos-rY matches 1575.. run data modify storage reduced_world_infos facing set value "North"

#show infos
title @s actionbar [{"text":"Direction: ","color":"white"},{"nbt":"facing","storage":"reduced_world_infos","color":"yellow"}]
tag @s add reduced_world_infos-using_action_bar