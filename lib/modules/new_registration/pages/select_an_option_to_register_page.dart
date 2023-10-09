import 'package:cabal_craft_simulator/data/registration_options_data.dart';
import 'package:cabal_craft_simulator/modules/home_module/pages/app_layout_base.dart';
import 'package:cabal_craft_simulator/modules/new_registration/new_registration_rote_navigator.dart';
import 'package:cabal_craft_simulator/shared/green_theme.dart';
import 'package:cabal_craft_simulator/shared/i18n/messages.dart';
import 'package:cabal_craft_simulator/shared/ui/text_with_border_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SelectAnOptionToRegister extends StatelessWidget {
  const SelectAnOptionToRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final NewRegistrationRouteNavigator navigator =
        Modular.get<NewRegistrationRouteNavigator>();
    final List<String> registrationOptions = getRegistrationOptions;
    return AppLayoutBase(
      isShowFabButton: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextWithBorderComponent(
              text: selectAnOptionToRegister,
              textStyle: greenTheme.textTheme.displayMedium,
            ),
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 4.5,
              mainAxisSpacing: 12.0,
              crossAxisSpacing: 4.0,
            ),
            itemCount: registrationOptions.length,
            itemBuilder: (BuildContext context, int index) {
              return OutlinedButton(
                onPressed: () {
                  navigator.goToFromIndex(index);
                },
                child: Text(registrationOptions.elementAt(index)),
              );
            },
          ),
        ],
      ),
    );
  }
}
