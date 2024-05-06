execute as @s[scores={tick2=1..}] run playsound scrape @s 1 1.2
execute as @s[scores={tick2=1..}] run tellraw @s { "rawtext": [{"text":">>冷却还未结束w"}] }

execute as @s[scores={tick2=0}] run summon function:flying_blade ~~1~ facing ^^^10
execute as @s[scores={tick2=0}] run summon function:knive_navigation ^^^50 facing ^^^10
execute as @s[scores={tick2=0}] run scoreboard players operation @s tick2 = knive_cd time_setting