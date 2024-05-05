#
#s execute as @p at @s positioned ^^^1 run  particle minecraft:large_explosion ~~2~
#传送到最近的杀手 / 将杀手的头角度复制粘贴到飞刀上
#s execute as @e[type=function:flying_blade,tag=!run_] at @s run execute as @p[scores={version=3},r=7] at @s run tp @e[type=function:flying_blade,c=1,r=3] ~~1~ 

#避免重复当上方执行完，就给予run_标签
#s tag @e[type=function:flying_blade] add run_
#s tag @e[type=function:knive_navigation] add run_

#锁定导航实体
#s execute as @e[type=function:knive_navigation] at @s tp @s @s

#执行弹道计算和前进
execute as @e[type=function:flying_blade] at @s run function call_function/flying_blade/measuring_angle

#前进                                                                 前进速度 v              
#s execute as @e[type=function:knive_navigation] at @s if block ~~~ air run tp ^^^-0.5 facing @e[type=function:flying_blade,c=1,r=2.5]
#s execute as @e[type=function:flying_blade] at @s run tp ^^^0.5 

#当碰撞墙壁就消除自己
execute as @e[type=function:flying_blade,scores={tick=10..}] at @s unless block ~~~ air run function call_function/flying_blade/touch_the_wall 
#当碰撞指定目标就杀死目标和消除自己
execute as @e[type=function:flying_blade,scores={tick=10..}] at @s if entity @e[scores={version=1..2},r=1.5] run function call_function/flying_blade/successful_assassination





#太久没判断到实体或墙壁，就清除
scoreboard players add @e[type=function:flying_blade] tick 1
execute as @e[type=function:flying_blade,scores={tick=100..}] at @s run function call_function/flying_blade/touch_the_wall 

#导航如果与飞刀实体失联，就清除掉。
#s execute as @e[type=function:knive_navigation] at @s unless entity @e[type=function:flying_blade,r=0.5] run kill @s

#把大厅的导航实体清除
execute as @e[type=function:lobby_respawn_point,c=1] at @s run kill @e[type=function:knive_navigation,r=2,tag=run_]