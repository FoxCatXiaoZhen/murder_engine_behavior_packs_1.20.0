#当出现时脉冲执行动画
playanimation @e[type=function:smoke_grenade,scores={tick2=!2..}] animation.smoke_grenade.fx
execute as @e[type=function:smoke_grenade,scores={tick2=!2..}] at @s run playsound smoke_grenade @a ~~~ 0.5

#播放音效
execute as @e[type=function:smoke_grenade,scores={tick2=60}] at @s run execute as @a at @s run function call_function/smoke_grenade/sound
execute as @e[type=function:smoke_grenade,scores={tick2=450}] at @s run execute as @a at @s run playsound random.fizz     @s ^^^ 0.5 0.5

#烟雾
execute as @e[type=function:smoke_grenade,scores={tick2=60..400,tick=0}] at @s run particle fx:smoke
execute as @a[scores={version=3}] at @s      run execute as @r[rm=30,type=!player,c=4,family=function] at @s if entity @e[type=function:smoke_grenade,scores={tick2=60..400,tick=0}]  run particle fx:smoke
execute unless entity @a[scores={version=3}] run execute as @r[      type=!player,c=4,family=function] at @s if entity @e[type=function:smoke_grenade,scores={tick2=60..400,tick=0}]  run particle fx:smoke
#迷雾
execute if entity @e[type=function:smoke_grenade,scores={tick2=60}] run fog @a[scores={version=1..2}] push fx:smoke fx:smoke
execute if entity @e[type=function:smoke_grenade,scores={tick2=450}] run fog @a[scores={version=1..2}] push fx:org fx:org
execute if entity @e[type=function:smoke_grenade,scores={tick2=490..}] run fog @a remove fx:smoke
execute if entity @e[type=function:smoke_grenade,scores={tick2=490..}] run fog @a remove fx:org



#增加时间 / 延迟
scoreboard players add @e[type=function:smoke_grenade] tick 1
scoreboard players add @e[type=function:smoke_grenade] tick2 1
scoreboard players set @e[type=function:smoke_grenade,scores={tick=10..}] tick 0
 



#隐藏 / 清除
effect @e[type=function:smoke_grenade,scores={tick2=140..}] invisibility 2 1 true
kill @e[type=function:smoke_grenade,scores={tick2=500..}]






#冷却结束时 / 不再减少分数 / 给于烟雾弹
execute as @e[scores={version=3}] at @s run scoreboard players add @s[scores={tick=0..}] tick -1
execute as @e[scores={version=3}] at @s run give @s[scores={tick=0}] function:smoke_grenade