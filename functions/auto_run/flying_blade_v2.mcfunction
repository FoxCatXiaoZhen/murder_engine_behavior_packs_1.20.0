#传送到最近的杀手 / 将杀手的头角度复制粘贴到飞刀上
execute as @e[type=function:flying_blade,tag=!run_] at @s run tp @s @p[scores={version=3},r=7] 
execute as @e[type=function:flying_blade,tag=!run_] at @s run tp ~~1~

#避免重复当上方执行完，就给予run_标签
tag @e[type=function:flying_blade] add run_


#前进                                                            前进速度 v
execute as @e[type=function:flying_blade] at @s if block ~~~ air run tp ^^^0.5


##由于杀手的头垂直角度无法复制进飞刀实体上，所只能自动修正高度。##可能无法采用，需要尝试用跟踪算法矫正
#如果目标位于上方，就升高。
execute as @e[type=function:flying_blade] at @s if entity @e[scores={version=1..2},y=~0,x=~-10000,z=~-10000,dx=100000,dy=1000,dz=100000] run tp ~~0.2~
#如果目标位于下方，就下降。
execute as @e[type=function:flying_blade] at @s if entity @e[scores={version=1..2},y=~-1,x=~-10000,z=~-10000,dx=100000,dy=-1000,dz=100000] run tp ~~-0.2~


#当碰撞墙壁就消除自己
execute as @e[type=function:flying_blade,scores={tick=10..}] at @s unless block ~~~ air run function call_function/flying_blade/touch_the_wall 
#当碰撞指定目标就杀死目标和消除自己
execute as @e[type=function:flying_blade,scores={tick=10..}] at @s if entity @e[scores={version=1..2},r=1] run function call_function/flying_blade/successful_assassination





#太久没判断到实体或墙壁，就清除
scoreboard players add @e[type=function:flying_blade] tick 1
kill @e[type=function:flying_blade,scores={tick=100..}]