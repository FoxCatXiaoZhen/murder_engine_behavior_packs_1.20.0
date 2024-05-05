#执行弹道计算和前进
execute as @e[type=function:flying_blade] at @s run function call_function/flying_blade/measuring_angle
#当碰撞墙壁就消除自己
execute as @e[type=function:flying_blade,scores={tick=10..}] at @s unless block ~~~ air run function call_function/flying_blade/touch_the_wall 
#当碰撞指定目标就杀死目标和消除自己
execute as @e[type=function:flying_blade,scores={tick=10..}] at @s if entity @e[scores={version=1..2},r=1.5] run function call_function/flying_blade/successful_assassination


#太久没判断到实体或墙壁，就清除
scoreboard players add @e[type=function:flying_blade] tick 1
execute as @e[type=function:flying_blade,scores={tick=100..}] at @s run function call_function/flying_blade/touch_the_wall 

#把大厅的导航实体清除
execute as @e[type=function:lobby_respawn_point,c=1] at @s run kill @e[type=function:knive_navigation,r=2,tag=run_]