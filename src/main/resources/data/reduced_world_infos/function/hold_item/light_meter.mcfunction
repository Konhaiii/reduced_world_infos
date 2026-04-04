#test light
execute at @s if predicate reduced_world_infos:light_level/0 run function reduced_world_infos:set_light_meter_model {light:0,converted_light:0}
execute at @s if predicate reduced_world_infos:light_level/1 run function reduced_world_infos:set_light_meter_model {light:1,converted_light:1}
execute at @s if predicate reduced_world_infos:light_level/2 run function reduced_world_infos:set_light_meter_model {light:2,converted_light:1}
execute at @s if predicate reduced_world_infos:light_level/3 run function reduced_world_infos:set_light_meter_model {light:3,converted_light:2}
execute at @s if predicate reduced_world_infos:light_level/4 run function reduced_world_infos:set_light_meter_model {light:4,converted_light:2}
execute at @s if predicate reduced_world_infos:light_level/5 run function reduced_world_infos:set_light_meter_model {light:5,converted_light:3}
execute at @s if predicate reduced_world_infos:light_level/6 run function reduced_world_infos:set_light_meter_model {light:6,converted_light:4}
execute at @s if predicate reduced_world_infos:light_level/7 run function reduced_world_infos:set_light_meter_model {light:7,converted_light:4}
execute at @s if predicate reduced_world_infos:light_level/8 run function reduced_world_infos:set_light_meter_model {light:8,converted_light:5}
execute at @s if predicate reduced_world_infos:light_level/9 run function reduced_world_infos:set_light_meter_model {light:9,converted_light:5}
execute at @s if predicate reduced_world_infos:light_level/10 run function reduced_world_infos:set_light_meter_model {light:10,converted_light:6}
execute at @s if predicate reduced_world_infos:light_level/11 run function reduced_world_infos:set_light_meter_model {light:11,converted_light:7}
execute at @s if predicate reduced_world_infos:light_level/12 run function reduced_world_infos:set_light_meter_model {light:12,converted_light:7}
execute at @s if predicate reduced_world_infos:light_level/13 run function reduced_world_infos:set_light_meter_model {light:13,converted_light:8}
execute at @s if predicate reduced_world_infos:light_level/14 run function reduced_world_infos:set_light_meter_model {light:14,converted_light:8}
execute at @s if predicate reduced_world_infos:light_level/15 run function reduced_world_infos:set_light_meter_model {light:15,converted_light:9}

#show infos
title @s actionbar [{"text":"Light Level: ","color":"white"},{"plain":true,"nbt":"light","storage":"reduced_world_infos","color":"yellow"}]
tag @s add reduced_world_infos-using_action_bar