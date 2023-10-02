import 'package:cabal_craft_simulator/model/craft.dart';
import 'package:cabal_craft_simulator/model/item.dart';
import 'package:cabal_craft_simulator/modules/home_module/models/craft_calculator.dart';
import 'package:mobx/mobx.dart';

part 'craft_controller.g.dart';

class CraftController = CraftStore with _$CraftController;

abstract class CraftStore with Store {
  @observable
  ObservableList<Map<Item, int>> craftResult = ObservableList<Map<Item, int>>();

  @observable
  CraftCalculator craftCalculator = CraftCalculator();

  @observable
  int qtdCraft = 0;

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
  void resetObservables(){
    craftCalculator = CraftCalculator();
    craftResult.clear();
    qtdCraft = 0;
  }

  @action
  void changeValueQtdCraft(int value){
    qtdCraft = value;
  }
}
