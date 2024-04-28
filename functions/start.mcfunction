execute unless entity @a[tag=game_activate] run function call_function/randomize_role_scoreboard
execute unless entity @a[tag=game_activate] run function call_function/match_players_recursion
execute unless entity @a[tag=game_activate] run tag @e[type=function:gold_ingot_generator] add run_
execute unless entity @a[tag=game_activate] run tag @e[type=function:lobby_respawn_point] add time_start
execute unless entity @a[tag=game_activate] run give @a[scores={version=3}] iron_sword
execute unless entity @a[tag=game_activate] run give @a[scores={version=2}] bow 
execute unless entity @a[tag=game_activate] run title @a title §a游戏开始
execute unless entity @a[tag=game_activate] run playsound random.levelup @a

tag @a[tag=main_player_] add game_activate
scoreboard players set @e[type=function:lobby_respawn_point] num2 0