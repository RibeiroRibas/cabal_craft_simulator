import 'package:cabal_craft_simulator/data/sub_category_data.dart';
import 'package:cabal_craft_simulator/model/category.dart';
import 'package:cabal_craft_simulator/model/sub_category.dart';

class SubCategoryRepository {
  Future<List<SubCategory>> findByCategory(Category category) async {
    final List<SubCategory> subCategories = [];
    subCategories.addAll(getAllSubCategories);
    final List<SubCategory> filteredSubcategories = [];
    for (var subCategory in subCategories) {
      for (var element in subCategory.categories) {
        if (element == category) {
          filteredSubcategories.add(subCategory);
        }
      }
    }
    return filteredSubcategories;
  }

  Future<List<SubCategory>> findAll() async{
    return getAllSubCategories;
  }

  Future<void>save(SubCategory subCategory) async {
    getAllSubCategories.add(subCategory);
  }
}
