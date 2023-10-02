import 'package:cabal_craft_simulator/data/item_data.dart';
import 'package:cabal_craft_simulator/model/item.dart';
import 'package:cabal_craft_simulator/model/sub_category.dart';

class ItemRepository {
  Future<List<Item>> findBySubCategory(SubCategory subCategory) async {
    List<Item> items = [];
    items.addAll(getAllItems);
    items.removeWhere((element) => element.subCategory != subCategory);
    return items;
  }
}
