tellraw @a {"rawtext":[{"text":"§b§o>>  已有人抢在其他人率先成为了侦探！"}]}
scoreboard players set @s version 2
clear @s bow
give @s bow
playsound random.levelup @s
effect @e[type=function:hat_item,c=1,r=1.5] invisibility 30 1 true
kill @e[type=function:hat_item,c=1,r=1.5]
