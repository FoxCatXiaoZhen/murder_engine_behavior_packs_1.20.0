tellraw @s {"rawtext":[{"text":"§7§o>>  仅限杀手能见度不会降低"}]}
playsound random.bow @s ~~~ 1 0.45
playsound random.bow @s ~~~ 1 0.55
playsound smoke_grenade @a ~~~ 0.5  

execute as @a at @s run execute as @r[type=!player,r=15,c=2,family=function] at @s unless entity @e[type=function:smoke_grenade,r=2,c=1] run summon function:smoke_grenade 

#冷却时间
execute as @s[scores={tick=..-1}] at @s run scoreboard players set @s tick 1500
clear @s function:smoke_grenade 0 1