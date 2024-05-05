#测试如果tp到未加载区块再传回
#stp 0 10 10000000
#sexecute as @s at @s run say hi
#stp @s @p

#只要在同一个tick执行，即便实体被传送到未加载区块，其实可以被执行
summon creeper
tag @e[type=creeper,c=1,r=1] add test_
tp @e[tag=test_] 0 10 1000000
execute as @e[tag=test_] at @s run say hi
tp @e[tag=test_] @s
kill @e[tag=test_]