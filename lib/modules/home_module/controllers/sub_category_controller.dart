import 'package:cabal_craft_simulator/model/category.dart';
import 'package:cabal_craft_simulator/model/sub_category.dart';
import 'package:cabal_craft_simulator/modules/home_module/repositories/sub_category_repository.dart';
import 'package:mobx/mobx.dart';

part 'sub_category_controller.g.dart';

class SubCategoryController = SubCategoryStore with _$SubCategoryController;

abstract class SubCategoryStore with Store {
  final SubCategoryRepository repository;

  SubCategoryStore(this.repository);

  @observable
  ObservableList<SubCategory> subCategories = ObservableList<SubCategory>();

  @action
  Future<void> findByCategory(Category category) async {
    subCategories.clear();
    subCategories.addAll(await repository.findByCategory(category));
  }
}
