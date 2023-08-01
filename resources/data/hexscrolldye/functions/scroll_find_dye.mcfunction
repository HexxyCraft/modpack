execute as @s at @s if entity @e[type=minecraft:item,distance=0..0.5,nbt={Item:{id:"hexcasting:scroll_small"}}] run function hexscrolldye:scroll_dye_check
execute as @s at @s if entity @e[type=minecraft:item,distance=0..0.5,nbt={Item:{id:"hexcasting:scroll_medium"}}] run function hexscrolldye:scroll_dye_check
execute as @s at @s if entity @e[type=minecraft:item,distance=0..0.5,nbt={Item:{id:"hexcasting:scroll"}}] run function hexscrolldye:scroll_dye_check
execute as @s at @s at @e[tag=Dye_Target_Scroll,limit=1,sort=nearest] run function hexscrolldye:scroll_dye_outer_loop