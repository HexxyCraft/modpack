// turtle phials

craftingTable.removeByName("computercraft:turtle_normal");
craftingTable.addShaped("hexxycraft_turtle_normal", <item:computercraft:turtle_normal>, [
    [<tag:items:c:iron_ingots>, <item:hexcasting:battery>, <tag:items:c:iron_ingots>],
    [<tag:items:c:iron_ingots>, <item:computercraft:computer_normal>, <tag:items:c:iron_ingots>],
    [<tag:items:c:iron_ingots>, <tag:items:c:wooden_chests>, <tag:items:c:iron_ingots>]
]);

craftingTable.removeByName("computercraft:turtle_advanced");
craftingTable.addShaped("hexxycraft_turtle_advanced", <item:computercraft:turtle_advanced>, [
    [<tag:items:c:gold_ingots>, <item:hexcasting:battery>, <tag:items:c:gold_ingots>],
    [<tag:items:c:gold_ingots>, <item:computercraft:computer_advanced>, <tag:items:c:gold_ingots>],
    [<tag:items:c:gold_ingots>, <tag:items:c:wooden_chests>, <tag:items:c:gold_ingots>]
]);

craftingTable.removeByName("computercraft:turtle_advanced_upgrade");
craftingTable.addShaped("hexxycraft_turtle_advanced_upgrade", <item:computercraft:turtle_advanced>, [
    [<tag:items:c:gold_ingots>, <item:minecraft:air>, <tag:items:c:gold_ingots>],
    [<tag:items:c:gold_ingots>, <item:computercraft:turtle_normal>, <tag:items:c:gold_ingots>],
    [<item:minecraft:air>, <tag:items:c:gold_blocks>, <item:minecraft:air>]
]);

// flax seeds seeds tag

<tagmanager:items>.addId(<tag:items:c:seeds>, <resource:supplementaries:flax_seeds>);

// edified planks recipe conflict

<tag:items:hexxycraft:chest_planks>.add(<tag:items:minecraft:planks>);
<tag:items:hexxycraft:chest_planks>.removeId(<resource:hexcasting:edified_planks>);

craftingTable.removeByName("minecraft:chest");
craftingTable.addShaped("hexxycraft_chest", <item:minecraft:chest>, [
    [<tag:items:hexxycraft:chest_planks>, <tag:items:hexxycraft:chest_planks>, <tag:items:hexxycraft:chest_planks>],
    [<tag:items:hexxycraft:chest_planks>, <item:minecraft:air>, <tag:items:hexxycraft:chest_planks>],
    [<tag:items:hexxycraft:chest_planks>, <tag:items:hexxycraft:chest_planks>, <tag:items:hexxycraft:chest_planks>]
]);