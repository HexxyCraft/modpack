import crafttweaker.api.item.IItemStack;
import crafttweaker.api.data.IData;
import crafttweaker.api.data.MapData;

public function getPhialSizeIfFull(phial as IItemStack) as int {
    val media = phial.tag["hexcasting:media"].asInt();
    if (media == phial.tag["hexcasting:start_media"].asInt()) {
        return media;
    }
    return -1;
}

craftingTable.addShapeless(
    "hexxycraft_merge_phials",
    <item:hexcasting:battery>,
    [<item:hexcasting:battery>, <item:hexcasting:battery>],
    (usualOut as IItemStack, inputs as IItemStack[]) => {
        val leftMedia = getPhialSizeIfFull(inputs[0]);
        val rightMedia = getPhialSizeIfFull(inputs[1]);

        if (leftMedia <= 0 || rightMedia <= 0 || leftMedia + rightMedia > 2000000000) {
            return <item:minecraft:air>;
        }

        inputs[0].tag["hexcasting:start_media"] = leftMedia + rightMedia;
        inputs[0].tag["hexcasting:media"] = 0;
        return inputs[0];
    }
);
