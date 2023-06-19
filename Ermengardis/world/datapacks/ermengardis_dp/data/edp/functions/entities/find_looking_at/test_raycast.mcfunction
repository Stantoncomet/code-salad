execute as @e[dx=0,type=villager] at @s positioned ~.99 ~.99 ~.99 if entity @s positioned ~-.99 ~-.99 ~-.99 run function edp:entities/find_looking_at/end_raycast

particle crit ~ ~ ~ .1 .1 .1 0 3
execute if entity @s[tag=looking] positioned ^ ^ ^.1 run function edp:entities/find_looking_at/test_raycast