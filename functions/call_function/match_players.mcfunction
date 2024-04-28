tag @s add in_game_
execute unless entity @e[type=function:player_respawn_point,tag=!is_use_] run tag @e[type=function:player_respawn_point] remove is_use_
tp @s @r[type=!player,type=function:player_respawn_point,c=1,tag=!is_use_] 
tag @e[type=function:player_respawn_point,r=1,c=1] add is_use_