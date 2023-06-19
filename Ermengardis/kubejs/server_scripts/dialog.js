priority: 1

ItemEvents.entityInteracted(e => {
	if (!e.target.tags.contains('citizen') || e.hand == 'off_hand') return;
	e.cancel();


	//e.server.runCommandSilent(`scoreboard players add @e[tag]`)
	let tTags = e.target.getTags();
	let tName;
	tTags.forEach(element => {
		if (!element.includes('Name', 0)) return;
		tName = element.split('-')[1];
	})
	//Dialog stage is manually set
	let dialogStage = e.server.runCommandSilent(`scoreboard players get @e[tag=Name-${tName},limit=1] dialogStage`);
	//Talk stage is updated every line
	let talkStage = e.server.runCommandSilent(`scoreboard players get @e[tag=Name-${tName},limit=1] talkStage`);

	//Fetch the current line

	let dialogVault = [e.server.runCommandSilent(`data get entity @e[tag=${tName},tag=${dialogStage},limit=1] Pos[0]`), e.server.runCommandSilent(`data get entity @e[tag=${tName},tag=${dialogStage},limit=1] Pos[1]`), e.server.runCommandSilent(`data get entity @e[tag=${tName},tag=${dialogStage},limit=1] Pos[2]`)];

	let lineTotal = e.level.getBlock(dialogVault).entityData.get('Items').length;

	let currentDialog = 'Hmm looks like something went wrong here';
	//try catch does something I think

	try {
		currentDialog = e.level.getBlock(dialogVault).entityData.get('Items')[talkStage].get('id').toString().split(':').join('"').split('"')[2];
		currentDialog = e.level.getBlock(dialogVault).entityData.get('Items')[talkStage].get('tag').get('display').get('Name').toString().split('"')[3];
	} catch (error) {
		
	}

	speak(tName, currentDialog, talkStage+1, lineTotal);
	

	//Update talk stage
	e.server.runCommandSilent(`scoreboard players add @e[tag=Name-${tName},limit=1] talkStage 1`);
	if (talkStage + 1 >= lineTotal)
		e.server.runCommandSilent(`scoreboard players set @e[tag=Name-${tName},limit=1] talkStage 0`);

})

ServerEvents.commandRegistry(e => {
	const {commands: Commands, arguments: Arguments} = e;
	e.register(
		Commands.literal('citizen')
		.then(Commands.argument('Type, villager, cat, etc.', Arguments.STRING.create(e))
			.then(Commands.argument('Name', Arguments.STRING.create(e))
				.executes(ctx => {
					const type = Arguments.STRING.getResult(ctx, 'Type, villager, cat, etc.');
					const name = Arguments.STRING.getResult(ctx, 'Name');

					let server = ctx.source.getServer()
					let position = ctx.source.getPosition()
					let dimension = ctx.source.getLevel().getDimension()
							
					server.runCommandSilent(`execute in ${dimension} run summon ${type} ${position.x()} ${position.y()} ${position.z()} {NoAI:1b,Tags:["citizen","Name-${name}"],CustomName:'{"text":"${name}"}',CustomNameVisible:1b}`)

					return 1
				})
			)
		)
	)
	e.register(
		Commands.literal('citizen_dialog')
		.then(Commands.argument('Name', Arguments.STRING.create(e))
			.executes(ctx => {
				const name = Arguments.STRING.getResult(ctx, 'Name');

				let server = ctx.source.getServer()
				let pos = ctx.source.getPosition()
				let dimension = ctx.source.getLevel().getDimension()

				if (name.contains('Destroy')) {
					let removee = name.split('-')[1];
					server.runCommandSilent(`execute as @e[tag=${removee}] at @s run setblock ~ ~ ~ air`);
					server.runCommandSilent(`kill @e[tag=${removee}]`);
					server.runCommandSilent(`kill @e[tag=Name-${removee}]`);
					server.tell(Component.darkRed(`Permanently removed citizen ${removee}`));
					return 1
				} 

				server.runCommandSilent(`execute in ${dimension} run setblock ${Math.floor(pos.x())} ${Math.floor(pos.y())} ${Math.floor(pos.z())} barrel{CustomName:'{"text":"${name}"}'}`);
				server.runCommandSilent(`execute in ${dimension} run summon minecraft:armor_stand ${Math.floor(pos.x())} ${Math.floor(pos.y())} ${Math.floor(pos.z())} {Tags:["${name}","0"],NoGravity:1b,Invisible:1b}`);

				return 1
			})
		)
	)
})

function clog(message)
	Utils.server.tell(message);

function speak(name, message, line, totalLines) {
	let dialog = Component.green('[').append(Component.yellow(name)).append('] ');
	dialog.append(Component.string(message).white());
	dialog.append(Component.darkGray(` (${line}/${totalLines})`));
	Utils.server.tell(dialog);
}
