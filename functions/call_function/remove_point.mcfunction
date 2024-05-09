execute unless entity @e[tag=game_activate] run execute as @e[c=1,family=function] at @s run tellraw @a[tag=main_player_] {"rawtext":[{"text":">> §c删除了§f§o : "}, {"selector":"@s"}        ]}
execute unless entity @e[tag=game_activate] run execute as @e[c=1,family=function,type=function:player_respawn_point] at @s run particle fx:player_respawn_point
execute unless entity @e[tag=game_activate] run execute as @e[c=1,family=function,type=function:lobby_respawn_point ] at @s run particle fx:lobby_respawn_point 
execute unless entity @e[tag=game_activate] run execute as @e[c=1,family=function,type=function:gold_ingot_generator] at @s run particle fx:gold_ingot_generator 
execute unless entity @e[tag=game_activate] run execute as @e[c=1,family=function] at @s run particle fx:x
execute unless entity @e[tag=game_activate] run execute as @e[c=1,family=function] at @s run kill @s
kill @s[type=function:remove_point]

execute if entity @e[tag=game_activate] run tellraw @a[tag=main_player_] {"rawtext":[{"text":">> §c§o无法在游戏开始时做更变！"}         ]}
execute if entity @e[tag=game_activate] run playsound error @a[tag=main_player_] ~~~ 0.5