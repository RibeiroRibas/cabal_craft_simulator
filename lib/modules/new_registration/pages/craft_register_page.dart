import 'package:cabal_craft_simulator/model/item.dart';
import 'package:cabal_craft_simulator/modules/home_module/controllers/craft_controller.dart';
import 'package:cabal_craft_simulator/modules/home_module/pages/app_layout_base.dart';
import 'package:cabal_craft_simulator/modules/new_registration/item_controller.dart';
import 'package:cabal_craft_simulator/modules/new_registration/new_registration_rote_navigator.dart';
import 'package:cabal_craft_simulator/shared/green_theme.dart';
import 'package:cabal_craft_simulator/shared/i18n/messages.dart';
import 'package:cabal_craft_simulator/shared/theme_colors.dart';
import 'package:cabal_craft_simulator/shared/ui/drop_down_button_component.dart';
import 'package:cabal_craft_simulator/shared/ui/elevated_button_component.dart';
import 'package:cabal_craft_simulator/shared/ui/outlined_text_field_component.dart';
import 'package:cabal_craft_simulator/shared/ui/text_with_border_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CraftRegisterPage extends StatefulWidget {
  const CraftRegisterPage({Key? key}) : super(key: key);

  @override
  State<CraftRegisterPage> createState() => _CraftRegisterPageState();
}

class _CraftRegisterPageState extends State<CraftRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  late final CraftController craftController;
  late final ItemController itemController;
  late final NewRegistrationRouteNavigator navigator;
  Item? item;
  Item? material;
  Item? result;
  Map<Item, int> materials = {};

  @override
  void initState() {
    craftController = Modular.get<CraftController>();
    itemController = Modular.get<ItemController>();
    navigator = Modular.get<NewRegistrationRouteNavigator>();
    _findAllCrafts();
    _findAllItems();
    super.initState();
  }

  Future _findAllItems() async {
    await itemController.findAllItems();
  }

  Future _findAllCrafts() async {
    await craftController.findAll();
  }

  bool craftAlreadyExist(String name) {
    return craftController.crafts.any((craft) {
      String craftName = name;
      return craft.item.buildItemName().toLowerCase() ==
          craftName.trimLeft().trimRight().toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppLayoutBase(
      isShowFabButton: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: TextWithBorderComponent(
                text: newCraft,
                textStyle: greenTheme.textTheme.displayMedium,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Observer(builder: (BuildContext context) {
                    return DropDownButtonComponent(
                      onValueChange: (value) {
                        item = itemController.getItemFromName(value);
                      },
                      validator: (String? value) =>
                          value == null || value.isEmpty || item == null
                              ? requiredField
                              : null,
                      width: MediaQuery.of(context).size.width,
                      values: itemController.items
                          .map((element) => element.buildItemName())
                          .toList(),
                      labelText: chooseOneItemToCraft,
                    );
                  }),
                  const SizedBox(height: 20),
                  Observer(builder: (BuildContext context) {
                    return DropDownButtonComponent(
                      onValueChange: (value) {
                        material = itemController.getItemFromName(value)!;
                        craftController.addSelectedMaterial(material!);
                      },
                      validator: (String? value) =>
                          value == null || value.isEmpty || material == null
                              ? requiredField
                              : null,
                      width: MediaQuery.of(context).size.width,
                      values: itemController.items
                          .map((element) => element.buildItemName())
                          .toList(),
                      labelText: selectRequiredMaterials,
                    );
                  }),
                  const SizedBox(height: 20),
                  Observer(builder: (context) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Expanded(
                              child: Text(craftController.selectedMaterials
                                  .elementAt(index)
                                  .buildItemName()),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.30,
                              child: OutlinedTextFieldComponent(
                                autoFocus: false,
                                keyboardType: TextInputType.number,
                                validator: (String? value) =>
                                    value == null || value.isEmpty
                                        ? requiredField
                                        : null,
                                labelText: inputMaterialAmount,
                                onChanged: (String value) {
                                  materials[itemController.getItemFromName(
                                          craftController.selectedMaterials
                                              .elementAt(index)
                                              .buildItemName())!] =
                                      int.parse(value);
                                },
                              ),
                            ),
                          ],
                        );
                      },
                      itemCount: craftController.selectedMaterials.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(color: ThemeColors.division);
                      },
                    );
                  }),
                  const SizedBox(height: 20),
                  Observer(builder: (BuildContext context) {
                    return DropDownButtonComponent(
                      onValueChange: (value) {
                        result = itemController.getItemFromName(value);
                        craftController.addSelectedResults(result!);
                      },
                      validator: (String? value) =>
                          value == null || value.isEmpty || result == null
                              ? requiredField
                              : null,
                      width: MediaQuery.of(context).size.width,
                      values: itemController.items
                          .map((element) => element.buildItemName())
                          .toList(),
                      labelText: chooseResults,
                    );
                  }),
                  const SizedBox(height: 20),
                  Observer(builder: (context) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Text(craftController.selectedResults
                            .elementAt(index)
                            .buildItemName());
                      },
                      itemCount: craftController.selectedResults.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(color: ThemeColors.division);
                      },
                    );
                  }),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButtonComponent(
                focusNode: _focusNode,
                onButtonPressed: () {
                  _focusNode.requestFocus();
                  if (_formKey.currentState!.validate()) {
                    craftController
                        .save(item!, materials)
                        .then((_) => _formKey.currentState!.reset());
                  }
                },
                text: save,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: TextWithBorderComponent(
                text: registeredCrafts,
                textStyle: greenTheme.textTheme.displayMedium,
              ),
            ),
            Observer(
              builder: (BuildContext context) {
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Text(craftController.crafts
                        .elementAt(index)
                        .item
                        .name);
                  },
                  itemCount: craftController.crafts.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(color: ThemeColors.division);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
