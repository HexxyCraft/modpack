execute as @s at @s as @e[type=minecraft:item,distance=0..0.5,nbt={Item:{id:"hexcasting:scroll_small"}},nbt={Item:{tag:{op_id:"dyed:scroll"}}}] run tag @s add Undye_Target_Scroll
execute as @s at @s as @e[type=minecraft:item,distance=0..0.5,nbt={Item:{id:"hexcasting:scroll_medium"}},nbt={Item:{tag:{op_id:"dyed:scroll"}}}] run tag @s add Undye_Target_Scroll
execute as @s at @s as @e[type=minecraft:item,distance=0..0.5,nbt={Item:{id:"hexcasting:scroll"}},nbt={Item:{tag:{op_id:"dyed:scroll"}}}] run tag @s add Undye_Target_Scroll
execute as @s at @s run function hexscrolldye:scroll_undye_step