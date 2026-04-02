execute at @s run effect give @e[type=#reduced_world_infos:living_entities,limit=1,sort=nearest,distance=..24] minecraft:glowing 1

#show infos
execute at @s if entity @e[type=#reduced_world_infos:living_entities,limit=1,sort=nearest,distance=..24] run title @s actionbar [{"text":"Entity Found","color":"yellow"}]
execute at @s unless entity @e[type=#reduced_world_infos:living_entities,limit=1,sort=nearest,distance=..24] run title @s actionbar [{"text":"Out of Range","color":"red"}]
tag @s add reduced_world_infos-using_action_bar