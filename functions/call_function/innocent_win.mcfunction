function call_function/game_over
title @a title 平民方获胜！
tellraw @a { "rawtext": [{ "text": "§a>>§a平民方§e获胜\n§f-------------\n§d>>§b玩家身份列表§d<<" }] }
tellraw @a { "rawtext": [{ "text": "\n§f•§a平民§f[§a赢家§f]:" },{ "selector": "@a[scores={version=1}]" }] }
tellraw @a { "rawtext": [{ "text": "\n§f•§b侦探§f[§a赢家§f]:" },{ "selector": "@a[scores={version=2}]" }] }
tellraw @a { "rawtext": [{ "text": "\n§f•§c杀手§f:" },{ "selector": "@a[scores={version=3}]" }] }
tellraw @a { "rawtext": [{ "text": "\n§f-------------" }]}
execute as @a at @s run playsound random.orb @s 