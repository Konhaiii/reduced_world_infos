#check logbook state
execute if items entity @s weapon.mainhand reduced_world_infos:logbook run tag @s add reduced_world_infos-logbook_mainhand
execute if entity @s[tag=reduced_world_infos-logbook_mainhand] if items entity @s weapon.mainhand *[minecraft:custom_data~{current_mode:"calibration_shard"}] run tag @s add reduced_world_infos-logbook_calibrated
execute unless entity @s[tag=reduced_world_infos-logbook_mainhand] if items entity @s weapon.offhand *[minecraft:custom_data~{current_mode:"calibration_shard"}] run tag @s add reduced_world_infos-logbook_calibrated
execute if entity @s[tag=reduced_world_infos-logbook_mainhand] if items entity @s weapon.mainhand *[minecraft:custom_data~{altimeter:1b}] run tag @s add reduced_world_infos-logbook_altimeter
execute unless entity @s[tag=reduced_world_infos-logbook_mainhand] if items entity @s weapon.offhand *[minecraft:custom_data~{altimeter:1b}] run tag @s add reduced_world_infos-logbook_altimeter
execute if entity @s[tag=reduced_world_infos-logbook_mainhand] unless items entity @s weapon.mainhand *[!minecraft:custom_data~{relative_x:"none",relative_z:"none"}] run tag @s add reduced_world_infos-logbook_unset
execute unless entity @s[tag=reduced_world_infos-logbook_mainhand] unless items entity @s weapon.offhand *[!minecraft:custom_data~{relative_x:"none",relative_z:"none"}] run tag @s add reduced_world_infos-logbook_unset

#coords
data modify storage reduced_world_infos pos set from entity @s Pos
execute store result score @s reduced_world_infos-x run data get entity @s Pos[0]
execute store result score @s reduced_world_infos-z run data get entity @s Pos[2]
execute if entity @s[tag=reduced_world_infos-logbook_mainhand,tag=!reduced_world_infos-logbook_unset] store result score @s reduced_world_infos-rel_x run data get entity @s SelectedItem.components."minecraft:custom_data".relative_x
execute if entity @s[tag=reduced_world_infos-logbook_mainhand,tag=!reduced_world_infos-logbook_unset] store result score @s reduced_world_infos-rel_z run data get entity @s SelectedItem.components."minecraft:custom_data".relative_z
execute if entity @s[tag=!reduced_world_infos-logbook_mainhand,tag=!reduced_world_infos-logbook_unset] store result score @s reduced_world_infos-rel_x run data get entity @s equipment.offhand.components."minecraft:custom_data".relative_x
execute if entity @s[tag=!reduced_world_infos-logbook_mainhand,tag=!reduced_world_infos-logbook_unset] store result score @s reduced_world_infos-rel_z run data get entity @s equipment.offhand.components."minecraft:custom_data".relative_z
execute if entity @s[tag=!reduced_world_infos-logbook_unset] run scoreboard players operation @s reduced_world_infos-x -= @s reduced_world_infos-rel_x
execute if entity @s[tag=!reduced_world_infos-logbook_unset] run scoreboard players operation @s reduced_world_infos-z -= @s reduced_world_infos-rel_z
execute if entity @s[tag=!reduced_world_infos-logbook_unset] store result storage reduced_world_infos posX int 1 run scoreboard players get @s reduced_world_infos-x
execute if entity @s[tag=!reduced_world_infos-logbook_unset] store result storage reduced_world_infos posZ int 1 run scoreboard players get @s reduced_world_infos-z
execute if entity @s[tag=reduced_world_infos-logbook_unset] run data modify storage minecraft:reduced_world_infos posX set value "?"
execute if entity @s[tag=reduced_world_infos-logbook_unset] run data modify storage minecraft:reduced_world_infos posZ set value "?"
execute at @s unless dimension minecraft:overworld run data modify storage minecraft:reduced_world_infos posX set value "?"
execute at @s unless dimension minecraft:overworld run data modify storage minecraft:reduced_world_infos posZ set value "?"
execute if entity @s[tag=reduced_world_infos-logbook_calibrated] store result storage minecraft:reduced_world_infos posX int 1 run data get storage reduced_world_infos pos[0]
execute store result storage reduced_world_infos posY int 1 run data get storage reduced_world_infos pos[1]
execute if entity @s[tag=reduced_world_infos-logbook_calibrated] store result storage minecraft:reduced_world_infos posZ int 1 run data get storage reduced_world_infos pos[2]

#show infos
execute if entity @s[tag=!reduced_world_infos-logbook_calibrated,tag=!reduced_world_infos-logbook_altimeter] run title @s actionbar [{"color":"white","text":"X: "},{"color":"red","plain":true,"nbt":"posX","storage":"reduced_world_infos"},{"color":"white","text":" Z: "},{"color":"red","plain":true,"nbt":"posZ","storage":"reduced_world_infos"}]
execute if entity @s[tag=reduced_world_infos-logbook_calibrated,tag=!reduced_world_infos-logbook_altimeter] run title @s actionbar [{"color":"white","text":"X: "},{"color":"yellow","plain":true,"nbt":"posX","storage":"reduced_world_infos"},{"color":"white","text":" Z: "},{"color":"yellow","plain":true,"nbt":"posZ","storage":"reduced_world_infos"}]
execute if entity @s[tag=!reduced_world_infos-logbook_calibrated,tag=reduced_world_infos-logbook_altimeter] run title @s actionbar [{"color":"white","text":"X: "},{"color":"red","plain":true,"nbt":"posX","storage":"reduced_world_infos"},{"color":"white","text":" Y: "},{"color":"yellow","plain":true,"nbt":"posY","storage":"reduced_world_infos"},{"color":"white","text":" Z: "},{"color":"red","plain":true,"nbt":"posZ","storage":"reduced_world_infos"}]
execute if entity @s[tag=reduced_world_infos-logbook_calibrated,tag=reduced_world_infos-logbook_altimeter] run title @s actionbar [{"color":"white","text":"X: "},{"color":"yellow","plain":true,"nbt":"posX","storage":"reduced_world_infos"},{"color":"white","text":" Y: "},{"color":"yellow","plain":true,"nbt":"posY","storage":"reduced_world_infos"},{"color":"white","text":" Z: "},{"color":"yellow","plain":true,"nbt":"posZ","storage":"reduced_world_infos"}]

#remove tags
tag @s remove reduced_world_infos-logbook_unset
tag @s remove reduced_world_infos-logbook_mainhand
tag @s remove reduced_world_infos-logbook_calibrated
tag @s remove reduced_world_infos-logbook_altimeter
tag @s add reduced_world_infos-using_action_bar