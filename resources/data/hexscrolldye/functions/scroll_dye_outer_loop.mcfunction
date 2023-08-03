execute as @s store result score @s hexscrolldye_var01 run data get entity @s Item.Count
execute as @s if score @s hexscrolldye_var01 matches 1.. as @e[tag=Dye_Target_Scroll,limit=1,sort=nearest,nbt=!{Item:{Count:0b}}] run function hexscrolldye:scroll_dye
scoreboard players remove @s hexscrolldye_var01 1
execute as @s store result entity @s Item.Count byte 1 run scoreboard players get @s hexscrolldye_var01
execute as @s if score @s hexscrolldye_var01 matches 1.. run function hexscrolldye:scroll_dye_outer_loop