<tag:items:hexxycraft:chest_planks>.add(<tag:items:minecraft:planks>);
<tag:items:hexxycraft:chest_planks>.removeId(<resource:hexcasting:edified_planks>);

craftingTable.removeByName("minecraft:chest");
craftingTable.addShaped("hexxycraft_chest", <item:minecraft:chest>, [
    [<tag:items:hexxycraft:chest_planks>, <tag:items:hexxycraft:chest_planks>, <tag:items:hexxycraft:chest_planks>],
    [<tag:items:hexxycraft:chest_planks>, <item:minecraft:air>, <tag:items:hexxycraft:chest_planks>],
    [<tag:items:hexxycraft:chest_planks>, <tag:items:hexxycraft:chest_planks>, <tag:items:hexxycraft:chest_planks>]
]);
