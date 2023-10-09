// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemController on ItemSore, Store {
  late final _$itemsAtom = Atom(name: 'ItemSore.items', context: context);

  @override
  ObservableList<Item> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<Item> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$selectedCategoriesAtom =
      Atom(name: 'ItemSore.selectedCategories', context: context);

  @override
  ObservableList<Category> get selectedCategories {
    _$selectedCategoriesAtom.reportRead();
    return super.selectedCategories;
  }

  @override
  set selectedCategories(ObservableList<Category> value) {
    _$selectedCategoriesAtom.reportWrite(value, super.selectedCategories, () {
      super.selectedCategories = value;
    });
  }

  late final _$charactersAtom =
      Atom(name: 'ItemSore.characters', context: context);

  @override
  ObservableList<Character> get characters {
    _$charactersAtom.reportRead();
    return super.characters;
  }

  @override
  set characters(ObservableList<Character> value) {
    _$charactersAtom.reportWrite(value, super.characters, () {
      super.characters = value;
    });
  }

  late final _$findAllItemsAsyncAction =
      AsyncAction('ItemSore.findAllItems', context: context);

  @override
  Future<void> findAllItems() {
    return _$findAllItemsAsyncAction.run(() => super.findAllItems());
  }

  late final _$saveItemAsyncAction =
      AsyncAction('ItemSore.saveItem', context: context);

  @override
  Future<void> saveItem(String itemName, String itemValue,
      SubCategory subCategory, String slots, String itemLevel) {
    return _$saveItemAsyncAction.run(() =>
        super.saveItem(itemName, itemValue, subCategory, slots, itemLevel));
  }

  late final _$ItemSoreActionController =
      ActionController(name: 'ItemSore', context: context);

  @override
  void addSelectedCategory(Category? category) {
    final _$actionInfo = _$ItemSoreActionController.startAction(
        name: 'ItemSore.addSelectedCategory');
    try {
      return super.addSelectedCategory(category);
    } finally {
      _$ItemSoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSelectedCharacter(Character? character) {
    final _$actionInfo = _$ItemSoreActionController.startAction(
        name: 'ItemSore.addSelectedCharacter');
    try {
      return super.addSelectedCharacter(character);
    } finally {
      _$ItemSoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items},
selectedCategories: ${selectedCategories},
characters: ${characters}
    ''';
  }
}
