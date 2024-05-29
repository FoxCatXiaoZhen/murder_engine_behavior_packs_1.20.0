clearspawnpoint @s
scoreboard players add @s version 0 
execute unless entity @e[tag=game_activate] run gamemode a @s[tag=!main_player_]
execute if entity     @e[tag=game_activate] run gamemode spectator @s
execute if entity     @e[tag=game_activate] run tag @s add died
execute if entity     @e[tag=game_activate] run tp @s @r[scores={version=1..3},tag=!died,type=!player]
execute if entity     @e[tag=game_activate] run tp @s @r[scores={version=1..3},tag=!died]
execute unless entity @e[tag=game_activate] run tp @s @e[type=function:lobby_respawn_point,c=1]
scoreboard players set @s gold 0 
scoreboard players set @s version 0 
clear @s iron_sword
clear @s function:flying_blade
clear @s bow
clear @s minecraft:filled_map
execute unless entity @e[tag=game_activate] run tag @s remove died
