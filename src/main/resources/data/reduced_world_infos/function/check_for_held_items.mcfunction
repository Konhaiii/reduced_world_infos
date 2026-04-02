execute if items entity @s weapon.* reduced_world_infos:logbook[minecraft:custom_data~{current_mode:"attuned_clock"}] run return run function reduced_world_infos:hold_item/attuned_clock
execute if items entity @s weapon.* reduced_world_infos:logbook[minecraft:custom_data~{current_mode:"biome_recognizer"}] run return run function reduced_world_infos:hold_item/biome_recognizer
execute if items entity @s weapon.* reduced_world_infos:logbook[minecraft:custom_data~{current_mode:"clock"}] run return run function reduced_world_infos:hold_item/clock
execute if items entity @s weapon.* reduced_world_infos:logbook[minecraft:custom_data~{current_mode:"compass"}] run return run function reduced_world_infos:hold_item/compass
execute if items entity @s weapon.* reduced_world_infos:logbook[minecraft:custom_data~{current_mode:"light_meter"}] run return run function reduced_world_infos:hold_item/light_meter

execute if items entity @s weapon.* reduced_world_infos:logbook run return run function reduced_world_infos:hold_item/logbook
execute if items entity @s weapon.* reduced_world_infos:altimeter run return run function reduced_world_infos:hold_item/altimeter
execute if items entity @s weapon.* reduced_world_infos:attuned_clock run return run function reduced_world_infos:hold_item/attuned_clock
execute if items entity @s weapon.* reduced_world_infos:biome_recognizer run return run function reduced_world_infos:hold_item/biome_recognizer
execute if items entity @s weapon.* minecraft:clock[minecraft:item_model="minecraft:clock"] run return run function reduced_world_infos:hold_item/clock
execute if items entity @s weapon.* minecraft:compass[minecraft:item_model="minecraft:compass"] run return run function reduced_world_infos:hold_item/compass
execute if items entity @s weapon.* reduced_world_infos:light_meter run return run function reduced_world_infos:hold_item/light_meter
execute if items entity @s weapon.* minecraft:recovery_compass[minecraft:item_model="minecraft:recovery_compass"] run return run function reduced_world_infos:hold_item/recovery_compass
title @s[tag=reduced_world_infos-using_action_bar] actionbar {"text":""}
tag @s remove reduced_world_infos-using_action_bar