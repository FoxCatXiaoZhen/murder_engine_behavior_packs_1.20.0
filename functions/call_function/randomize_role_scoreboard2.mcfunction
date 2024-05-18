scoreboard players set @a version 0
scoreboard players set @r[scores={version=..0}] version 3
scoreboard players set @r[scores={version=..0}] version 3
scoreboard players set @r[scores={version=..0}] version 2
scoreboard players set @r[scores={version=..0}] version 2
scoreboard players set @a[scores={version=..0}] version 1
execute as @a run scoreboard players operation @s version2 = @s version
tellraw @a[scores={version=2}] { "rawtext": [ { "text": ">>您的队友:" },{ "selector": "@a[scores={version=2}]" },{"text":"\n§e注意:§c误杀自己的队友将会让你自尽！"} ] }
tellraw @a[scores={version=3}] { "rawtext": [ { "text": ">>您的队友:" },{ "selector": "@a[scores={version=3}]" },{"text":"\n§e注意:§c误杀自己的队友将会让你自尽！"} ] }

execute as @a run scoreboard players operation @s version2 = @s version