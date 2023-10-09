import 'package:cabal_craft_simulator/data/craft_data.dart';
import 'package:cabal_craft_simulator/model/craft.dart';
import 'package:cabal_craft_simulator/model/item.dart';

class CraftRepository {
  Future<List<Craft>> findByItem(List<Item> items) async {
    List<Craft> allCrafts = getAllCrafts;
    List<Craft> craftsByItem = [];
    for (var item in items) {
      for (var craft in allCrafts) {
        if (item.buildItemName() == craft.item.name) {
          craftsByItem.add(craft);
        }
      }
    }
    return craftsByItem;
  }

  Future<List<Craft>> findAll() async {
    List<Craft> sortedCrafts = [];
    for (Craft craft in getAllCrafts) {
      Item item = Item.fromItem(craft.item);
      craft.item = item;
      Craft newCraft = Craft.fromCraft(craft);
      sortedCrafts.add(newCraft);
    }
    sortedCrafts.sort((a, b) => a.item.name.compareTo(b.item.name));
    return sortedCrafts;
  }

  Future<void> save(Craft craft) async {
    getAllCrafts.add(craft);
  }
}
