#s 进度保留1/  execute as @a[scores={version=3}] at @s run tp @e[type=function:flying_blade,tag=!run_] ~ ~ ~ facing @p[scores={version=3}]

#判断杀手朝着正面，给与飞刀朝着正面方向的 平民 / 侦探 修正弹道
execute as @e[type=function:flying_blade,tag=!run_] at @s run execute as @p[r=3,scores={version=3},rym=-45,ry=45  ] at @s run tag @e[c=1,r=3,type=function:flying_blade] add front_
#判断杀手朝着左侧，给与飞刀朝着正面方向的 平民 / 侦探 修正弹道
execute as @e[type=function:flying_blade,tag=!run_] at @s run execute as @p[r=3,scores={version=3},rym=-145,ry=-45] at @s run tag @e[c=1,r=3,type=function:flying_blade] add left_
#判断杀手朝着右侧，给与飞刀朝着正面方向的 平民 / 侦探 修正弹道
execute as @e[type=function:flying_blade,tag=!run_] at @s run execute as @p[r=3,scores={version=3},rym=45,ry=145  ] at @s run tag @e[c=1,r=3,type=function:flying_blade] add right_
#判断杀手朝着后方，给与飞刀朝着正面方向的 平民 / 侦探 修正弹道
execute as @e[type=function:flying_blade,tag=!run_] at @s run execute as @p[r=3,scores={version=3},rym=145,ry=-145] at @s run tag @e[c=1,r=3,type=function:flying_blade] add rear_

#避免重复当上方执行完，就给予run_标签
tag @e[type=function:flying_blade] add run_

#跟踪算法 / 根据方向标签选择朝向的目标来跟踪 / 延迟修正弹道
scoreboard players add @e[type=function:flying_blade] tick2 0
execute as @e[type=function:flying_blade,scores={tick2=..0}] at @s run function call_function/flying_blade/distance_weighted_search
scoreboard players random @e[type=function:flying_blade,scores={tick2=..0}] tick2 1 60
scoreboard players add @e[type=function:flying_blade] tick2 -1


#前进 /                                                            前进速度 v
execute as @e[type=function:flying_blade] at @s if block ~~~ air run tp ^^^0.5


#当碰撞墙壁就消除自己
execute as @e[type=function:flying_blade] at @s unless block ~~~ air run function call_function/flying_blade/touch_the_wall 
#当碰撞指定目标就杀死目标和消除自己
execute as @e[type=function:flying_blade] at @s if entity @e[scores={version=1..2},r=1] run function call_function/flying_blade/successful_assassination





#太久没判断到实体或墙壁，就清除
scoreboard players add @e[type=function:flying_blade] tick 1
kill @e[type=function:flying_blade,scores={tick=100..}]