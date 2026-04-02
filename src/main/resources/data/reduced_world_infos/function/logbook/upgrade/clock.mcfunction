playsound minecraft:ui.button.click master @s

scoreboard players set @s reduced_world_infos-logbook_timer 0
scoreboard players set @s reduced_world_infos-logbook_timer_reset 0

execute if items entity @s weapon.mainhand reduced_world_infos:logbook run item modify entity @s weapon.mainhand reduced_world_infos:logbook_upgrade/clock
execute if items entity @s weapon.mainhand reduced_world_infos:logbook run item modify entity @s weapon.offhand reduced_world_infos:reduce_count_1

execute if items entity @s weapon.offhand reduced_world_infos:logbook run item modify entity @s weapon.offhand reduced_world_infos:logbook_upgrade/clock
execute if items entity @s weapon.offhand reduced_world_infos:logbook run item modify entity @s weapon.mainhand reduced_world_infos:reduce_count_1