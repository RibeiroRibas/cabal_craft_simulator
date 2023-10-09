import 'package:cabal_craft_simulator/model/category.dart';
import 'package:cabal_craft_simulator/model/character.dart';
import 'package:cabal_craft_simulator/model/item.dart';
import 'package:cabal_craft_simulator/model/sub_category.dart';
import 'package:cabal_craft_simulator/modules/home_module/repositories/item_repository.dart';
import 'package:mobx/mobx.dart';

part 'item_controller.g.dart';

class ItemController = ItemSore with _$ItemController;

abstract class ItemSore with Store {
  final ItemRepository itemRepository;

  ItemSore(this.itemRepository);

  @observable
  ObservableList<Item> items = ObservableList<Item>();

  @observable
  ObservableList<Category> selectedCategories = ObservableList<Category>();

  @observable
  ObservableList<Character> characters = ObservableList<Character>();

  @action
  Future<void> findAllItems() async {
    items.clear();
    selectedCategories.clear();
    items.addAll(await itemRepository.findAll());
  }

  @action
  void addSelectedCategory(Category? category) {
    if (category != null && !selectedCategories.contains(category)) {
      selectedCategories.add(category);
    }
  }

  @action
  void addSelectedCharacter(Character? character) {
    if (character != null && !characters.contains(character)) {
      characters.add(character);
    }
  }

  Item? getItemFromName(String name){
    for (Item item in items){
      String itemName = item.buildItemName();
      if(itemName == name){
        return item;
      }
    }
    return null;
  }

  @action
  Future<void> saveItem(
    String itemName,
    String itemValue,
    SubCategory subCategory,
    String slots,
    String itemLevel,
  ) async {
    slots = slots.replaceAll(RegExp(r'\D'), '');
    itemLevel = itemLevel.replaceAll(RegExp(r'\D'), '');
    itemValue = itemValue.replaceAll(RegExp(r'\D'), '');
    Item item = Item(
      name: itemName,
      level: int.parse(itemLevel),
      slot: int.parse(slots),
      category: selectedCategories,
      subCategory: subCategory,
      character: characters,
      prices: {DateTime.now(): int.parse(itemValue)},
    );
     await itemRepository.save(item).then((_)  {
       items.insert(0, item);
       characters.clear();
       selectedCategories.clear();
     });
  }
}
