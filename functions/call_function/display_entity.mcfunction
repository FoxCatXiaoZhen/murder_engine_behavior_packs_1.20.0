execute as @e[type=function:lobby_respawn_point ] at @s run particle fx:lobby_respawn_point ~~~
execute as @e[type=function:player_respawn_point] at @s run particle fx:player_respawn_point ~~~
execute as @e[type=function:gold_ingot_generator] at @s run particle fx:gold_ingot_generator ~~~

titleraw @s[tag=!in_game_] actionbar {"rawtext":[{"text":"\n"},       {"text":" ： "},{"score":{"name":"@a[tag=main_player_]","objective":"num1"}},             {"text":"    "},             {"text":" ： "},{"score":{"name":"@a[tag=main_player_]","objective":"num2"}},        {"text":"    "},         {"text":" ： "},{"score":{"name":"@a[tag=main_player_]","objective":"num3"}}          ,{"text":"\n "}        ]}