import crafttweaker.api.item.IItemStack;
import crafttweaker.api.ingredient.IIngredient;
import crafttweaker.api.data.IData;

public function getCageEntityData(cage as IItemStack) as IData? {
    if cage.hasTag
    && "BlockEntityTag" in cage.tag
    && "MobHolder" in cage.tag["BlockEntityTag"]
    && "EntityData" in cage.tag["BlockEntityTag"]["MobHolder"] {
        return cage.tag["BlockEntityTag"]["MobHolder"]["EntityData"];
    }
}

val inputCage = <item:supplementaries:cage>.withTag({
    BlockEntityTag: {
        MobHolder: {
            Name: "Minecart with Chest",
            EntityData: {
                id: "lootr:lootr_minecart",
                Rotation: [0.0, 0.0],
                Pos: [0.5, 0.0626, 0.5]
            },
            UUID: [830360616, -1189461079, -1328572789, -1624233829],
            Scale: 0.625
        }
    }
});

val outputCage = <item:supplementaries:cage>.withTag({
    BlockEntityTag: {
        MobHolder: {
            Name: "Minecart",
            EntityData: {
                OnGround: 1,
                id: "minecraft:minecart",
                Rotation: [0.0, 0.0],
                Pos: [0.5, 0.0626, 0.5]
            },
            UUID: [1019941829, 699614039, -1244528206, -2062186071],
            Scale: 0.625
        }
    }
});

craftingTable.addShapeless(
    "hexxycraft/extract_lootr_chest/display",
    <item:lootr:lootr_chest>,
    [inputCage.transformReplace(outputCage)]
);

craftingTable.addShapeless(
    "hexxycraft/extract_lootr_chest",
    <item:minecraft:air>,
    [<item:supplementaries:cage>.onlyIf("hexxycraft/cage_has_lootr_minecart", (item as IItemStack) => {
        val entityData = getCageEntityData(item);
        return entityData != null && "id" in entityData && entityData["id"] == "lootr:lootr_minecart";
    }).transformReplace(outputCage)],
    (usualOut as IItemStack, inputs as IItemStack[]) => {
        val entityData = getCageEntityData(inputs[0]);

        val lootTable = entityData["LootTable"];
        if (lootTable == "minecraft:") lootTable = "minecraft:chests/abandoned_mineshaft";

        return <item:lootr:lootr_chest>.withTag({
            BlockEntityTag: {
                LootTable: lootTable,
                LootrOpeners: entityData["LootrOpeners"],
                LootTableSeed: entityData["LootTableSeed"],
                tileId: inputs[0].tag["BlockEntityTag"]["MobHolder"]["UUID"]
                // id: "lootr:special_loot_chest",
                // tileId: [-940587010, -469282881, -1114908107, 44036361]
            }
        });
    }
);

// <item:supplementaries:cage>.withTag({
//     BlockEntityTag: {
//         MobHolder: {
//             Name: "Minecart with Chest",
//             EntityData: {
//                 Controller: {},
//                 "faux-custom-entity-data:custom": {},
//                 LootTableSeed: 0,
//                 LootrOpeners: [[-853062021, -1367389533, -1462062150, 1535732875]],
//                 OnGround: 1,
//                 Air: 300,
//                 Invulnerable: 0,
//                 LootTable: "minecraft:",
//                 FallDistance: 0.0,
//                 Motion: [-7.859018743358685E-169, 0.0, -1.1939580087987718E-169],
//                 id: "lootr:lootr_minecart",
//                 Rotation: [0.0, 0.0],
//                 Pos: [0.5, 0.0626, 0.5],
//                 Fire: 0,
//                 PortalCooldown: 0,
//                 BalmData: {},
//                 cardinal_components: {}
//             },
//             UUID: [830360616, -1189461079, -1328572789, -1624233829],
//             Scale: 0.625
//         }
//     }
// })