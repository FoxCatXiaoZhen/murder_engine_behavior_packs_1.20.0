#关于传送器的，用于编号。
scoreboard objectives add entityID dummy entityID

#关于传送器的记录传送移动量x计分板的。
#关于传送器的记录传送移动量y计分板的。
#关于传送器的记录传送移动量z计分板的。
scoreboard objectives add teleport_x dummy teleport_x
scoreboard objectives add teleport_y dummy teleport_y
scoreboard objectives add teleport_z dummy teleport_z


#关于显示自定义实体的，计算实体数量用。
scoreboard objectives add num1 dummy num1
scoreboard objectives add num2 dummy num2
scoreboard objectives add num3 dummy num3

#关于计算时间，用来计算游戏时间。
scoreboard objectives add point dummy point
scoreboard objectives add tick dummy tick
scoreboard objectives add second dummy second
scoreboard objectives add minute dummy minute
#侦测游戏运行的时间
scoreboard objectives add tick2 dummy 
#设定时间
scoreboard objectives add time_setting dummy
scoreboard players add time time_setting 0
#关于职业
scoreboard objectives add version dummy version

#关于金锭
scoreboard objectives add gold dummy gold

#关于音效
scoreboard objectives add sounds_tick dummy sounds_tick