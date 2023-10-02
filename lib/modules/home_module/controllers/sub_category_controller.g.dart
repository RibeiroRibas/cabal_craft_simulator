// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sub_category_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SubCategoryController on SubCategoryStore, Store {
  late final _$subCategoriesAtom =
      Atom(name: 'SubCategoryStore.subCategories', context: context);

  @override
  ObservableList<SubCategory> get subCategories {
    _$subCategoriesAtom.reportRead();
    return super.subCategories;
  }

  @override
  set subCategories(ObservableList<SubCategory> value) {
    _$subCategoriesAtom.reportWrite(value, super.subCategories, () {
      super.subCategories = value;
    });
  }

  late final _$findByCategoryAsyncAction =
      AsyncAction('SubCategoryStore.findByCategory', context: context);

  @override
  Future<void> findByCategory(Category category) {
    return _$findByCategoryAsyncAction
        .run(() => super.findByCategory(category));
  }

  @override
  String toString() {
    return '''
subCategories: ${subCategories}
    ''';
  }
}
