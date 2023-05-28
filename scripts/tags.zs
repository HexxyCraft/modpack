# flax seeds
<tag:items:c:seeds>.addId(<resource:supplementaries:flax_seeds>);

# belt spyglass
<tag:items:trinkets:legs/belt>.addId(<resource:minecraft:spyglass>);

# tags missing from bosnia tools
<tag:items:c:tools/pickaxes>.add(<tag:items:c:pickaxes>);
<tag:items:c:tools/shovels>.add(<tag:items:c:shovels>);
<tag:items:c:tools/axes>.add(<tag:items:c:axes>);

// colored bundle dye recipes
for item in <tag:items:charm:colored_bundles> {
    val name = item.registryName.path;
    val endIndex = name.lastIndexOf("_") as int;
    val color = name[0 .. endIndex];

    craftingTable.addShapeless(
        "hexxycraft_charm_" + color + "_bundle",
        item,
        [<tag:items:c:bundles>, <item:minecraft:${color}_dye>],
        null
    );
}

// supplementaries cageable mobs
<tag:entity_types:supplementaries:cage_catchable>.addId([
    <resource:minecraft:cow>,
    <resource:minecraft:pig>,
    <resource:minecraft:sheep>,
    <resource:minecraft:villager>,
]);
