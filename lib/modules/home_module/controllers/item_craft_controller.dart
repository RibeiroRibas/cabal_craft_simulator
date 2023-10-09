import 'package:cabal_craft_simulator/model/category.dart';
import 'package:cabal_craft_simulator/model/craft.dart';
import 'package:cabal_craft_simulator/model/item.dart';
import 'package:cabal_craft_simulator/model/sub_category.dart';
import 'package:cabal_craft_simulator/modules/home_module/repositories/craft_repository.dart';
import 'package:cabal_craft_simulator/modules/home_module/repositories/item_repository.dart';
import 'package:mobx/mobx.dart';

part 'item_craft_controller.g.dart';

class ItemCraftController = ItemCraftStore with _$ItemCraftController;

abstract class ItemCraftStore with Store {
  final ItemRepository itemRepository;
  final CraftRepository craftRepository;

  ItemCraftStore(this.itemRepository, this.craftRepository);

  @observable
  List<Craft> itemsToCraft = [];

  @action
  Future<void> findBySubCategoryAndCategory(SubCategory subCategory, Category category) async {
    List<Item> items = await itemRepository.findBySubCategoryAndCategory(subCategory,category);
    itemsToCraft = await craftRepository.findByItem(items);
  }
}
