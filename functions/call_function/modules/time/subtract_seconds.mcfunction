scoreboard players set @s tick 19
scoreboard players add @s second -1
scoreboard players add @s point -1
scoreboard players set @s[scores={point=..-1}] point 1
execute as @s[scores={second=..-1}] at @s[scores={minute=!..0}] run function call_function/modules/time/subtract_minutes