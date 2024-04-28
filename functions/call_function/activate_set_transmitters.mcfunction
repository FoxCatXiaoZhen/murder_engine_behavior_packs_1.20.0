#给与标签方便后续的编程，以及生成盔甲座来计算距离。

#在分数为1的指定实体的位置生成一个盔甲座，该盔甲座的标签为"out_offset_A"
execute as @e[type=function:transmitters,scores={entityID=1..1}] at @s run summon armor_stand ~~~ ~ ~ "" "out_offset_A"
#在分数为2的指定实体的位置生成一个盔甲座，该盔甲座的标签为"out_offset_B"
execute as @e[type=function:transmitters,scores={entityID=2..2}] at @s run summon armor_stand ~~~ ~ ~ "" "out_offset_B"



#在分数为1的指定实体给与"in_offset_A"标签
execute as @e[type=function:transmitters,scores={entityID=1..1}] run tag @s add in_offset_A
#在分数为2的指定实体给与"in_offset_B"标签
execute as @e[type=function:transmitters,scores={entityID=2..2}] run tag @s add in_offset_B


#在分数为1的指定实体给与"activate"标签，当出现该标签就会激活计算距离的任务。
execute as @e[type=function:transmitters,scores={entityID=1..1}] run tag @s add activate



#给与名字"out_offset_A"的盔甲座，编号计分板设置成0
execute as @e[type=armor_stand,name=out_offset_A] run scoreboard players set @s entityID 0
#给与名字"out_offset_B"的盔甲座，编号计分板设置成0
execute as @e[type=armor_stand,name=out_offset_B] run scoreboard players set @s entityID 0


#将所有的指定的实体编号设置为0，避免与其他的程序操作造成让被做匹配执行超出意外。规避可能的bug。
scoreboard players set @e[type=function:transmitters] entityID 0

