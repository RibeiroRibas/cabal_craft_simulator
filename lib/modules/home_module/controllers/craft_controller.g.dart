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
qtdCraft: ${qtdCraft}
    ''';
  }
}
