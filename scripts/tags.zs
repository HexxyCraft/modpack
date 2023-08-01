// flax seeds
<tag:items:c:seeds>.addId(<resource:supplementaries:flax_seeds>);

// belt spyglass
<tag:items:trinkets:legs/belt>.addId(<resource:minecraft:spyglass>);

// tags missing from bosnia tools
<tag:items:c:tools/pickaxes>.add(<tag:items:c:pickaxes>);
<tag:items:c:tools/shovels>.add(<tag:items:c:shovels>);
<tag:items:c:tools/axes>.add(<tag:items:c:axes>);

// petal apothecary seeds
<tag:items:botania:seed_apothecary_reagent>.add(<tag:items:c:seeds>);

// colored bundle dye recipes
for item in <tag:items:charm:colored_bundles> {
    val name = item.registryName.path;
    val endIndex = name.lastIndexOf("_") as int;
    val color = name[0 .. endIndex];

    craftingTable.addShapeless(
        "hexxycraft/charm/" + color + "_bundle",
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

// don't increase trade prices when caging villagers
<tag:entity_types:supplementaries:non_angerable>.addId(<resource:minecraft:villager>);

// wrenchables
<tag:blocks:create:wrench_pickup>.add([
    <tag:blocks:computercraft:monitor>,
    <tag:blocks:computercraft:wired_modem>,
]);
<tag:blocks:create:wrench_pickup>.addId([
    <resource:botania:elven_spreader>,
    <resource:botania:gaia_spreader>,
    <resource:botania:mana_spreader>,
    <resource:botania:redstone_spreader>,
    <resource:computercraft:cable>,
    <resource:computercraft:disk_drive>,
    <resource:computercraft:printer>,
    <resource:computercraft:speaker>,
    <resource:computercraft:wireless_modem_advanced>,
    <resource:computercraft:wireless_modem_normal>,
    <resource:hexcasting:akashic_connector>,
    <resource:hexcasting:akashic_record>,
    <resource:hexcasting:directrix_redstone>,
    <resource:hexcasting:empty_directrix>,
    <resource:hexcasting:empty_impetus>,
    <resource:hexcasting:impetus_look>,
    <resource:hexcasting:impetus_rightclick>,
    <resource:hexcasting:impetus_storedplayer>,
    <resource:hexcasting:slate>,
    <resource:packages:package>,
]);
