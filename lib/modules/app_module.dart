import 'package:cabal_craft_simulator/modules/home_module/home_module.dart';
import 'package:cabal_craft_simulator/modules/home_module/routes/route_named.dart';
import 'package:cabal_craft_simulator/modules/new_registration/new_registration_module.dart';
import 'package:flutter_modular/flutter_modular.dart';


class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
         ModuleRoute(startRoute, module: HomeModule()),
         ModuleRoute(registerRoute, module: NewRegistrationModule()),
      ];
}
