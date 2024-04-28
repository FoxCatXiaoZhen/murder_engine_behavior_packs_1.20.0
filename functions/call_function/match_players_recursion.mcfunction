execute as @p[tag=!in_game_] at @s run function call_function/match_players
execute if entity @a[tag=!in_game_] run function call_function/match_players_recursion