import 'package:cabal_craft_simulator/data/craft_data.dart';
import 'package:cabal_craft_simulator/model/craft.dart';
import 'package:cabal_craft_simulator/model/item.dart';

class CraftRepository {
  Future<List<Craft>> findByItem(List<Item> items) async {
    List<Craft> allCrafts = getAllCrafts;
    List<Craft> craftsByItem = [];
    for (var item in items) {
      for (var craft in allCrafts) {
        if (item == craft.item) {
          craftsByItem.add(craft);
        }
      }
    }
    return craftsByItem;
  }
}
