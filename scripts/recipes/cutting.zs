import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.data.IData;
import crafttweaker.api.util.random.Percentaged;

// see: https://docs.blamejared.com/1.19/en/mods/other_mods
function addCreateCutting(itemIn as IIngredient, itemOut as Percentaged<IItemStack>, duration as int) as void {
    val internalItemIn = itemIn.items[0];
    val internalItemOut = itemOut.getData();   

    val name = "hexxycraft/cutting/" + internalItemIn.registryName.namespace + "/" + internalItemIn.registryName.path;
    <recipetype:create:cutting>.addJsonRecipe(name, {
        "type": "create:cutting",
        "ingredients": [
            itemIn as IData,
        ],
        "results": [
            (internalItemOut as IData).merge({"count" : internalItemOut.amount}).merge({"chance" : itemOut.getPercentage()})
        ],
        "processingTime": duration
    });
}

// add the recipes
for row in [
    ["charm", "azalea"],
    ["charm", "ebony"],
    ["hexcasting", "edified"]
] {
    // unpack row
    val namespace = row[0];
    val woodType = row[1];

    // interpolate item ids
    val log = <item:${namespace}:${woodType}_log>;
    val strippedLog = <item:${namespace}:stripped_${woodType}_log>;
    val planks = <item:${namespace}:${woodType}_planks>;

    val wood = <item:${namespace}:${woodType}_wood>;
    val strippedWood = <item:${namespace}:stripped_${woodType}_wood>;

    // tags, i guess
    <tag:items:create:modded_stripped_logs>.addId(strippedLog.registryName);
    <tag:items:create:modded_stripped_wood>.addId(strippedWood.registryName);

    // actual recipes
    addCreateCutting(log, strippedLog, 50);
    addCreateCutting(strippedLog, planks * 6, 50);

    addCreateCutting(wood, strippedWood, 50);
    addCreateCutting(strippedWood, planks * 6, 50);
}
