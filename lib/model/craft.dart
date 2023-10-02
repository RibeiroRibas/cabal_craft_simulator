import 'package:cabal_craft_simulator/model/item.dart';

class Craft {
  Item item;
  Map<Item, int> materials;
  List<Item> results;

  Craft({required this.item, required this.materials,required this.results});
}
