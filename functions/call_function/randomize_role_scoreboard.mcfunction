scoreboard players set @a version 0
scoreboard players set @r[scores={version=..0}] version 3
scoreboard players set @r[scores={version=..0}] version 2
scoreboard players set @a[scores={version=..0}] version 1
execute as @a run scoreboard players operation @s version2 = @s version

execute as @a run scoreboard players operation @s version2 = @s version