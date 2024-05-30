playsound scrape @a ~~~ 0.5 1.2
playsound game.player.attack.strong @s ~~~ 1 0.95
playsound game.player.attack.strong @s ~~~ 1 1
playsound random.bow @s ~~~ 0.3 0.25
playsound random.bow @s ~~~ 0.3 0.35

summon function:flying_blade ^^0.7^1
summon function:knive_navigation ^^0.7^11
#tp @e[type=function:flying_blade,c=1] ~~1.2~
#tp @e[type=function:knive_navigation,c=1] ~~1.2~

execute as @e[c=1,type=function:flying_blade,tag=!run_] at @s run tp ^^^ facing @e[c=1,type=function:knive_navigation,tag=!run_]
tag @e[c=1,type=function:flying_blade,tag=!run_] add run_
tag @e[c=1,type=function:knive_navigation,tag=!run_] add run_
tp @e[type=function:knive_navigation] @e[type=function:lobby_respawn_point,c=1]

#冷却时间
execute as @s[scores={tick2=..-1},m=!c] at @s run scoreboard players operation @s tick2 = knive_cd time_setting
clear @s[m=!c] function:flying_blade 0 1