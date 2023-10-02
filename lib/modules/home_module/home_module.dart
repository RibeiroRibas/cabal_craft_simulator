import 'package:cabal_craft_simulator/modules/home_module/controllers/category_controller.dart';
import 'package:cabal_craft_simulator/modules/home_module/controllers/craft_controller.dart';
import 'package:cabal_craft_simulator/modules/home_module/controllers/item_craft_controller.dart';
import 'package:cabal_craft_simulator/modules/home_module/controllers/sub_category_controller.dart';
import 'package:cabal_craft_simulator/modules/home_module/pages/category_page.dart';
import 'package:cabal_craft_simulator/modules/home_module/pages/craft_page/craft_page.dart';
import 'package:cabal_craft_simulator/modules/home_module/pages/item_craft_page.dart';
import 'package:cabal_craft_simulator/modules/home_module/repositories/category_repository.dart';
import 'package:cabal_craft_simulator/modules/home_module/repositories/item_repository.dart';
import 'package:cabal_craft_simulator/modules/home_module/routes/home_rote_navigator.dart';
import 'package:cabal_craft_simulator/modules/home_module/routes/route_named.dart';
import 'package:cabal_craft_simulator/modules/home_module/pages/sub_category_page.dart';
import 'package:cabal_craft_simulator/shared/route_navigator.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'repositories/craft_repository.dart';
import 'repositories/sub_category_repository.dart';

class HomeModule extends Module {
  static const durationTransaction = 200;

  @override
  List<Bind> get binds => [
        Bind.lazySingleton<RouteNavigator>((_) => HomeRouteNavigator()),
        Bind.factory((_) => CategoryRepository()),
        Bind.singleton((i) => CategoryController(i())),
        Bind.factory((_) => SubCategoryRepository()),
        Bind.singleton((i) => SubCategoryController(i())),
        Bind.factory((_) => ItemRepository()),
        Bind.factory((_) => CraftRepository()),
        Bind.singleton((i) => ItemCraftController(i(), i())),
        Bind.singleton((_) => CraftController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          startRoute,
          child: (context, args) => const CategoryPage(),
          transition: TransitionType.defaultTransition,
          duration: const Duration(milliseconds: durationTransaction),
        ),
        ChildRoute(
          subCategoryRoute,
          child: (context, args) => SubCategoryPage(
            category: args.data["category"],
          ),
          transition: TransitionType.defaultTransition,
          duration: const Duration(milliseconds: durationTransaction),
        ),
        ChildRoute(
          itemsRoute,
          child: (context, args) => ItemCraftPage(
            subCategory: args.data["subCategory"],
          ),
          transition: TransitionType.defaultTransition,
          duration: const Duration(milliseconds: durationTransaction),
        ),
        ChildRoute(
          craftRoute,
          child: (context, args) => CraftPage(
            craft: args.data["craft"],
          ),
          transition: TransitionType.defaultTransition,
          duration: const Duration(milliseconds: durationTransaction),
        ),
      ];
}
