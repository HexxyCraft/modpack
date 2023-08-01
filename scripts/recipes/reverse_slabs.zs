import crafttweaker.api.recipe.type.ShapedRecipe;

for itemDefinition in <tag:items:minecraft:slabs> {
    val itemStack = itemDefinition.defaultInstance;

    for recipe in craftingTable.getRecipesByOutput(itemStack) {
        // only look at shaped recipes in the shape of a slab
        if !(recipe is ShapedRecipe) continue;

        val shapedRecipe = recipe as ShapedRecipe;
        if !(shapedRecipe.height == 1 && shapedRecipe.width == 3) continue;
        
        // only look at recipes where all three ingredients are the same
        val ingredients = shapedRecipe.getIngredientArray()[0];
        if !(ingredients[0] == ingredients[1] && ingredients[1] == ingredients[2]) continue;

        // add the reverse recipe
        val result = ingredients[0].items[0];
        val name = "hexxycraft/reverse_slab/" + result.registryName.namespace + "/" + result.registryName.path;

        craftingTable.addShaped(name, result, [[itemStack, itemStack]]);
    }
}
