summon function:knive_navigation ^^0.0025^1
tp @s ~~~ facing @e[type=function:knive_navigation,c=1,tag=!run_]
tag @e[c=1,type=function:knive_navigation,tag=!run_] add run_
execute as @s at @s if block ~~~ air run tp ^^^0.8
tp @e[type=function:knive_navigation] @e[type=function:lobby_respawn_point,c=1]
execute as @s[rx=0] run tp ~~~ ~~-10
execute as @s[rxm=-0.1,rx=-20] run tp ~~~ ~~10
execute as @s[rxm=-20] run tp ~~~ ~~11