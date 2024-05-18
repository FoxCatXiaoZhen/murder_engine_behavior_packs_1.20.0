
title @a title 杀手方获胜！
tellraw @a { "rawtext": [{ "text": "§a>>§c杀手§e获胜\n§f-------------\n§d>>§b玩家身份列表§d<<" }] }
tellraw @a { "rawtext": [{ "text": "\n§f•§a平民§f:" },{ "selector": "@a[scores={version2=1}]" }] }
tellraw @a { "rawtext": [{ "text": "\n§f•§b侦探§f:" },{ "selector": "@a[scores={version2=2}]" }] }
tellraw @a { "rawtext": [{ "text": "\n§f•§c杀手§f[§a赢家§f]:" },{ "selector": "@a[scores={version2=3}]" }] }
tellraw @a { "rawtext": [{ "text": "\n§f-------------" }]}
execute as @a at @s run playsound random.orb @s 
function call_function/game_over