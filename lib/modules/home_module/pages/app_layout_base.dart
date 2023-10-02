import 'package:cabal_craft_simulator/modules/home_module/routes/home_rote_navigator.dart';
import 'package:cabal_craft_simulator/shared/green_theme.dart';
import 'package:cabal_craft_simulator/shared/i18n/messages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppLayoutBase extends StatelessWidget {
  final Widget body;
  final bool backButton;

  const AppLayoutBase({
    Key? key,
    required this.body,
    this.backButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeRouteNavigator navigator = Modular.get<HomeRouteNavigator>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          cabalCraftSimulator,
          style: greenTheme.textTheme.displayLarge,
        ),
        centerTitle: true,
        leading: backButton ? IconButton(
          onPressed: () => navigator.pop(),
          icon: Icon(
            Icons.arrow_back,
            color: greenTheme.primaryColor,
          ),
        ) : null,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 16.0,
          right: 16.0,
          top: 12,
          bottom: 32.0,
        ),
        child: body,
      ),
    );
  }
}
