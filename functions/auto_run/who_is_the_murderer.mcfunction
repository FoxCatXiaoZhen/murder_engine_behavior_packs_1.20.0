#侦测每一位加入游戏的玩家执行在自己，且脉冲执行一次
#################################################
scoreboard objectives add online dummy online
scoreboard players add @a online 0
################################

#如果第一位玩家加入时，就给予"main_player_"标签，且如果一个游戏世界有了"main_player_"的玩家就略过执行，后来加入的玩家将不会给与"main_player_"标签，这就仅限于房主用的标签。 
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
execute as @a[scores={version=1}] unless entity @s[hasitem={item=bow}] if score @s gold >= bow gold run give @s bow 1 10000 {"minecraft:item_lock":{"mode":"lock_in_inventory"}}
execute as @a[scores={version=1}] unless entity @s[hasitem={item=bow}] if score @s gold >= bow gold run scoreboard players operation @s gold -= bow gold

####################################################







#检测玩家死亡
#################################################
tag @e[type=player] add death
################################

#s execute as @a[tag=!death] at @s run say @s 被指令检测死亡
#s execute as @a[tag=!death] at @s run setblock ~~~ grass_block
execute as @a[tag=!death] at @s run scoreboard players set @s version 0
execute as @a[tag=!death] at @s run tag @s add died

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
execute as @e[type=function:remove_point] at @s run execute as @e[c=1,family=function] at @s run tellraw @a[tag=main_player_] {"rawtext":[{"text":">> §c删除了§f§o : "}, {"selector":"@s"}        ]}
execute as @e[type=function:remove_point] at @s run execute as @e[c=1,family=function,type=function:player_respawn_point] at @s run particle fx:player_respawn_point
execute as @e[type=function:remove_point] at @s run execute as @e[c=1,family=function,type=function:lobby_respawn_point ] at @s run particle fx:lobby_respawn_point 
execute as @e[type=function:remove_point] at @s run execute as @e[c=1,family=function,type=function:gold_ingot_generator] at @s run particle fx:gold_ingot_generator 
execute as @e[type=function:remove_point] at @s run execute as @e[c=1,family=function] at @s run particle fx:x
execute as @e[type=function:remove_point] at @s run execute as @e[c=1,family=function] at @s run kill @s
kill @e[type=function:remove_point]



#大厅数量限制器 / 避免bug
tag @e[type=function:lobby_respawn_point,c=1] add lobby_
execute as @e[type=function:lobby_respawn_point,tag=!lobby_] at @s run title @a[tag=main_player_] title §c仅限一个大厅
kill @e[tag=!lobby_,type=function:lobby_respawn_point]
tag @e[type=function:lobby_respawn_point] remove lobby_






#################################################

















#开始 / 游戏运行
#################################################

#时间耗尽 / 平民获胜
execute as @a[tag=in_game_,c=1] as @e[type=function:lobby_respawn_point,scores={tick=..0}] at @s run execute if entity @s[scores={second=..0}] run execute if entity @s[scores={minute=..0}] run function call_function/innocent_win

#检测到所有平民都无了 / 就执行杀手获胜
execute as @a[scores={version=1..2},tag=!died] at @s run scoreboard players add @e[type=function:lobby_respawn_point] num1 1
#s execute if entity @e[typew=function:lobby_respawn_point,scores={num1=1..}] run say is 1>
execute as @e[type=function:lobby_respawn_point,scores={num1=..0}] at @s[scores={num2=10..}] if entity @a[tag=game_activate,tag=main_player_] run function call_function/killer_win
scoreboard players add @e[type=function:lobby_respawn_point,scores={num2=0..10}] num2 1
scoreboard players set @e[type=function:lobby_respawn_point] num1 0

#扣除时间
scoreboard players add @e[type=function:lobby_respawn_point] tick 0
scoreboard players add @e[type=function:lobby_respawn_point] second 0
scoreboard players add @e[type=function:lobby_respawn_point] minute 0
execute as @e[type=function:lobby_respawn_point,tag=time_start] at @s run function call_function/modules/time/subtract_tick

#杀手没了就判定平民获胜
execute as @r[tag=in_game_] unless entity @a[scores={version=3},tag=!died]  run execute if entity @a[tag=game_activate,tag=main_player_] run function call_function/innocent_win


#显示时间&职业 
execute as @a[tag=in_game_,scores={version=..0}] at @s run titleraw @s actionbar {"rawtext": [{"text": "分："},{"score": {"name": "@e[type=function:lobby_respawn_point,tag=time_start]","objective": "minute"}},{"text": " 秒："},{"score": {"name": "@e[type=function:lobby_respawn_point,tag=time_start]","objective": "second"}},{"text": " 刻："},{"score": {"name": "@e[type=function:lobby_respawn_point,tag=time_start]","objective": "tick"}},{"text":"\n§e金锭数量§f:"},{"score":{"name":"@s","objective":"gold"}}]}
execute as @a[tag=in_game_,scores={version=1}] at @s run titleraw @s actionbar {"rawtext": [{"text": "分："},{"score": {"name": "@e[type=function:lobby_respawn_point,tag=time_start]","objective": "minute"}},{"text": " 秒："},{"score": {"name": "@e[type=function:lobby_respawn_point,tag=time_start]","objective": "second"}},{"text": " 刻："},{"score": {"name": "@e[type=function:lobby_respawn_point,tag=time_start]","objective": "tick"}},{"text":"\n§e金锭数量§f:"},{"score":{"name":"@s","objective":"gold"}},{"text":"|职业:§a平民"}]}
execute as @a[tag=in_game_,scores={version=2}] at @s run titleraw @s actionbar {"rawtext": [{"text": "分："},{"score": {"name": "@e[type=function:lobby_respawn_point,tag=time_start]","objective": "minute"}},{"text": " 秒："},{"score": {"name": "@e[type=function:lobby_respawn_point,tag=time_start]","objective": "second"}},{"text": " 刻："},{"score": {"name": "@e[type=function:lobby_respawn_point,tag=time_start]","objective": "tick"}},{"text":"\n§e金锭数量§f:"},{"score":{"name":"@s","objective":"gold"}},{"text":"|职业:§b侦探"}]}
execute as @a[tag=in_game_,scores={version=3}] at @s run titleraw @s actionbar {"rawtext": [{"text": "分："},{"score": {"name": "@e[type=function:lobby_respawn_point,tag=time_start]","objective": "minute"}},{"text": " 秒："},{"score": {"name": "@e[type=function:lobby_respawn_point,tag=time_start]","objective": "second"}},{"text": " 刻："},{"score": {"name": "@e[type=function:lobby_respawn_point,tag=time_start]","objective": "tick"}},{"text":"\n§e金锭数量§f:"},{"score":{"name":"@s","objective":"gold"}},{"text":"|职业:§c杀手"}]}


#生成金锭
scoreboard players add @e[type=function:gold_ingot_generator] tick 0
scoreboard players add @e[type=function:gold_ingot_generator,tag=run_] tick -1
execute as @e[type=function:gold_ingot_generator,scores={tick=0},tag=run_] at @s unless entity @e[r=1,type=item] run structure load gold_ ~~~
execute as @e[type=function:gold_ingot_generator,tag=run_,scores={tick=!0..}] at @s run scoreboard players random @s tick 500 1000




#################################################