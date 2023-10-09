// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'craft_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CraftController on CraftStore, Store {
  late final _$craftResultAtom =
      Atom(name: 'CraftStore.craftResult', context: context);

  @override
  ObservableList<Map<Item, int>> get craftResult {
    _$craftResultAtom.reportRead();
    return super.craftResult;
  }

  @override
  set craftResult(ObservableList<Map<Item, int>> value) {
    _$craftResultAtom.reportWrite(value, super.craftResult, () {
      super.craftResult = value;
    });
  }

  late final _$craftCalculatorAtom =
      Atom(name: 'CraftStore.craftCalculator', context: context);

  @override
  CraftCalculator get craftCalculator {
    _$craftCalculatorAtom.reportRead();
    return super.craftCalculator;
  }

  @override
  set craftCalculator(CraftCalculator value) {
    _$craftCalculatorAtom.reportWrite(value, super.craftCalculator, () {
      super.craftCalculator = value;
    });
  }

  late final _$craftsAtom = Atom(name: 'CraftStore.crafts', context: context);

  @override
  ObservableList<Craft> get crafts {
    _$craftsAtom.reportRead();
    return super.crafts;
  }

  @override
  set crafts(ObservableList<Craft> value) {
    _$craftsAtom.reportWrite(value, super.crafts, () {
      super.crafts = value;
    });
  }

  late final _$selectedMaterialsAtom =
      Atom(name: 'CraftStore.selectedMaterials', context: context);

  @override
  ObservableList<Item> get selectedMaterials {
    _$selectedMaterialsAtom.reportRead();
    return super.selectedMaterials;
  }

  @override
  set selectedMaterials(ObservableList<Item> value) {
    _$selectedMaterialsAtom.reportWrite(value, super.selectedMaterials, () {
      super.selectedMaterials = value;
    });
  }

  late final _$selectedResultsAtom =
      Atom(name: 'CraftStore.selectedResults', context: context);

  @override
  ObservableList<Item> get selectedResults {
    _$selectedResultsAtom.reportRead();
    return super.selectedResults;
  }

  @override
  set selectedResults(ObservableList<Item> value) {
    _$selectedResultsAtom.reportWrite(value, super.selectedResults, () {
      super.selectedResults = value;
    });
  }

  late final _$qtdCraftAtom =
      Atom(name: 'CraftStore.qtdCraft', context: context);

  @override
  int get qtdCraft {
    _$qtdCraftAtom.reportRead();
    return super.qtdCraft;
  }

  @override
  set qtdCraft(int value) {
    _$qtdCraftAtom.reportWrite(value, super.qtdCraft, () {
      super.qtdCraft = value;
    });
  }

  late final _$addSelectedMaterialAsyncAction =
      AsyncAction('CraftStore.addSelectedMaterial', context: context);

  @override
  Future<void> addSelectedMaterial(Item item) {
    return _$addSelectedMaterialAsyncAction
        .run(() => super.addSelectedMaterial(item));
  }

  late final _$addSelectedResultsAsyncAction =
      AsyncAction('CraftStore.addSelectedResults', context: context);

  @override
  Future<void> addSelectedResults(Item item) {
    return _$addSelectedResultsAsyncAction
        .run(() => super.addSelectedResults(item));
  }

  late final _$saveAsyncAction =
      AsyncAction('CraftStore.save', context: context);

  @override
  Future<void> save(Item item, Map<Item, int> materials) {
    return _$saveAsyncAction.run(() => super.save(item, materials));
  }

  late final _$CraftStoreActionController =
      ActionController(name: 'CraftStore', context: context);

  @override
  void addCraftResult(Map<Item, int> result) {
    final _$actionInfo = _$CraftStoreActionController.startAction(
        name: 'CraftStore.addCraftResult');
    try {
      return super.addCraftResult(result);
    } finally {
      _$CraftStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void craftCalculate(Craft craft, List<Map<Item, int>> craftResult, int qtd) {
    final _$actionInfo = _$CraftStoreActionController.startAction(
        name: 'CraftStore.craftCalculate');
    try {
      return super.craftCalculate(craft, craftResult, qtd);
    } finally {
      _$CraftStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetObservables() {
    final _$actionInfo = _$CraftStoreActionController.startAction(
        name: 'CraftStore.resetObservables');
    try {
      return super.resetObservables();
    } finally {
      _$CraftStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeValueQtdCraft(int value) {
    final _$actionInfo = _$CraftStoreActionController.startAction(
        name: 'CraftStore.changeValueQtdCraft');
    try {
      return super.changeValueQtdCraft(value);
    } finally {
      _$CraftStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
craftResult: ${craftResult},
craftCalculator: ${craftCalculator},
crafts: ${crafts},
selectedMaterials: ${selectedMaterials},
selectedResults: ${selectedResults},
qtdCraft: ${qtdCraft}
    ''';
  }
}
