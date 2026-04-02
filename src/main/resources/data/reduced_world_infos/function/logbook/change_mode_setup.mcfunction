execute if items entity @s weapon.mainhand reduced_world_infos:logbook run function reduced_world_infos:logbook/change_mode_mainhand_setup
execute unless items entity @s weapon.mainhand reduced_world_infos:logbook run function reduced_world_infos:logbook/change_mode_offhand_setup
playsound minecraft:entity.villager.work_librarian master @s

scoreboard players set @s reduced_world_infos-logbook_sneak_timer 10