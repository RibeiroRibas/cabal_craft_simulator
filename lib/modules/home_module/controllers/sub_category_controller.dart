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

  @observable
  ObservableList<Category> selectedCategories = ObservableList<Category>();

  @action
  Future<void> findByCategory(Category category) async {
    subCategories.clear();
    subCategories.addAll(await repository.findByCategory(category));
  }

  @action
  Future<void> findAllSubCategories() async {
    subCategories.clear();
    selectedCategories.clear();
    subCategories.addAll(await repository.findAll());
  }

  @action
  void addSelectedCategory(Category? category) {
    if (category != null && !selectedCategories.contains(category)) {
      selectedCategories.add(category);
    }
  }

  Future<void> saveSubCategory(String name) async {
    SubCategory subCategory =
        SubCategory(name: name, categories: selectedCategories.toList());
    repository.save(subCategory).then((value) {
      subCategories.add(subCategory);
      selectedCategories.clear();
    });
  }

  SubCategory? getSubCategoryFromName(String name){
    for (SubCategory subCategory in subCategories){
      if(subCategory.name == name){
        return subCategory;
      }
    }
    return null;
  }
}
