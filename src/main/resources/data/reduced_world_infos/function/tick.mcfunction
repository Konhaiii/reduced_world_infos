execute as @a[gamemode=!spectator] run function reduced_world_infos:check_for_held_items

#sneak cancel
execute as @a unless predicate reduced_world_infos:is_sneaking run advancement revoke @s only reduced_world_infos:function/use_logbook
execute as @a[scores={reduced_world_infos-logbook_sneak_timer=..0}] run advancement revoke @s only reduced_world_infos:function/use_logbook

scoreboard players remove @a[scores={reduced_world_infos-logbook_timer_reset=1..}] reduced_world_infos-logbook_timer_reset 1
scoreboard players remove @a[scores={reduced_world_infos-logbook_sneak_timer=1..}] reduced_world_infos-logbook_sneak_timer 1
scoreboard players set @a[scores={reduced_world_infos-logbook_timer_reset=..0,reduced_world_infos-logbook_timer=1..}] reduced_world_infos-logbook_timer 0