
#get data
execute as @a store result score @s x run data get entity @s Pos[0]
execute as @a store result score @s y run data get entity @s Pos[1]
execute as @a store result score @s z run data get entity @s Pos[2]
execute as @a store result score @s rotation run data get entity @s Rotation[0]

#show coords
execute as @a[tag=!personalNoCoords] if score @s rotation matches -180..-158 run title @s actionbar [{"text":"XYZ:","color":"gold"},{"text":" (=)","color":"light_purple"},{"color":"white","score":{"name":"@s","objective":"x"}},{"text":" "},{"color":"white","score":{"name":"@s","objective":"y"}},{"text":" (-)","color":"light_purple"},{"color":"white","score":{"name":"@s","objective":"z"}},{"text":" | N"}]
execute as @a[tag=!personalNoCoords] if score @s rotation matches -157..-113 run title @s actionbar [{"text":"XYZ:","color":"gold"},{"text":" (+)","color":"light_purple"},{"color":"white","score":{"name":"@s","objective":"x"}},{"text":" "},{"color":"white","score":{"name":"@s","objective":"y"}},{"text":" (-)","color":"light_purple"},{"color":"white","score":{"name":"@s","objective":"z"}},{"text":" | NE"}]
execute as @a[tag=!personalNoCoords] if score @s rotation matches -112..-68 run title @s actionbar [{"text":"XYZ:","color":"gold"},{"text":" (+)","color":"light_purple"},{"color":"white","score":{"name":"@s","objective":"x"}},{"text":" "},{"color":"white","score":{"name":"@s","objective":"y"}},{"text":" (=)","color":"light_purple"},{"color":"white","score":{"name":"@s","objective":"z"}},{"text":" | E"}]
execute as @a[tag=!personalNoCoords] if score @s rotation matches -67..-21 run title @s actionbar [{"text":"XYZ:","color":"gold"},{"text":" (+)","color":"light_purple"},{"color":"white","score":{"name":"@s","objective":"x"}},{"text":" "},{"color":"white","score":{"name":"@s","objective":"y"}},{"text":" (+)","color":"light_purple"},{"color":"white","score":{"name":"@s","objective":"z"}},{"text":" | SE"}]
execute as @a[tag=!personalNoCoords] if score @s rotation matches -22..22 run title @s actionbar [{"text":"XYZ:","color":"gold"},{"text":" (=)","color":"light_purple"},{"color":"white","score":{"name":"@s","objective":"x"}},{"text":" "},{"color":"white","score":{"name":"@s","objective":"y"}},{"text":" (+)","color":"light_purple"},{"color":"white","score":{"name":"@s","objective":"z"}},{"text":" | S"}]
execute as @a[tag=!personalNoCoords] if score @s rotation matches 23..67 run title @s actionbar [{"text":"XYZ:","color":"gold"},{"text":" (-)","color":"light_purple"},{"color":"white","score":{"name":"@s","objective":"x"}},{"text":" "},{"color":"white","score":{"name":"@s","objective":"y"}},{"text":" (+)","color":"light_purple"},{"color":"white","score":{"name":"@s","objective":"z"}},{"text":" | SW"}]
execute as @a[tag=!personalNoCoords] if score @s rotation matches 68..112 run title @s actionbar [{"text":"XYZ:","color":"gold"},{"text":" (-)","color":"light_purple"},{"color":"white","score":{"name":"@s","objective":"x"}},{"text":" "},{"color":"white","score":{"name":"@s","objective":"y"}},{"text":" (=)","color":"light_purple"},{"color":"white","score":{"name":"@s","objective":"z"}},{"text":" | W"}]
execute as @a[tag=!personalNoCoords] if score @s rotation matches 113..157 run title @s actionbar [{"text":"XYZ:","color":"gold"},{"text":" (-)","color":"light_purple"},{"color":"white","score":{"name":"@s","objective":"x"}},{"text":" "},{"color":"white","score":{"name":"@s","objective":"y"}},{"text":" (-)","color":"light_purple"},{"color":"white","score":{"name":"@s","objective":"z"}},{"text":" | NW"}]
execute as @a[tag=!personalNoCoords] if score @s rotation matches 158..179 run title @s actionbar [{"text":"XYZ:","color":"gold"},{"text":" (=)","color":"light_purple"},{"color":"white","score":{"name":"@s","objective":"x"}},{"text":" "},{"color":"white","score":{"name":"@s","objective":"y"}},{"text":" (-)","color":"light_purple"},{"color":"white","score":{"name":"@s","objective":"z"}},{"text":" | N"}]