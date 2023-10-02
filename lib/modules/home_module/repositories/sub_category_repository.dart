import 'package:cabal_craft_simulator/data/sub_category_data.dart';
import 'package:cabal_craft_simulator/model/category.dart';
import 'package:cabal_craft_simulator/model/sub_category.dart';

class SubCategoryRepository {
  Future<List<SubCategory>> findByCategory(Category category) async {
    final List<SubCategory> subCategories = [];
    subCategories.addAll(getAllCategories);
    subCategories.removeWhere((element) => element.category != category);
    return subCategories;
  }
}
