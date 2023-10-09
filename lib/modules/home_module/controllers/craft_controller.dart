import 'package:cabal_craft_simulator/model/craft.dart';
import 'package:cabal_craft_simulator/model/item.dart';
import 'package:cabal_craft_simulator/modules/home_module/models/craft_calculator.dart';
import 'package:cabal_craft_simulator/modules/home_module/repositories/craft_repository.dart';
import 'package:mobx/mobx.dart';

part 'craft_controller.g.dart';

class CraftController = CraftStore with _$CraftController;

abstract class CraftStore with Store {
  final CraftRepository repository;

  CraftStore(this.repository);

  @observable
  ObservableList<Map<Item, int>> craftResult = ObservableList<Map<Item, int>>();

  @observable
  CraftCalculator craftCalculator = CraftCalculator();

  @observable
  ObservableList<Craft> crafts = ObservableList<Craft>();

  @observable
  ObservableList<Item> selectedMaterials = ObservableList<Item>();

  @observable
  ObservableList<Item> selectedResults = ObservableList<Item>();

  @observable
  int qtdCraft = 0;

  Future<void> findAll() async {
    crafts.clear();
    selectedMaterials.clear();
    selectedResults.clear();
    crafts.addAll(await repository.findAll());
  }

  @action
  Future<void> addSelectedMaterial(Item item) async {
    selectedMaterials.add(item);
  }

  @action
  Future<void> addSelectedResults(Item item) async {
    selectedResults.add(item);
  }

  @action
  void addCraftResult(Map<Item, int> result) {
    craftResult.add(result);
  }

  @action
  void craftCalculate(Craft craft, List<Map<Item, int>> craftResult, int qtd) {
    craftCalculator = CraftCalculator();
    craftCalculator = CraftCalculator.calculate(craft, craftResult, qtd);
  }

  @action
  void resetObservables() {
    craftCalculator = CraftCalculator();
    craftResult.clear();
    qtdCraft = 0;
  }

  @action
  void changeValueQtdCraft(int value) {
    qtdCraft = value;
  }

  @action
  Future<void> save(Item item, Map<Item, int> materials) async {
    Craft craft =
        Craft(item: item, materials: materials, results: selectedResults);
    repository.save(craft).then((value) {
      selectedResults.clear();
      selectedMaterials.clear();
      crafts.insert(0, craft);
    });
  }
}
