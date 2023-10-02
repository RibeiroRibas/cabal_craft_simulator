import 'package:cabal_craft_simulator/shared/route_navigator.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeRouteNavigator extends RouteNavigator {
  @override
  Future<void> goTo(String routeName, dynamic arguments) async {
    Modular.to.pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<void> pop() async {
    Modular.to.pop();
  }
}
