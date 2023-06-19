



#QOL DEV TOOLS

#SPAWN WARP
scoreboard players enable @a[tag=!player] tpSpawn
scoreboard players enable @a[tag=!player] tpBeach
scoreboard players enable @a[tag=!player] tpBackrooms
scoreboard players enable @a[tag=!player] tpMudlands
execute as @a[scores={tpSpawn=1..}] run function edp:dev_tools/warps/spawn
execute as @a[scores={tpBeach=1..}] run function edp:dev_tools/warps/beach
execute as @a[scores={tpBackrooms=1..}] run function edp:dev_tools/warps/backrooms
execute as @a[scores={tpMudlands=1..}] run function edp:dev_tools/warps/mudlands