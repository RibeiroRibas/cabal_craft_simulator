import 'package:cabal_craft_simulator/modules/home_module/controllers/category_controller.dart';
import 'package:cabal_craft_simulator/modules/home_module/controllers/craft_controller.dart';
import 'package:cabal_craft_simulator/modules/home_module/controllers/sub_category_controller.dart';
import 'package:cabal_craft_simulator/modules/home_module/repositories/category_repository.dart';
import 'package:cabal_craft_simulator/modules/home_module/repositories/craft_repository.dart';
import 'package:cabal_craft_simulator/modules/home_module/repositories/item_repository.dart';
import 'package:cabal_craft_simulator/modules/home_module/repositories/sub_category_repository.dart';
import 'package:cabal_craft_simulator/modules/home_module/routes/route_named.dart';
import 'package:cabal_craft_simulator/modules/new_registration/item_controller.dart';
import 'package:cabal_craft_simulator/modules/new_registration/new_registration_rote_navigator.dart';
import 'package:cabal_craft_simulator/modules/new_registration/pages/category_register_page.dart';
import 'package:cabal_craft_simulator/modules/new_registration/pages/craft_register_page.dart';
import 'package:cabal_craft_simulator/modules/new_registration/pages/item_register_page.dart';
import 'package:cabal_craft_simulator/modules/new_registration/pages/select_an_option_to_register_page.dart';
import 'package:cabal_craft_simulator/modules/new_registration/pages/sub_category_register_page.dart';
import 'package:cabal_craft_simulator/shared/route_navigator.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewRegistrationModule extends Module{
  static const durationTransaction = 200;

  @override
  List<Bind> get binds => [
    Bind.lazySingleton<RouteNavigator>((_) => NewRegistrationRouteNavigator()),
    Bind.factory((_) => CategoryRepository()),
    Bind.singleton((i) => CategoryController(i())),
    Bind.factory((_) => SubCategoryRepository()),
    Bind.singleton((i) => SubCategoryController(i())),
    Bind.factory((_) => ItemRepository()),
    Bind.singleton((i) => ItemController(i())),
    Bind.factory((_) => CraftRepository()),
    Bind.singleton((i) => CraftController(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute(
      startRoute,
      child: (context, args) => const SelectAnOptionToRegister(),
      transition: TransitionType.defaultTransition,
      duration: const Duration(milliseconds: durationTransaction),
    ),
    ChildRoute(
      registerCategoryRoute,
      child: (context, args) => const CategoryRegisterPage(),
      transition: TransitionType.defaultTransition,
      duration: const Duration(milliseconds: durationTransaction),
    ),
    ChildRoute(
      registerSubCategoryRoute,
      child: (context, args) => const SubCategoryRegisterPage(),
      transition: TransitionType.defaultTransition,
      duration: const Duration(milliseconds: durationTransaction),
    ),
    ChildRoute(
      registerItemRoute,
      child: (context, args) => const ItemRegisterPage(),
      transition: TransitionType.defaultTransition,
      duration: const Duration(milliseconds: durationTransaction),
    ),
    ChildRoute(
      registerCraftRoute,
      child: (context, args) => const CraftRegisterPage(),
      transition: TransitionType.defaultTransition,
      duration: const Duration(milliseconds: durationTransaction),
    ),
  ];
}