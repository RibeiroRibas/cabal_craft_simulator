import 'package:cabal_craft_simulator/modules/home_module/routes/route_named.dart';
import 'package:cabal_craft_simulator/shared/route_navigator.dart';
import 'package:flutter_modular/flutter_modular.dart';

class NewRegistrationRouteNavigator extends RouteNavigator {
  @override
  Future<void> goTo(String routeName, dynamic arguments) async {
    Modular.to.pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<void> pop() async {
    Modular.to.pop();
  }

  Future<void> goToFromIndex(int index) async {
    switch (index) {
      case 0:
        goTo('$registerRoute$registerCategoryRoute', null);
      case 1:
        goTo('$registerRoute$registerSubCategoryRoute', null);
      case 2:
        goTo('$registerRoute$registerItemRoute', null);
      case 3:
        goTo('$registerRoute$registerCraftRoute', null);
    }
  }
}
