playsound scrape @a ~~~ 0.5 1.2
summon function:flying_blade ^^1.2^1
summon function:knive_navigation ^^1.2^11
execute as @e[c=1,type=function:flying_blade,tag=!run_] at @s run tp ^^^ facing @e[c=1,type=function:knive_navigation,tag=!run_]
tag @e[c=1,type=function:flying_blade,tag=!run_] add run_
tag @e[c=1,type=function:knive_navigation,tag=!run_] add run_
tp @e[type=function:knive_navigation] @e[type=function:lobby_respawn_point,c=1]