#针对正面跟踪 / 距离权重搜索
#execute as @s[tag=front_] at @s if entity @e[c=1,scores={version=1..2},z=~100,r=100] run tp ^^^ facing @e[c=-1,scores={version=1..2},z=~100,r=100] 
#execute as @s[tag=front_] at @s if entity @e[c=1,scores={version=1..2},z=~50,r=50] run tp ^^^ facing @e[c=-1,scores={version=1..2},z=~50,r=50] 
#execute as @s[tag=front_] at @s if entity @e[c=1,scores={version=1..2},z=~25,r=25] run tp ^^^ facing @e[c=-1,scores={version=1..2},z=~25,r=25] 
#execute as @s[tag=front_] at @s if entity @e[c=1,scores={version=1..2},z=~10,r=10] run tp ^^^ facing @e[c=-1,scores={version=1..2},z=~10,r=10] 
#针对左侧跟踪 / 距离权重搜索
#execute as @s[tag=left_] at @s if entity @e[c=1,scores={version=1..2},x=~100,r=100] run tp ^^^ facing @e[c=-1,scores={version=1..2},x=~100,r=100] 
#execute as @s[tag=left_] at @s if entity @e[c=1,scores={version=1..2},x=~50,r=50] run tp ^^^ facing @e[c=-1,scores={version=1..2},x=~50,r=50] 
#execute as @s[tag=left_] at @s if entity @e[c=1,scores={version=1..2},x=~25,r=25] run tp ^^^ facing @e[c=-1,scores={version=1..2},x=~25,r=25] 
#execute as @s[tag=left_] at @s if entity @e[c=1,scores={version=1..2},x=~10,r=10] run tp ^^^ facing @e[c=-1,scores={version=1..2},x=~10,r=10] 
#针对右侧跟踪 / 距离权重搜索
#execute as @s[tag=right_] at @s if entity @e[c=1,scores={version=1..2},x=~-100,r=100] run tp ^^^ facing @e[c=-1,scores={version=1..2},x=~-100,r=100]
#execute as @s[tag=right_] at @s if entity @e[c=1,scores={version=1..2},x=~-50,r=50] run tp ^^^ facing @e[c=-1,scores={version=1..2},x=~-50,r=50]
#execute as @s[tag=right_] at @s if entity @e[c=1,scores={version=1..2},x=~-25,r=25] run tp ^^^ facing @e[c=-1,scores={version=1..2},x=~-25,r=25]
#execute as @s[tag=right_] at @s if entity @e[c=1,scores={version=1..2},x=~-10,r=10] run tp ^^^ facing @e[c=-1,scores={version=1..2},x=~-10,r=10] 
#针对后方跟踪 / 距离权重搜索
#execute as @s[tag=rear_] at @s if entity @e[c=1,scores={version=1..2},z=~-100,r=100] run tp ^^^ facing @e[c=-1,scores={version=1..2},z=~-100,r=100]
#execute as @s[tag=rear_] at @s if entity @e[c=1,scores={version=1..2},z=~-50,r=50] run tp ^^^ facing @e[c=-1,scores={version=1..2},z=~-50,r=50]
#execute as @s[tag=rear_] at @s if entity @e[c=1,scores={version=1..2},z=~-25,r=25] run tp ^^^ facing @e[c=-1,scores={version=1..2},z=~-25,r=25]
#execute as @s[tag=rear_] at @s if entity @e[c=1,scores={version=1..2},z=~-10,r=10] run tp ^^^ facing @e[c=-1,scores={version=1..2},z=~-10,r=10]
