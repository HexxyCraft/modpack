execute as @s store result score @s hexscrolldye_var01 run data get entity @s Item.Count
execute as @s at @s run summon minecraft:item ~ ~ ~ {Tags:["Blank_Item"],Item:{id:"minecraft:paper",Count:1b}}
execute as @e run data modify entity @e[type=minecraft:item,tag=Blank_Item,limit=1] Item.id set from entity @e[tag=Dye_Target_Scroll,limit=1,sort=nearest] Item.id
execute as @s as @e[type=minecraft:item,tag=Blank_Item,limit=1] run data modify entity @s Item.tag.op_id set value "dyed:scroll"
execute as @s run data modify entity @e[type=minecraft:item,tag=Blank_Item,limit=1] Item.tag.display.Name set value '{"text":"Dyed Scroll"}'
execute as @e run data modify entity @e[type=minecraft:item,tag=Blank_Item,limit=1] Item.tag.display.Name set from entity @s Item.tag.display.Name
execute as @e run data modify entity @e[type=minecraft:item,tag=Blank_Item,limit=1] Item.tag.pattern set from entity @s Item.tag.pattern
execute as @e[tag=Blank_Item] run tag @s remove Blank_Item
scoreboard players remove @s hexscrolldye_var01 1
execute as @s store result entity @s Item.Count byte 1 run scoreboard players get @s hexscrolldye_var01