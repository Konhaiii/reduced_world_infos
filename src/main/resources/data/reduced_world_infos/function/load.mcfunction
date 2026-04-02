gamerule reduced_debug_info true
setworldspawn 0 0 -973078528
scoreboard objectives add reduced_world_infos-rY dummy
scoreboard objectives add reduced_world_infos-cl dummy
scoreboard objectives add reduced_world_infos-rel_x dummy
scoreboard objectives add reduced_world_infos-rel_z dummy
scoreboard objectives add reduced_world_infos-x dummy
scoreboard objectives add reduced_world_infos-z dummy
scoreboard objectives add reduced_world_infos-logbook_timer dummy
scoreboard objectives add reduced_world_infos-logbook_sneak_timer dummy
scoreboard objectives add reduced_world_infos-logbook_timer_reset dummy
scoreboard players set $hourfactor reduced_world_infos-cl 1000
scoreboard players set $minutefactor reduced_world_infos-cl 16667
