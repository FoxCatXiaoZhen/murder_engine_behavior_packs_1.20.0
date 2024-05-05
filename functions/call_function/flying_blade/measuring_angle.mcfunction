summon function:knive_navigation ^^-0.005^1
tp @s ~~~ facing @e[type=function:knive_navigation,c=1,tag=!run_]
tag @e[c=1,type=function:knive_navigation,tag=!run_] add run_
tp ^^^0.65
tp @e[type=function:knive_navigation] @e[type=function:lobby_respawn_point,c=1]
execute as @s[rx=0] run tp ~~~ ~~-10.1
execute as @s[rxm=-0.1] run tp ~~~ ~~10
