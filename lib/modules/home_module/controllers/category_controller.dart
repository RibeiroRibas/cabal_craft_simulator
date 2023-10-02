import 'package:cabal_craft_simulator/model/category.dart';
import 'package:cabal_craft_simulator/modules/home_module/repositories/category_repository.dart';
import 'package:mobx/mobx.dart';

part 'category_controller.g.dart';

class CategoryController = CategoryStore with _$CategoryController;

abstract class CategoryStore with Store {
  final CategoryRepository repository;

  CategoryStore(this.repository);

  @observable
  ObservableList<Category> categories = ObservableList<Category>();

  @action
  Future<void> findAllCategories() async {
    categories.addAll(await repository.findAll());
  }
}
