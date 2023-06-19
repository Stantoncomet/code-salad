priority: 0

console.info('Hello, World! (You will see this line every time server resources reload)')

ServerEvents.recipes(event => {
	// Change recipes here
})

ServerEvents.tags('item', event => {
	// Get the #forge:cobblestone tag collection and add Diamond Ore to it
	// event.get('forge:cobblestone').add('minecraft:diamond_ore')

	// Get the #forge:cobblestone tag collection and remove Mossy Cobblestone from it
	// event.get('forge:cobblestone').remove('minecraft:mossy_cobblestone')
})


ItemEvents.rightClicked('blaze_rod', e => {
	if (!e.player.offHandItem.getOrCreateTag().get('wandItem')) return;

	let wandItem = e.player.offHandItem.getOrCreateTag();
	let spellID = Number(wandItem.get('spellID'));
	let manaCost = Number(wandItem.get('manaCost'));

	let effects = e.player.potionEffects;

	switch (spellID) {
		case 0: break;
		case 1: { // Personal Effect
			let ed = wandItem.get('effectCloud'); //Effect Data
			effects.add('speed', 40, 0, false, true);
			break;
		}
		case 2: { // Local Cloud Effect
			let ecd = wandItem.get('effectCloud'); //Effect Cloud Data

			let effectCloud = e.player.block.createEntity('area_effect_cloud');
			effectCloud.mergeFullNBT({
				WaitTime: 0,
				Radius: ecd.radius,
				Duration: ecd.duration,
				Effects: [{Id: ecd.effect, Amplifier: ecd.effectAmp, Duration: ecd.effectDur}]
			});
			effectCloud.spawn();
			break;
		}
		case 3: { //Damage Spell
			//e.server.runCommandSilent(`execute in ${e.level.dimension} as ${e.player.name} at @s run say hi`);
			//clog(`${e.player.yaw.toFixed(2)} ${e.player.pitch}`)
			/*for (let i = 0; i < 100; i++) {
				e.server.runCommandSilent(`execute in ${e.level.dimension} run particle minecraft:happy_villager ${e.player.x} ${e.player.y+2} ${e.player.z} 0 0 0 0 1 normal`);
			}*/

			//clog(e.entity.rayTrace(10).type)
		}
	}
	//Utils.server.tell(wandItem.effectCloud.duration)
})


function clog(message)
	Utils.server.tell(message);