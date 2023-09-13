print ("Patching bread block recipes");

//start with all wheat bread items. (population: 1)
val tagBread = <tag:items:c:bread/wheat>;

//remove original recipe
craftingTable.removeByName("architects_palette:bread_block");

//add storage block recipes
craftingTable.addShapeless("hexxycraft/bread_block/craft", <item:architects_palette:bread_block> * 1, [tagBread, tagBread, tagBread, tagBread, tagBread, tagBread, tagBread, tagBread, tagBread]);
craftingTable.addShapeless("hexxycraft/bread_block/uncraft", <item:minecraft:bread> * 9, [<item:architects_palette:bread_block>]);


print ("Bread block recipes patched");
