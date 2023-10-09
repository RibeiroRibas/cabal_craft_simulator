import 'package:cabal_craft_simulator/model/category.dart';
import 'package:cabal_craft_simulator/model/character.dart';
import 'package:cabal_craft_simulator/model/sub_category.dart';

class Item {
  String name;
  int level;
  int slot;
  List<Character>? character;
  Map<DateTime, int> prices;
  List<Category> category;
  SubCategory subCategory;

  Item(
      {required this.name,
      this.level = 0,
      this.slot = 0,
      this.character,
      required this.category,
      required this.subCategory,
      required this.prices});

  factory Item.fromItem(Item item) {
    return Item(
      name: item.buildItemName(),
      category: item.category,
      subCategory: item.subCategory,
      prices: item.prices,
    );
  }

  String buildItemName() {
    return level > 0
        ? '$name +$level'
        : slot == 1
            ? '$name $slot slot'
            : slot > 1
                ? '$name $slot slots'
                : name;
  }

  int calculateTotalInvestment(int qtd) {
    return prices.values.last * qtd;
  }
}
