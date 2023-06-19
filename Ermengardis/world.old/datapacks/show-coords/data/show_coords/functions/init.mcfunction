
#make scoreboards
scoreboard objectives add showCoords dummy
scoreboard objectives add x dummy
scoreboard objectives add y dummy
scoreboard objectives add z dummy
scoreboard objectives add rotation dummy
scoreboard objectives add deathCoords deathCount
scoreboard objectives add coordsOn trigger
scoreboard objectives add coordsOff trigger
scoreboard objectives add sendCoords trigger
scoreboard objectives add help trigger
#tellraw @a [{"text":""},{"text":"Show Coords has been installed. ","color": "gold"},{"text":"Type "},{"text":"/trigger help ","color":"light_purple","clickEvent":{"action":"run_command","value":"/trigger help"}},{"text":"for info."}]
