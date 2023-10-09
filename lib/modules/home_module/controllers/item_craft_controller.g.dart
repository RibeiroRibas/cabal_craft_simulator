// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_craft_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ItemCraftController on ItemCraftStore, Store {
  late final _$itemsToCraftAtom =
      Atom(name: 'ItemCraftStore.itemsToCraft', context: context);

  @override
  List<Craft> get itemsToCraft {
    _$itemsToCraftAtom.reportRead();
    return super.itemsToCraft;
  }

  @override
  set itemsToCraft(List<Craft> value) {
    _$itemsToCraftAtom.reportWrite(value, super.itemsToCraft, () {
      super.itemsToCraft = value;
    });
  }

  late final _$findBySubCategoryAndCategoryAsyncAction = AsyncAction(
      'ItemCraftStore.findBySubCategoryAndCategory',
      context: context);

  @override
  Future<void> findBySubCategoryAndCategory(
      SubCategory subCategory, Category category) {
    return _$findBySubCategoryAndCategoryAsyncAction
        .run(() => super.findBySubCategoryAndCategory(subCategory, category));
  }

  @override
  String toString() {
    return '''
itemsToCraft: ${itemsToCraft}
    ''';
  }
}
