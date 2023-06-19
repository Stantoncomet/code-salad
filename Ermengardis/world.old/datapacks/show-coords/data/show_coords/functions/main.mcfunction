
#function coordinates
execute unless score gamerule showCoords matches 1 run function show_coords:coords

#function personal coords
scoreboard players enable @a coordsOff
scoreboard players enable @a coordsOn
scoreboard players enable @a sendCoords
scoreboard players enable @a help
execute as @a[scores={coordsOff=1..}] run function show_coords:personal_coords_disable
execute as @a[scores={coordsOn=1..}] run function show_coords:personal_coords_enable
execute as @a[scores={sendCoords=1..}] unless score gamerule showCoords matches 1 run function show_coords:personal_coords_send
execute as @a[scores={help=1..}] run function show_coords:help

#function deathCoords
execute as @a[scores={deathCoords=1..},tag=!personalNoCoords] unless score gamerule showCoords matches 1 run function show_coords:death_coords
