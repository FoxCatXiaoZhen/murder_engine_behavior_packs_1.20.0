#**描述**
👁️‍🗨️

该库行为包是让Minecraft基岩版 1.20.x 以上版本的玩家快速搭建谁是杀手地图插件，
如果编写指令太麻烦了，可以尝试用这项插件看看吧！
插件满足了游戏基本需要的功能。

插件是基于Minecraft指令来编写核心功能大量使用了mcfunction脚本，使用少量的js代码编写功能，
确保未来Minecraft基岩版更新中插件还能稳定在未来的版本中继续使用，即便api编写的代码失效，基本核心功能则可能不会失效。

关于材质依赖资源包的库：https://github.com/FoxCatXiaoZhen/murder_engine_resource_packs_1.20.0


具体有哪些亮点功能🌟

》默认会让正在游戏中的玩家，如果中途退出再次加入会清除身上的游戏数据（如指令标签，积分版）并且如果游戏处于激活中途加入游戏的玩家会切换为观察者模式。



》飞刀，解决了传统用指令的飞刀的不流畅和底层技术细节，比如一般网络教学上的指令飞刀只能平射，不能抬头射击。但这个附加包内建的飞刀已经解决这项难题。



》放置实体来布置传送点，平常需要记录坐标然后tp该位置，再该附加包中通通透过实体放置来布置场景，来解决该部分的枯燥设置。



》用物品呼叫ui，透过ui微调需要的设置，基本不需要太难的专业术语看懂ui的文字可以简单直观调整，飞刀冷却时间，平民需要收集多少金锭才可获得一次性弓等等...。


以上的4个亮点功能都不是基于api编写，所以api的代码失效基本核心功能则不受影响！



#**该怎么做**
🌟


1.在这个库页面右边，或是您是手机游览应该再页面顶端附近，Releases选项有点击。
![image](https://github.com/FoxCatXiaoZhen/murder_engine_behavior_packs_1.20.0/assets/117345940/3dc4e1a3-f051-4534-89bd-abc178cb37da)




2.点击下载副档名为.mcaddon。
![image](https://github.com/FoxCatXiaoZhen/murder_engine_behavior_packs_1.20.0/assets/117345940/596bbb12-03c8-4447-b626-345e21a5e78b)



3.下载左键双或以minecraft打开击运行附加包，minecraft基岩版会自动打开自动安装。

![image](https://github.com/FoxCatXiaoZhen/murder_engine_behavior_packs_1.20.0/assets/117345940/38b1ebd5-7823-422b-8bd0-98fc1d34d0cd)




4.将资源包和行为包同时它套用到同一张地图中。

![image](https://github.com/FoxCatXiaoZhen/murder_engine_behavior_packs_1.20.0/assets/117345940/7c3c53bf-fafa-482a-932c-8335096ec975)



5.进入世界，在聊天栏使用give指令获取物品以下物品：

```/give @s function:lobby_respawn_point_spawn_egg ```

```/give @s function:player_respawn_point_spawn_egg```

```/give @s function:gold_ingot_generator_spawn_egg```


6.将“大厅出生点”重生蛋放置在你的大厅的中央。（也可放置在任意位置）
》大厅的作用是让玩家游玩设施杀手游戏结束时，会被传送回来的一个实体，并且每次玩家加入或是初次加入游戏时，一定会被传送到该点上。
![image](https://github.com/FoxCatXiaoZhen/murder_engine_behavior_packs_1.20.0/assets/117345940/c81b57dc-570d-4594-bc7f-6c8ddf168e6f)





7.接着名为“玩家重生点”和“金锭生成器”随意布置在玩家可以经过的地方。如图展示。

》玩家重生点会再游戏被激活后，让所有在线的玩家随机传送玩家重生点上的位置。

》金锭生成器，顾名思义就是生成金锭，目前如果金锭生成后如果未被其他玩家捡起，则保持为一个金锭不会叠加物品。


![image](https://github.com/FoxCatXiaoZhen/murder_engine_behavior_packs_1.20.0/assets/117345940/c71b07f7-40f4-4823-8e41-d6d603f07f90)





8.如果你的位置放错了，可以使用这个“清除点”刷怪蛋。
```/give @s function:remove_point_spawn_egg ```
生成后它会自动识别最近的点将其清掉。
![image](https://github.com/FoxCatXiaoZhen/murder_engine_behavior_packs_1.20.0/assets/117345940/f60be8a9-f1ff-4849-b910-83e1a12fa7af)

另外可以使用该命令一键清除有关插件的有关实体，包括金锭生成器，大厅重生点，玩家重生点，飞刀和侦探的掉落物品。
```/kill @e[family=function] ```



9.需要注意的是，所有实体必须在区块加载内才能正常执行，需要在事先使用 "/tickingarea" 做区块加载你的地图。
确保这些插件实体在里面正常执行。


10.可以使用游戏内建的 "指南针" 物品长按或右键呼叫使用api编写的ui。
基本上可以直观的调整你需要的游戏状态，即便ui失效可手动执行指令```/function start ``` 启动游戏，或可以强制结束游戏的命令 ```/function stop```。
![image](https://github.com/FoxCatXiaoZhen/murder_engine_behavior_packs_1.20.0/assets/117345940/9cea4b54-8fb4-4199-8af3-896a90886352)




#**建议**
>> "玩家重生点" 和 "金锭生成器" 最好控制在1~35个左右，比如玩家重生点生成12个，金锭生成器为25到30，应为越多这些实体会对Minecraft的运算量增加，并不推荐放置这些功能实体放置太多。

>> 游玩人数推荐在7到10以上，如果等不到其他人加入，可以在大厅盖跑酷让玩家打发时间，避免等待无聊从而玩家退出。

>> 另外即使用上好用附加包插件，地图如果设计不恰当可能有反效果，地图复杂难道路错综复杂，设计地图时要考虑玩家的感觉。建议做法可以让玩家记住和上手易于记住路线，地图也不要太大，杀手找人也会很困难，平民一直躲在无敌点平民也会觉得无聊。推荐尝试盖地图时可以宽度50长度50的范围，游戏时间可以2到5分钟最佳。地图的障碍物不要太密集。要能够快速查看躲藏点。这样应该就有不错的效果让玩家不觉得不满意。

>> 对于模板化的谁是杀手你可以尝试加入你的个人特色进去，或是对附加包进行修改，制作你需要或是想要的游戏机制和游戏的样貌，或是引入其他附加包复合使用，应该不会有太严重的附加包冲突。



#**附加包的问题**

🥹由于我个人是编程是比较新手，以及加上更新维护部分可能略微缓慢。
所有决定将项目上传到github上分享，靠github社区来共同维护会比较好。
如果你有建议和bug可以在Issues哪里提交bug或友好提议。我会尝试解决。

有好的代码优化和新增可以到pull requests合并到我的库中。
感谢看到这里。:3



#**注意**

🙏要求转发需要标注出处，谢谢您的使用！
