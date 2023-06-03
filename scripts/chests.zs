import crafttweaker.api.recipe.type.ShapedRecipe;

// start with all the wood
<tag:items:hexxycraft:chest_planks>.add(<tag:items:minecraft:planks>);

// remove edified planks so we don't override the edified panel recipe
<tag:items:hexxycraft:chest_planks>.removeId(
    <resource:hexcasting:edified_planks>,
    <resource:hexcasting:edified_tile>,
    <resource:hexcasting:edified_panel>
);

// remove all planks that can be used to craft Charm chests
for item in <tag:items:charm:chests/normal> {
    var resource = <resource:minecraft:oak_planks>;
    if item.registryName != <resource:minecraft:chest> {
        val recipe = craftingTable.getRecipesByOutput(item.defaultInstance)[0] as ShapedRecipe;
        val ingredient = recipe.getIngredientArray()[0][0];
        resource = ingredient.items[0].registryName;
    }

    <tag:items:hexxycraft:chest_planks>.removeId(resource);
}

// override the recipe
craftingTable.removeByName("minecraft:chest");
craftingTable.addShaped("hexxycraft_chest", <item:minecraft:chest>, [
    [<tag:items:hexxycraft:chest_planks>, <tag:items:hexxycraft:chest_planks>, <tag:items:hexxycraft:chest_planks>],
    [<tag:items:hexxycraft:chest_planks>, <item:minecraft:air>, <tag:items:hexxycraft:chest_planks>],
    [<tag:items:hexxycraft:chest_planks>, <tag:items:hexxycraft:chest_planks>, <tag:items:hexxycraft:chest_planks>]
]);
