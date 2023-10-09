import 'package:cabal_craft_simulator/data/item_data.dart';
import 'package:cabal_craft_simulator/model/category.dart';
import 'package:cabal_craft_simulator/model/item.dart';
import 'package:cabal_craft_simulator/model/sub_category.dart';

class ItemRepository {
  Future<List<Item>> findBySubCategoryAndCategory(
      SubCategory subCategory, Category category) async {
    List<Item> items = [];
    items.addAll(getAllItems);
    items.removeWhere((element) => element.subCategory != subCategory);
    List<Item> filteredItems = [];
    for (var item in items) {
      for (var element in item.category) {
        if (element == category) {
          filteredItems.add(item);
        }
      }
    }
    filteredItems.sort((a, b) => a.name.compareTo(b.name));
    return filteredItems;
  }

  Future<List<Item>> findAll() async {
    List<Item> sortedItems = [];
    for(Item item in getAllItems){
      Item newItem = Item.fromItem(item);
      sortedItems.add(newItem);
    }
    sortedItems.sort((a, b) => a.name.compareTo(b.name));
    return sortedItems;
  }

  Future<void> save(Item item) async {
    getAllItems.add(item);
  }
}
