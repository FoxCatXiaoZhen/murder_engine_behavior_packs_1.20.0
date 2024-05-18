#侦测每一位加入游戏的玩家执行在自己，且脉冲执行一次
#################################################
scoreboard objectives add online dummy online
scoreboard players add @a online 0
################################

#如果第一位玩家加入时，就给予"main_player_"标签，且如果一个游戏世界有了"main_player_"的玩家就略过执行，后来加入的玩家将不会给与"main_player_"标签，这就仅限于房主用的标签。 
execute as @a[scores={online=0}] at @s run function call_function/function_is_executed_once_when_the_player_joins 
execute as @a[scores={online=0}] at @s run tag @s remove main_player_
execute as @a[scores={online=0}] at @s unless entity @a[tag=main_player_] run function call_function/creating_scoreboard 
execute as @a[scores={online=0}] at @s unless entity @a[tag=main_player_] run tag @s add main_player_

################################
scoreboard players reset * online 
scoreboard players add @a online 1
#################################################




#侦测玩家是否获得足够的金锭
###################################################
#给玩家附魔无限,避免箭矢被玩家获得
execute as @a run enchant @a infinity 1 
#在玩家身上放置箭矢
replaceitem entity @a slot.inventory 0 arrow 1 0 {"minecraft:item_lock":{"mode":"lock_in_slot"}}
#侦测玩家身上的金锭,将金锭替换成gold的分数
execute as @a[hasitem={item=gold_ingot,quantity=1..}] at @s run scoreboard players add @s gold 1
execute as @a[hasitem={item=gold_ingot,quantity=1..}] at @s run clear @s gold_ingot 0 1
#给与物品后减少玩家分数
execute as @a[scores={version=1}] if score @s gold >= bow gold run give @s bow 1 10000 {"minecraft:item_lock":{"mode":"lock_in_inventory"}}
execute as @a[scores={version=1}] if score @s gold >= bow gold run scoreboard players operation @s gold -= bow gold



####################################################

#gamerule
################
gamerule showdeathmessages false
gamerule sendcommandfeedback false
gamerule showtags false
################



#检测玩家死亡
#################################################
tag @e[type=player] add death
################################

#s execute as @a[tag=!death] at @s run say @s 被指令检测死亡
#s execute as @a[tag=!death] at @s run setblock ~~~ grass_block
execute as @a[tag=!death] at @s run clear @s bow
execute as @a[tag=!death] at @s run clear @s minecraft:filled_map
execute as @a[tag=!death] at @s run clear @s minecraft:iron_sword
execute as @a[tag=!death] at @s run clear @s function:flying_blade
execute as @a[tag=!death] at @s run tag @s add died
execute as @a[tag=!death] at @s[scores={version=2}] run summon function:hat_item 
execute as @a[tag=!death,scores={version=1}] at @s run scoreboard players set @s version 0

################################
tag @a add death
tag @e[type=player] remove death
#################################################













#自定义物品 / 开发者辅助 
#################################################
#固定悬浮实体
execute as @e[type=function:gold_ingot_generator] at @s run tp ~~~
execute as @e[type=function:player_respawn_point] at @s run tp ~~~
execute as @e[type=function:lobby_respawn_point ] at @s run tp ~~~

#显示当前自定义实体的数量 / 计算实体数量存储在 main_player_ 标签的玩家上。
execute as @e[type=function:gold_ingot_generator] at @s run scoreboard players add @a[tag=main_player_] num1 1
execute as @e[type=function:player_respawn_point] at @s run scoreboard players add @a[tag=main_player_] num2 1
execute as @e[type=function:lobby_respawn_point ] at @s run scoreboard players add @a[tag=main_player_] num3 1

#显示 / 当拿着该物品，实体就会显示粒子效果提示该处有实体。
execute as @a[hasitem={item=function:lobby_respawn_point_spawn_egg, location=slot.weapon.mainhand}] at @s run execute as @e[tag=main_player_] at @s run function call_function/display_entity
execute as @a[hasitem={item=function:gold_ingot_generator_spawn_egg,location=slot.weapon.mainhand}] at @s run execute as @e[tag=main_player_] at @s run function call_function/display_entity
execute as @a[hasitem={item=function:player_respawn_point_spawn_egg,location=slot.weapon.mainhand}] at @s run execute as @e[tag=main_player_] at @s run function call_function/display_entity
execute as @a[hasitem={item=function:remove_point_spawn_egg,        location=slot.weapon.mainhand}] at @s run execute as @e[tag=main_player_] at @s run function call_function/display_entity



#清除多出的数值
scoreboard players set @a[tag=main_player_] num1 0
scoreboard players set @a[tag=main_player_] num2 0
scoreboard players set @a[tag=main_player_] num3 0


#清除点 / 当生成就删除最近的自定义实体 / 发送信息和粒子效果
execute as @e[type=function:remove_point] at @s run function call_function/remove_point



#大厅数量限制器 / 避免bug
execute as @e[type=function:lobby_respawn_point] at @s unless entity @e[type=function:lobby_respawn_point,tag=lobby_] run tag @s add lobby_
execute as @e[type=function:lobby_respawn_point,tag=!lobby_] at @s run tellraw @a[tag=main_player_] {"rawtext":[{"text":">> §c§o仅限放置一个"}, {"selector":"@e[type=function:lobby_respawn_point,tag=lobby_]"}         ]}
execute as @e[type=function:lobby_respawn_point,tag=!lobby_] at @s run playsound error @a[tag=main_player_] ~~~ 0.5
kill @e[tag=!lobby_,type=function:lobby_respawn_point]

#################################################





#探测器音效
#################################################
execute as @e[scores={version=3},hasitem={item=function:detector,location=slot.weapon.mainhand}] at @s run function call_function/detector_sound
#################################################















#开始 / 游戏运行
#################################################
#扣除时间
scoreboard players add @e[type=function:lobby_respawn_point] tick 0
scoreboard players add @e[type=function:lobby_respawn_point] second 0
scoreboard players add @e[type=function:lobby_respawn_point] minute 0
execute as @e[type=function:lobby_respawn_point,tag=time_start] at @s run function call_function/modules/time/subtract_tick

#显示时间 / 金锭数量 / 职业 / 探测器显示
execute as @a[tag=in_game_] at @s run titleraw @s actionbar {"rawtext":[{"translate":"%%2","type":"control","with":{"rawtext":[{"selector":"@s[scores={version=3},hasitem={item=function:detector,location=slot.weapon.mainhand}]"},{"rawtext":[{"translate":"%%2","type":"control","with":{"rawtext":[{"selector":"@e[scores={version=1..2}]"},{"rawtext":[{"text":"                 "}]},{"rawtext":[{"text":""}]}]}}]},{"rawtext":[{"text":""}]}]}},{"translate":"%%2","type":"control","with":{"rawtext":[{"selector":"@e[type=function:lobby_respawn_point,scores={point=0}]"},{"rawtext":[{"translate":"%%2","type":"control","with":{"rawtext":[{"selector":"@e[type=function:lobby_respawn_point,scores={minute=..0}]"},{"rawtext":[{"text":"§c"}]},{"rawtext":[{"text":""}]}]}}]},{"rawtext":[{"text":""}]}]}},{"translate":"%%2","type":"control","with":{"rawtext":[{"selector":"@e[type=function:lobby_respawn_point,scores={minute=1..}]"},{"rawtext":[{"translate":"%%2","type":"control","with":{"rawtext":[{"selector":"@e[type=function:lobby_respawn_point,scores={minute=1..}]"},{"rawtext":[{"translate":"%%2","type":"control","with":{"rawtext":[{"selector":"@e[type=function:lobby_respawn_point,scores={minute=0..9}]"},{"rawtext":[{"text":"0"}]},{"rawtext":[{"text":""}]}]}}]},{"rawtext":[{"text":""}]}]}},{"score":{"name":"@e[type=function:lobby_respawn_point,tag=time_start]","objective":"minute"}},{"text":":"}]},{"rawtext":[{"text":""}]}]}},{"translate":"%%2","type":"control","with":{"rawtext":[{"selector":"@e[type=function:lobby_respawn_point,scores={second=0..9}]"},{"rawtext":[{"text":"0"}]},{"rawtext":[{"text":""}]}]}},{"score":{"name":"@e[type=function:lobby_respawn_point,tag=time_start]","objective":"second"}},{"translate":"%%2","type":"control","with":{"rawtext":[{"selector":"@e[type=function:lobby_respawn_point,scores={minute=..0}]"},{"rawtext":[{"text":":"},{"translate":"%%2","type":"control","with":{"rawtext":[{"selector":"@e[type=function:lobby_respawn_point,scores={tick=0..9}]"},{"rawtext":[{"text":"0"}]},{"rawtext":[{"text":""}]}]}},{"score":{"name":"@e[type=function:lobby_respawn_point,tag=time_start]","objective":"tick"}}]},{"rawtext":[{"text":""}]}]}},{"text":"  §f:"},{"score":{"name":"@s","objective":"gold"}},{"translate":"%%2","type":"control","with":{"rawtext":[{"selector":"@s[scores={version=1}]"},{"rawtext":[{"text":"  §a平民"}]},{"rawtext":[{"text":""}]}]}},{"translate":"%%2","type":"control","with":{"rawtext":[{"selector":"@s[scores={version=2}]"},{"rawtext":[{"text":"  §b侦探"}]},{"rawtext":[{"text":""}]}]}},{"translate":"%%2","type":"control","with":{"rawtext":[{"selector":"@s[scores={version=3}]"},{"rawtext":[{"text":"  §c杀手"}]},{"rawtext":[{"text":""}]}]}},{"translate":"%%2","type":"control","with":{"rawtext":[{"selector":"@s[scores={version=3},hasitem={item=function:detector,location=slot.weapon.mainhand}]"},{"rawtext":[{"text":"\n"},{"type":"switch","rawtext":[{"translate":"%%2","with":{"rawtext":[{"selector":"@e[scores={version=1..2},rm=60]"},{"rawtext":[{"text":"§f████████████ §7过远§f ████████████"}]},{"translate":"%%2","with":{"rawtext":[{"selector":"@e[scores={version=1..2},rm=50,r=60]"},{"rawtext":[{"text":"§a█§f███████████ §a太远§f ███████████§a█"}]},{"translate":"%%2","with":{"rawtext":[{"selector":"@e[scores={version=1..2},rm=40,r=50]"},{"rawtext":[{"text":"§a██§f██████████ §a很远§f ██████████§a██"}]},{"translate":"%%2","with":{"rawtext":[{"selector":"@e[scores={version=1..2},rm=35,r=40]"},{"rawtext":[{"text":"§a███§f█████████ §a很远§f █████████§a███"}]},{"translate":"%%2","with":{"rawtext":[{"selector":"@e[scores={version=1..2},rm=30,r=35]"},{"rawtext":[{"text":"§e████§f████████ §e蛮远§f ████████§e████"}]},{"translate":"%%2","with":{"rawtext":[{"selector":"@e[scores={version=1..2},rm=25,r=30]"},{"rawtext":[{"text":"§e█████§f███████ §e蛮远§f ███████§e█████"}]},{"translate":"%%2","with":{"rawtext":[{"selector":"@e[scores={version=1..2},rm=20,r=25]"},{"rawtext":[{"text":"§e██████§f██████ §e蛮远§f ██████§e██████"}]},{"translate":"%%2","with":{"rawtext":[{"selector":"@e[scores={version=1..2},rm=15,r=20]"},{"rawtext":[{"text":"§e████████§f████ §e蛮近§f ████§e████████"}]},{"translate":"%%2","with":{"rawtext":[{"selector":"@e[scores={version=1..2},rm=10,r=15]"},{"rawtext":[{"text":"§c█████████§f███ §c蛮近§f ███§c█████████"}]},{"translate":"%%2","with":{"rawtext":[{"selector":"@e[scores={version=1..2},rm=5,r=10]"},{"rawtext":[{"text":"█████████§c█§f██ §c很近§f ██§c██████████"}]},{"translate":"%%2","with":{"rawtext":[{"selector":"@e[scores={version=1..2},rm=2.5,r=5]"},{"rawtext":[{"text":"██████████§c█§f█ §c太近§f █§c███████████"}]},{"translate":"%%2","with":{"rawtext":[{"selector":"@e[scores={version=1..2},r=2.5]"},{"rawtext":[{"text":"████████████§c§f §c过近§f §c████████████"}]}]}}]}}]}}]}}]}}]}}]}}]}}]}}]}}]}}]}}]}]},{"rawtext":[{"text":""}]}]}}]}


#时间耗尽 / 平民获胜
execute as @a[tag=in_game_,c=1] as @e[type=function:lobby_respawn_point,scores={tick=..0}] at @s run execute if entity @s[scores={second=..0}] run execute if entity @s[scores={minute=..0}] run function call_function/innocent_win

#检测到所有平民都无了 / 就执行杀手获胜
execute as @a[scores={version=1..2},tag=!died] at @s run scoreboard players add @e[type=function:lobby_respawn_point] num1 1
execute unless entity @e[tag=de_bug_] run execute as @e[type=function:lobby_respawn_point,scores={num1=..0}] at @s[scores={num2=10..}] if entity @e[tag=game_activate] run function call_function/killer_win
scoreboard players add @e[type=function:lobby_respawn_point,scores={num2=0..10}] num2 1
scoreboard players set @e[type=function:lobby_respawn_point] num1 0

#杀手没了就判定平民获胜
execute unless entity @e[tag=de_bug_] run execute as @r[tag=in_game_] unless entity @a[scores={version=3},tag=!died]  run execute if entity @e[tag=game_activate] run function call_function/innocent_win

#开启游戏运行时间计时器
scoreboard players add @e[type=function:lobby_respawn_point,tag=time_start] tick2 1
#发放武器
execute as @e[tag=time_start,type=function:lobby_respawn_point,scores={tick2=100}] run tellraw @a {"rawtext":[{"text":"§d>>§c杀手§e与§b侦探§f将在5秒后§a获得§n武器"}]}
execute as @e[tag=time_start,type=function:lobby_respawn_point,scores={tick2=120}] run tellraw @a {"rawtext":[{"text":"§d>>§c杀手§e与§b侦探§f将在4秒后§a获得§n武器"}]}
execute as @e[tag=time_start,type=function:lobby_respawn_point,scores={tick2=140}] run tellraw @a {"rawtext":[{"text":"§d>>§c杀手§e与§b侦探§f将在3秒后§a获得§n武器"}]}
execute as @e[tag=time_start,type=function:lobby_respawn_point,scores={tick2=160}] run tellraw @a {"rawtext":[{"text":"§d>>§c杀手§e与§b侦探§f将在2秒后§a获得§n武器"}]}
execute as @e[tag=time_start,type=function:lobby_respawn_point,scores={tick2=180}] run tellraw @a {"rawtext":[{"text":"§d>>§c杀手§e与§b侦探§f将在1秒后§a获得§n武器"}]}
execute as @e[tag=time_start,type=function:lobby_respawn_point,scores={tick2=200}] run tellraw @a {"rawtext":[{"text":"§d>>§c杀手§e与§b侦探§f已获得§n武器"}]}
execute as @e[tag=time_start,type=function:lobby_respawn_point,scores={tick2=200}] run execute as @a at @s run playsound mob.enderdragon.breathe
execute as @e[tag=time_start,type=function:lobby_respawn_point,scores={tick2=200}] run execute as @a at @s unless entity @s[hasitem={item=bow}]                    run give @s[scores={version=2}] minecraft:bow 1 0 {"item_lock": { "mode": "lock_in_inventory" }}
execute as @e[tag=time_start,type=function:lobby_respawn_point,scores={tick2=200}] run execute as @a at @s unless entity @s[hasitem={item=iron_sword}]             run give @s[scores={version=3}] minecraft:iron_sword 1 0 {"item_lock": { "mode": "lock_in_inventory" }}
execute as @e[tag=time_start,type=function:lobby_respawn_point,scores={tick2=200}] run execute as @a at @s unless entity @s[hasitem={item=function:flying_blade}]  run give @s[scores={version=3}] function:flying_blade 1 0 {"item_lock": { "mode": "lock_in_inventory" }}
execute as @e[tag=time_start,type=function:lobby_respawn_point,scores={tick=19,second=59,minute=0}] run give @a[scores={version=3}] function:detector
#接近1分钟就发放探测仪
execute as @e[tag=time_start,type=function:lobby_respawn_point,scores={minute=1,second=30}] run execute as @a[tag=in_game_] unless entity @s[hasitem={item=minecraft:filled_map}] run give @s minecraft:filled_map 1 2 {"item_lock": { "mode": "lock_in_inventory" }}

#生成金锭
scoreboard players add @e[type=function:gold_ingot_generator] tick 0
scoreboard players add @e[type=function:gold_ingot_generator,tag=run_] tick -1
execute as @e[type=function:gold_ingot_generator,scores={tick=0},tag=run_] at @s unless entity @e[r=1,type=item] run structure load gold_ ~~~
execute as @e[type=function:gold_ingot_generator,tag=run_,scores={tick=!0..}] at @s run scoreboard players random @s tick 300 500




#################################################