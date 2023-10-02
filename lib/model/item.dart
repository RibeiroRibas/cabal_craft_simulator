import 'package:cabal_craft_simulator/model/category.dart';
import 'package:cabal_craft_simulator/model/character.dart';
import 'package:cabal_craft_simulator/model/sub_category.dart';

class Item {
  String name;
  int? level;
  int? slot;
  List<Character>? character;
  Map<DateTime, int> prices;
  Category category;
  SubCategory subCategory;

  Item(
      {required this.name,
      this.level,
      this.slot,
      this.character,
      required this.category,
      required this.subCategory,
      required this.prices});

  String buildItemName() {
    return level != null && level! > 0 ? '$name +$level' : name;
  }

  int calculateTotalInvestment(int qtd) {
    return prices.values.last * qtd;
  }
}
