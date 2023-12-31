// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoryController on CategoryStore, Store {
  late final _$categoriesAtom =
      Atom(name: 'CategoryStore.categories', context: context);

  @override
  ObservableList<Category> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<Category> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  late final _$findAllCategoriesAsyncAction =
      AsyncAction('CategoryStore.findAllCategories', context: context);

  @override
  Future<void> findAllCategories() {
    return _$findAllCategoriesAsyncAction.run(() => super.findAllCategories());
  }

  late final _$saveCategoryAsyncAction =
      AsyncAction('CategoryStore.saveCategory', context: context);

  @override
  Future<void> saveCategory(String categoryName) {
    return _$saveCategoryAsyncAction
        .run(() => super.saveCategory(categoryName));
  }

  @override
  String toString() {
    return '''
categories: ${categories}
    ''';
  }
}
