import { Entity, EntityComponentTypes, system, world } from '@minecraft/server'
import {ModalFormData,ActionFormData} from '@minecraft/server-ui'



var setting = world.scoreboard.getObjective("setting")

world.afterEvents.worldInitialize.subscribe(() => {
    
})
//侦测伤害
world.afterEvents.entityHurt.subscribe(e => {
    
    let damage = Math.ceil(e.damage)//伤害值
    let hurt = e.hurtEntity//受害者
    let hurting = e.hurtEntity.nameTag//受害者id
    let damaging = e.damageSource.damagingEntity.nameTag//.replace(/(?<=.*)\n.*/, "")//伤害者
    //system.run(() => hurt.runCommandAsync('say '+hurting));
   if (e.damageSource.cause == 'projectile') {
        hurt.runCommandAsync('damage @s 100 entity_attack entity '+damaging),
        hurt.runCommandAsync('execute as @a[name='+hurting+',scores={version=1..2}] at @s run kill @a[name='+damaging+',scores={version=2}]')

    
     

    

}})

const showName = world.afterEvents.entityHealthChanged.subscribe(e => {
    if (e.newValue < 0) return
    var name = e.entity.nameTag.replace(/(?<=.*)\n.*/, "")
    var full = e.entity.getComponent("minecraft:health").effectiveMax
    var value = e.newValue   
}, { entityTypes: ["minecraft:player"] })


world.afterEvents.entityDie.subscribe(e => {
    let die = e.deadEntity//死者
    let damaging = e.damageSource.damagingEntity.nameTag//replace(/(?<=.*)\n.*/, "")//击杀者
    die.runCommandAsync('execute as ' + damaging + ' at @s run playsound game.player.die @a ~~~ 100 1')
    //die.runCommandAsync('execute as @s[type=player] run tellraw @a {"rawtext":[{"text":"§d>>§l§b"},{"selector":"@s"},{"text":"§f被§a ' + damaging + '§f击杀了!"}]}')
    die.runCommandAsync('execute as @s[type=player] run tellraw ' + damaging + ' {"rawtext":[{"text":"§a>>§c杀死一位玩家|§6积分§b+50"}]}')
    die.runCommandAsync('scoreboard players add ' + damaging + ' scores 50 ')
    die.runCommandAsync('clear @s bow 0 1')
    die.runCommandAsync('clear @s iron_sword 0 1')
    die.runCommandAsync('clear @s filled_map')
    die.runCommandAsync('tellraw @a {"rawtext":[{"text":">>§l§c一名玩家已死亡"}]}')


})

world.beforeEvents.itemUse.subscribe(e=>{
    const player = e.source;

    if (e.itemStack.typeId=='minecraft:compass'&&player.isOp()) system.run(() => game(player))
    else if (e.itemStack.typeId=='minecraft:iron_sword') system.run(() => player.runCommandAsync('function call_function/flying_blade/summon_blade'))


})


world.beforeEvents.chatSend.subscribe((eventData) => {
    const player = eventData.sender;
    if (player.isOp() && eventData.message.startsWith('!setting')) {
        system.run(() => system.runTimeout(() => (setting1(player)), 20)),
            eventData.cancel = true, player.runCommandAsync('execute as @s run playsound note.flute @s'), player.runCommandAsync('tellraw @s {"rawtext":[{"selector":"@s"},{"text":"§e请立刻关闭聊天室"}]}');
    }//设置！setting
    else if (player.isOp() && eventData.message.startsWith('!info')) {
        system.run(() => system.runTimeout(() => (info(player)), 20)),
            eventData.cancel = true, player.runCommandAsync('execute as @s run playsound note.flute @s'), player.runCommandAsync('tellraw @s {"rawtext":[{"selector":"@s"},{"text":"§e请立刻关闭聊天室"}]}');
    }//资讯!info
    else if (player.isOp() && eventData.message.startsWith('!help')) {
        system.run(() => system.runTimeout(() => (help(player)), 20)),
            eventData.cancel = true, player.runCommandAsync('execute as @s run playsound note.flute @s'), player.runCommandAsync('tellraw @s {"rawtext":[{"selector":"@s"},{"text":"§e请立刻关闭聊天室"}]}');
    }//帮助!help
        else if (player.isOp() && eventData.message.startsWith('!portal')) {
        system.run(() => system.runTimeout(() => (portal(player)), 20)),
            eventData.cancel = true, player.runCommandAsync('execute as @s run playsound note.flute @s'), player.runCommandAsync('tellraw @s {"rawtext":[{"selector":"@s"},{"text":"§e请立刻关闭聊天室"}]}');
    }//后台设置!portal
    else if (player.isOp() && eventData.message.startsWith('!game')) {
        system.run(() => system.runTimeout(() => (game(player)), 20)),
            eventData.cancel = true, player.runCommandAsync('execute as @s run playsound note.flute @s'), player.runCommandAsync('tellraw @s {"rawtext":[{"selector":"@s"},{"text":"§e请立刻关闭聊天室"}]}');
    }//游戏设置!game
    
    

;})

    world.afterEvents.playerSpawn.subscribe((e) => {
        if (e.initialSpawn && e.player.isOp()) {
            e.player.sendMessage("§l§f----------\n§e 谁是§c杀手§a游戏引擎 \n§f----------\n§d§l-§f查看使用方法请在聊天室输入!help\n§b最后祝你使用愉快§f!")
        }
    })

    function help(player){//帮助
        const playerName = player.name;
        const ui = new ActionFormData();
        ui.title('§l§a帮助');
        ui.body({    "rawtext": [        {            "text": "================\n\n欢迎使用谁是杀手游戏引擎！\n引擎提供无需编写游戏机制，\n透过放置"        },        {            "rawtext": [                                {                    "translate": "entity.function:player_respawn_point.name"                }]},                {                    "text": " , 透过启动游戏，将玩家传送您自制的地图中。\n"                },                {                    "rawtext": [                {                    "translate": "entity.function:lobby_respawn_point.name"                }]},                {                    "text": " , 放置该实每天当游戏结束时，就会传送该处。\n"                },                {                    "rawtext": [                {                    "translate": "entity.function:gold_ingot_generator.name"                }]},                {                    "text": " , 可布置在你的地图中。游戏中收集生成出来的金锭，可获得反杀杀手武器\n\n================"                }            ]        })
        ui.button('了解！')

        ui.show(player).then(({ selection, canceled }) => {
            if (canceled) return;
        if (selection === 0) {player.runCommandAsync('fun')}
    })}
    //function setting1(player) {//玩家资料
    //    const playerName = player.name;
    //    const ui = new ModalFormData();
    //    ui.title('§l§b玩家§a资料');
    //    ui.toggle("§l隐藏名称", Boolean(setting.getScore("showName")))
    //    ui.show(player).then((v) => {
     //       if (v.canceled) return
      //      var values = v.formValues
       //     if (values[0]) world.afterEvents.entityHealthChanged.subscribe(showName)
        //    else {
         //       world.afterEvents.entityHealthChanged.unsubscribe(showName)
           //     world.getAllPlayers().forEach(p => p.nameTag = p.name)}

      //  })
    //};
    function game(player) {//游戏设置
        const playerName = player.name;
        const ui = new ActionFormData();
        ui.title('§l§b游戏设置');
        ui.body('选择你要选的吧w')
        ui.button('开始游戏','textures/blocks/bell_side')
        ui.button('强制结束',"textures/items/ruby")
        ui.button('游戏时间设置',"textures/items/clock_item")
        ui.button('设置弓箭价格',"textures/items/bow_pulling_1")
        ui.button('设置抛刀冷却',"textures/items/iron_sword")

        ui.show(player).then(({ selection, canceled }) => {
            if (canceled) return;
        if (selection === 0) {start(player)}//开始游戏
        else if (selection === 1) {player.playSound('note.bass'),player.runCommandAsync('function stop')}//强制结束
        else if (selection === 2) {time_setting(player),player.playSound('note.pling')}//设置游戏时间
        else if (selection === 3) {bow_price_setting(player),player.playSound('note.pling')}//弓箭价格
        else if (selection === 4) {knive_cd_setting(player),player.playSound('note.pling')}//抛刀冷却

        })
        function start(player) {//游戏开始选择
            const playerName = player.name;
            const ui = new ActionFormData();
            ui.title('§l§b游戏开始');
            ui.body('选择一个游戏种类开始吧w')
            ui.button('经典模式')
            ui.button('双杀手模式|测试版[飞刀不可同时使用]')
            ui.button('返回',"textures/ui/settings_glyph_color_2x")
    
            ui.show(player).then(({ selection, canceled }) => {
                if (canceled) return;
            if (selection === 0) {player.runCommandAsync('function start')}//开始游戏
            else if (selection === 1) {player.runCommandAsync('function start2')}//选择人数
            else if (selection === 2) {player.playSound('note.bass'),game(player)}//强制结束
    
            })}
        



    };
    function knive_cd_setting(player){//游戏时间设置
        const playerName = player.name;
        const ui = new ModalFormData();
        ui.title('抛刀冷却设置')
        ui.slider('冷却时间',5,120,10)


        ui.show(player).then(data => {
            let { formValues, canceled } = data;
            if (canceled) return;
            let cd = formValues[0]
            let cd2 = cd*20
            player.playSound('random.orb')
            player.runCommandAsync('scoreboard players set knive_cd time_setting '+cd2)
            player.runCommandAsync('tellraw @a {"rawtext":[{"text":"§d>>§c飞刀§b冷却§f已设置为§d'+cd+'!"}]}')
    })


    }
    function bow_price_setting(player){//游戏时间设置
        const playerName = player.name;
        const ui = new ModalFormData();
        ui.title('弓箭价格设置')
        ui.slider('价格设置',1,30,10)


        ui.show(player).then(data => {
            let { formValues, canceled } = data;
            if (canceled) return;
            let price = formValues[0]
            player.playSound('random.orb')
            player.runCommandAsync('scoreboard players set bow gold '+price)
            player.runCommandAsync('tellraw @a {"rawtext":[{"text":"§d>>§e弓箭§a价格§f已设置为§b'+price+'!"}]}')
    })


    }
    function time_setting(player){//游戏时间设置
        const playerName = player.name;
        const ui = new ModalFormData();
        ui.title('时间设置')
        ui.dropdown('时间设置',['2分钟', '3分钟', '5分钟','10分钟','15分钟'])


        ui.show(player).then(data => {
            let { formValues, canceled } = data;
            if (canceled) return;
            let time = formValues[0]
            if (time===0){player.sendMessage('已将时间设置为2分钟'),player.runCommandAsync('function call_function/time/set_time_02m_00s'),player.runCommandAsync('scoreboard players set time time_setting 0')}
            else if (time===1){player.sendMessage('已将时间设置为3分钟'),player.runCommandAsync('function call_function/time/set_time_03m_00s'),player.runCommandAsync('scoreboard players set time time_setting 1')}
            else if (time===2){player.sendMessage('已将时间设置为5分钟'),player.runCommandAsync('function call_function/time/set_time_05m_00s'),player.runCommandAsync('scoreboard players set time time_setting 2')}
            else if (time===3){player.sendMessage('已将时间设置为10分钟'),player.runCommandAsync('function call_function/time/set_time_10m_00s'),player.runCommandAsync('scoreboard players set time time_setting 3')}
            else if (time===4){player.sendMessage('已将时间设置为15分钟'),player.runCommandAsync('function call_function/time/set_time_15m_00s'),player.runCommandAsync('scoreboard players set time time_setting 4')}
    })


    }

    function portal(player) {//后台设置
        const playerName = player.name;
        const ui = new ActionFormData();
        ui.title('§l§b后台设置');
        ui.body('以最开的方式打开其他的设置,资料等等的东西')
        ui.button('疑问解答','textures/items/book_writable')
        ui.button('游戏设置',"textures/ui/settings_glyph_color_2x")

        ui.show(player).then(({ selection, canceled }) => {
            if (canceled) return;
        if (selection === 0) {info(player),player.playSound('random.orb')}//疑问解答
        else if (selection === 1) {game(player),player.playSound('random.orb')}//游戏设置
        })
        



    };
    
    function info(player) {//疑问解答
        const playerName = player.name;
        const ui = new ActionFormData();
        ui.title('§l§b疑问解答');
        ui.body('-----指令列表-----\n§l§a!§einfo\n用于查看资讯\n§l§a!§esetting\n用于设置隐藏名称等等的,不常用!\n§l§a!§egame\n用于设置游戏人数开始等等\n§l§a!§eportal\n用于打开大部分的设置')
        ui.button('明白了')

        ui.show(player).then(({ selection, canceled }) => {
            if (canceled) return;
        if (selection === 1) {player.sendMessage('')}
        })
    }