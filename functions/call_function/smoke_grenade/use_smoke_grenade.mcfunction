tellraw @s {"rawtext":[{"text":"§7§o>>  仅限杀手能见度不会降低"}]}
playsound random.bow @s ~~~ 1 0.45
playsound random.bow @s ~~~ 1 0.55
playsound smoke_grenade @a ~~~ 0.5  

execute as @a at @s run execute as @r[type=!player,c=1,family=function] at @s unless entity @e[type=function:smoke_grenade,r=2,c=1] run summon function:smoke_grenade 
execute as @r at @s unless entity @s run summon function:smoke_grenade


#冷却时间
execute as @s[scores={tick=..-1},m=!c] at @s run scoreboard players set @s tick 1500
clear @s[m=!c] function:smoke_grenade 0 1