tp @a @e[type=function:lobby_respawn_point,c=1]
tag @a[tag=main_player_] remove game_activate
tag @e[type=function:lobby_respawn_point] remove time_start
scoreboard players reset @e[type=function:gold_ingot_generator] tick
tag @e[type=function:gold_ingot_generator] remove run_
kill @e[type=item]
scoreboard players set @a gold 0 
clear @a iron_sword
clear @a bow
tag @a remove died

function call_function/reset_player_respawn_data 
execute if score time time_setting matches 0 run function /time/set_time_02m_00s
execute if score time time_setting matches 1 run function /time/set_time_03m_00s
execute if score time time_setting matches 2 run function call_function/time/set_time_05m_00s