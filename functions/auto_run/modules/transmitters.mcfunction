
#当有第二个指定的实体被生出来时，第一个会被第二个给与1的分数，
#所有会变成2，应为第一个生成的时候就已经被给予1分数，
#之后后来的第二个就会给予他1和自己分数所以才第一有分数2，
#就造成第二个分数少，第一个分数被叠加，自动给指定的实体形成编号。

#创建记录编号的计分板的同时，给实体分数0，如果不这么做，就无法检测无“分数”的实体，这是minecraft的特性。所以这个操作就是让实体注册计分板。
scoreboard players add @e[type=function:transmitters] entityID 0

#当有指定实体被生成时，并且略过带有标签为“in_offset_A” ，并且略过带有标签为“in_offset_B”，略过这些标签的实体是避免计算到被激活匹配的传送器实体
execute as @e[type=function:transmitters,scores={entityID=!1..},tag=!"in_offset_A",tag=!"in_offset_B"] at @s run scoreboard players add @e[type=function:transmitters] entityID 1


#当满足了放置两个传送的点，就执行匹配的工作。
#检测是否有一个指定的实体的分数为1，如果有就执行后续的操作否则无动作。>检测是否有一个指定的实体的分数为2，如果有就执行后续的操作否则无动作。 >
execute if entity @e[type=function:transmitters,scores={entityID=1}] run execute if entity @e[type=function:transmitters,scores={entityID=2}] run function call_function/activate_set_transmitters


#检测指定实体是否有标签为"activate"指定实体，如果有就执行下一个的操作否则无动作。
execute if entity @e[type=function:transmitters,tag=activate] run kill @e[scores={entityID=-1..2}]
