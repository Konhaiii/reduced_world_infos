execute at @s unless dimension minecraft:overworld run return run function reduced_world_infos:logbook/cancel_relative_coordinate

playsound minecraft:item.lodestone_compass.lock master @s

scoreboard players set @s reduced_world_infos-logbook_timer 0
scoreboard players set @s reduced_world_infos-logbook_timer_reset 0

execute if items entity @s weapon.mainhand reduced_world_infos:logbook run return run item modify entity @s weapon.mainhand reduced_world_infos:logbook_relative_coordinates
item modify entity @s weapon.offhand reduced_world_infos:logbook_relative_coordinates