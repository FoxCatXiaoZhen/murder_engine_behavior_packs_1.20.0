#测试如果tp到未加载区块再传回
#stp 0 10 10000000
#sexecute as @s at @s run say hi
#stp @s @p

#只要在同一个tick执行，即便实体被传送到未加载区块，其实可以被执行
#s summon creeper
#s tag @e[type=creeper,c=1,r=1] add test_
#s tp @e[tag=test_] 0 10 1000000
#s execute as @e[tag=test_] at @s run say hi
#s tp @e[tag=test_] @s
#s kill @e[tag=test_]

#s tellraw @a [{"text":"这是一个图片","color":"green"}]

playsound mob.blaze.shoot @s ~~~ 0.5 0.35
playsound dig.sand        @s ~~~ 1   0.3
playsound dig.sand        @s ~~~ 1   0.5
playsound random.fizz     @s ~~~ 0.5 0.3
playsound random.fizz     @s ~~~ 0.5 0.4
playsound random.fizz     @s ~~~ 1   0.5
playsound random.fizz     @s ~~~ 1   0.6
playsound random.fizz     @s ~~~ 1   0.7
playsound random.fizz     @s ~~~ 1   0.8
playsound random.fizz     @s ~~~ 1   0.9
playsound random.fizz     @s ~~~ 1   1.0

#s playsound step.amethyst_cluster @s  ~~~ 1 0.8
#s playsound step.amethyst_cluster @s  ~~~ 1 0.8
#s playsound step.amethyst_cluster @s  ~~~ 1 0.83
#s playsound step.amethyst_cluster @s  ~~~ 1 0.83