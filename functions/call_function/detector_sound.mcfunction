scoreboard players add @a[scores={version=3}] sounds_tick 1

#响应等级lv12
execute as @e at @s if entity @e[scores={version=1..2},rm=60] run scoreboard players set @s[scores={sounds_tick=20..}] sounds_tick 0
execute as @e at @s if entity @e[scores={version=1..2},rm=60] run  playsound note.pling @s[scores={sounds_tick=0}] ~~~ 0.5 0.583

#响应等级lv1
execute as @e at @s if entity @e[scores={version=1..2},rm=50,r=60] run scoreboard players set @s[scores={sounds_tick=18..}] sounds_tick 0
execute as @e at @s if entity @e[scores={version=1..2},rm=50,r=60] run  playsound note.pling @s[scores={sounds_tick=0}] ~~~ 0.5 0.666

#响应等级lv1
execute as @e at @s if entity @e[scores={version=1..2},rm=40,r=50] run scoreboard players set @s[scores={sounds_tick=16..}] sounds_tick 0
execute as @e at @s if entity @e[scores={version=1..2},rm=40,r=50] run  playsound note.pling @s[scores={sounds_tick=0}] ~~~ 0.5 0.749

#响应等级lv9
execute as @s at @s if entity @e[scores={version=1..2},rm=35,r=40] run scoreboard players set @s[scores={sounds_tick=15..}] sounds_tick 0
execute as @s at @s if entity @e[scores={version=1..2},rm=35,r=40] run  playsound note.pling @s[scores={sounds_tick=0}] ~~~ 0.5 0.832

#响应等级lv8
execute as @s at @s if entity @e[scores={version=1..2},rm=30,r=35] run scoreboard players set @s[scores={sounds_tick=14..}] sounds_tick 0
execute as @s at @s if entity @e[scores={version=1..2},rm=30,r=35] run  playsound note.pling @s[scores={sounds_tick=0}] ~~~ 0.5 0.915

#响应等级lv7
execute as @s at @s if entity @e[scores={version=1..2},rm=25,r=30] run scoreboard players set @s[scores={sounds_tick=13..}] sounds_tick 0
execute as @s at @s if entity @e[scores={version=1..2},rm=25,r=30] run  playsound note.pling @s[scores={sounds_tick=0}] ~~~ 0.5 0.998

#响应等级lv8
execute as @s at @s if entity @e[scores={version=1..2},rm=20,r=25] run scoreboard players set @s[scores={sounds_tick=12..}] sounds_tick 0
execute as @s at @s if entity @e[scores={version=1..2},rm=20,r=25] run  playsound note.pling @s[scores={sounds_tick=0}] ~~~ 0.5 1.081

#响应等级lv7
execute as @s at @s if entity @e[scores={version=1..2},rm=15,r=20] run scoreboard players set @s[scores={sounds_tick=10..}] sounds_tick 0
execute as @s at @s if entity @e[scores={version=1..2},rm=15,r=20] run  playsound note.pling @s[scores={sounds_tick=0}] ~~~ 0.5 1.164

#响应等级lv6
execute as @s at @s if entity @e[scores={version=1..2},rm=10,r=15] run scoreboard players set @s[scores={sounds_tick=9..}] sounds_tick 0
execute as @s at @s if entity @e[scores={version=1..2},rm=10,r=15] run  playsound note.pling @s[scores={sounds_tick=0}] ~~~ 0.5 1.247

#响应等级lv5
execute as @s at @s if entity @e[scores={version=1..2},rm=5,r=10] run scoreboard players set @s[scores={sounds_tick=7..}] sounds_tick 0
execute as @s at @s if entity @e[scores={version=1..2},rm=5,r=10] run  playsound note.pling @s[scores={sounds_tick=0}] ~~~ 0.5 1.33

#响应等级lv4
execute as @s at @s if entity @e[scores={version=1..2},rm=2.5,r=5] run scoreboard players set @s[scores={sounds_tick=5..}] sounds_tick 0
execute as @s at @s if entity @e[scores={version=1..2},rm=2.5,r=5] run  playsound note.pling @s[scores={sounds_tick=0}] ~~~ 0.5 1.413

#响应等级lv3
execute as @s at @s if entity @e[scores={version=1..2},r=2.5] run scoreboard players set @s[scores={sounds_tick=2..}] sounds_tick 0
execute as @s at @s if entity @e[scores={version=1..2},r=2.5] run  playsound note.pling @s[scores={sounds_tick=0}] ~~~ 0.5 1.496