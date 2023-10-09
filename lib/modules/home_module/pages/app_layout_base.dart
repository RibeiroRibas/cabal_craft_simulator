import 'package:cabal_craft_simulator/modules/home_module/routes/route_named.dart';
import 'package:cabal_craft_simulator/shared/green_theme.dart';
import 'package:cabal_craft_simulator/shared/i18n/messages.dart';
import 'package:cabal_craft_simulator/shared/util/focus_node_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppLayoutBase extends StatelessWidget {
  final Widget body;
  final bool backButton;
  final bool isShowFabButton;

  const AppLayoutBase({
    Key? key,
    required this.body,
    this.backButton = true,
    this.isShowFabButton = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusNodeHelper.dismissKeyboard(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            cabalCraftSimulator,
            style: greenTheme.textTheme.displayLarge,
          ),
          centerTitle: true,
          leading: backButton
              ? IconButton(
                  onPressed: () => Modular.to.canPop()
                      ? Modular.to.pop()
                      : Modular.to.navigate(startRoute, arguments: null),
                  icon: Icon(
                    Icons.arrow_back,
                    color: greenTheme.primaryColor,
                  ),
                )
              : null,
        ),
        floatingActionButton: isShowFabButton
            ? FloatingActionButton(
                onPressed: () =>
                    Modular.to.navigate(registerRoute, arguments: null),
                child: const Icon(Icons.add),
              )
            : null,
        body: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 12,
            bottom: 32.0,
          ),
          child: body,
        ),
      ),
    );
  }
}
