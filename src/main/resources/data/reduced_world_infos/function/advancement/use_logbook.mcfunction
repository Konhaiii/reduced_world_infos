execute if predicate reduced_world_infos:is_sneaking run return run function reduced_world_infos:logbook/change_mode_setup

scoreboard players add @s reduced_world_infos-logbook_timer 1
scoreboard players set @s reduced_world_infos-logbook_timer_reset 2

execute if entity @s[scores={reduced_world_infos-logbook_timer=10}] run function reduced_world_infos:logbook/step
execute if entity @s[scores={reduced_world_infos-logbook_timer=30}] run function reduced_world_infos:logbook/step
execute if entity @s[scores={reduced_world_infos-logbook_timer=50}] run function reduced_world_infos:logbook/step
execute if entity @s[scores={reduced_world_infos-logbook_timer=70}] run function reduced_world_infos:logbook/final_step

advancement revoke @s only reduced_world_infos:function/use_logbook