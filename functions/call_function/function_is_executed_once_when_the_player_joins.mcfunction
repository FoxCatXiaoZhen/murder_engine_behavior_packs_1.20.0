clearspawnpoint @s
scoreboard players add @s version 0 
execute unless entity @e[tag=game_activate] run gamemode a @s
execute if entity @e[tag=game_activate] run gamemode spectator @s
execute if entity @e[tag=game_activate] run tag @s add died
tp @s @e[type=function:lobby_respawn_point,c=1]
scoreboard players set @s gold 0 
scoreboard players set @s version 0 
clear @s iron_sword
clear @s function:flying_blade
clear @s bow
clear @s minecraft:filled_map
tag @s remove died
