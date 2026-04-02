execute if items entity @s weapon.* reduced_world_infos:logbook[!minecraft:custom_data~{altimeter:1b}] if items entity @s weapon.* reduced_world_infos:altimeter run return run function reduced_world_infos:logbook/upgrade/altimeter
execute if items entity @s weapon.* reduced_world_infos:logbook[!minecraft:custom_data~{compass:1b}] if items entity @s weapon.* minecraft:compass[minecraft:item_model="minecraft:compass"] run return run function reduced_world_infos:logbook/upgrade/compass
execute if items entity @s weapon.* reduced_world_infos:logbook[!minecraft:custom_data~{clock:1b}] if items entity @s weapon.* minecraft:clock[minecraft:item_model="minecraft:clock"] run return run function reduced_world_infos:logbook/upgrade/clock
execute if items entity @s weapon.* reduced_world_infos:logbook[!minecraft:custom_data~{attuned_clock:1b}] if items entity @s weapon.* reduced_world_infos:attuned_clock run return run function reduced_world_infos:logbook/upgrade/attuned_clock
execute if items entity @s weapon.* reduced_world_infos:logbook[!minecraft:custom_data~{light_meter:1b}] if items entity @s weapon.* reduced_world_infos:light_meter run return run function reduced_world_infos:logbook/upgrade/light_meter
execute if items entity @s weapon.* reduced_world_infos:logbook[!minecraft:custom_data~{biome_recognizer:1b}] if items entity @s weapon.* reduced_world_infos:biome_recognizer run return run function reduced_world_infos:logbook/upgrade/biome_recognizer
execute if items entity @s weapon.* reduced_world_infos:logbook[!minecraft:custom_data~{calibration_shard:1b}] if items entity @s weapon.* reduced_world_infos:calibration_shard run return run function reduced_world_infos:logbook/upgrade/calibration_shard

execute at @s unless dimension minecraft:overworld run return run function reduced_world_infos:logbook/cancel_relative_coordinate

playsound minecraft:ui.cartography_table.take_result master @s