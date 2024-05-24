gamemode a @a
fog @a remove fx:smoke
fog @a remove fx:org
tp @a @e[type=function:lobby_respawn_point,c=1]
tag @e[type=function:lobby_respawn_point] remove game_activate
tag @e[type=function:lobby_respawn_point] remove time_start
scoreboard players reset @e[type=function:gold_ingot_generator] tick
tag @e[type=function:gold_ingot_generator] remove run_
kill @e[type=item]
scoreboard players set @a tick 0 
scoreboard players set @a tick2 0
kill @e[type=function:flying_blade]
kill @e[type=function:knive_navigation]
scoreboard players set @a gold 0 
scoreboard players set @a version 0 
clear @a iron_sword
clear @a function:flying_blade
clear @a bow
clear @a arrow
clear @a function:detector
tag @a remove died
kill @e[type=function:hat_item]
execute as @e[type=function:smoke_grenade] at @s run scoreboard players set @s tick2 10000000
scoreboard players set @e[type=function:lobby_respawn_point] tick2 0
scoreboard players set @e[type=function:lobby_respawn_point] tick 0
scoreboard players set @e version2 0
function call_function/reset_player_respawn_data 
execute if score time time_setting matches 0 run function call_function/time/set_time_02m_00s
execute if score time time_setting matches 1 run function call_function/time/set_time_03m_00s
execute if score time time_setting matches 2 run function call_function/time/set_time_05m_00s
execute if score time time_setting matches 3 run function call_function/time/set_time_10m_00s
execute if score time time_setting matches 4 run function call_function/time/set_time_15m_00s