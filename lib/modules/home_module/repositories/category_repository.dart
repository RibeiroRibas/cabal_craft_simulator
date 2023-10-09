import 'package:cabal_craft_simulator/data/category_data.dart';
import 'package:cabal_craft_simulator/model/category.dart';

class CategoryRepository {
  Future<List<Category>> findAll() async {
    return getAllCategories;
  }

  Future<void> save(Category category) async{
    getAllCategories.add(category);
  }
}
