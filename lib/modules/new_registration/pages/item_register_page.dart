import 'package:cabal_craft_simulator/model/category.dart';
import 'package:cabal_craft_simulator/model/character.dart';
import 'package:cabal_craft_simulator/model/sub_category.dart';
import 'package:cabal_craft_simulator/modules/home_module/controllers/category_controller.dart';
import 'package:cabal_craft_simulator/modules/home_module/controllers/sub_category_controller.dart';
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
import 'package:cabal_craft_simulator/shared/util/valueTextInputFormatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ItemRegisterPage extends StatefulWidget {
  const ItemRegisterPage({Key? key}) : super(key: key);

  @override
  State<ItemRegisterPage> createState() => _ItemRegisterPageState();
}

class _ItemRegisterPageState extends State<ItemRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _btnFocusNode = FocusNode();
  late final SubCategoryController subCategoryController;
  late final CategoryController categoryController;
  late final ItemController itemController;
  late final NewRegistrationRouteNavigator navigator;
  String? itemName;
  Category? category;
  SubCategory? subCategory;
  String itemValue = "0";
  String itemLevel = "0";
  String slots = "0";

  @override
  void initState() {
    subCategoryController = Modular.get<SubCategoryController>();
    categoryController = Modular.get<CategoryController>();
    itemController = Modular.get<ItemController>();
    navigator = Modular.get<NewRegistrationRouteNavigator>();
    _findAllCategories();
    _findAllSubCategories();
    _findAllItems();
    super.initState();
  }

  Future _findAllCategories() async {
    await categoryController.findAllCategories();
  }

  Future _findAllSubCategories() async {
    await subCategoryController.findAllSubCategories();
  }

  Future _findAllItems() async {
    await itemController.findAllItems();
  }

  bool itemNameAlreadyExist(String name) {
    return itemController.items.any((item) {
      String itemName = name;
      return item.name.toLowerCase() ==
          itemName.trimLeft().trimRight().toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppLayoutBase(
      backButton: false,
      isShowFabButton: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: TextWithBorderComponent(
                text: newItem,
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
                        category =
                            categoryController.getCategoryFromName(value);
                        itemController.addSelectedCategory(category);
                      },
                      validator: (String? value) =>
                          value == null || value.isEmpty || category == null
                              ? requiredField
                              : null,
                      width: MediaQuery.of(context).size.width,
                      values: categoryController.categories
                          .map((element) => element.name)
                          .toList(),
                      labelText: chooseOneOrMoreCategories,
                    );
                  }),
                  const SizedBox(height: 20),
                  Observer(builder: (context) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Text(itemController.selectedCategories
                            .elementAt(index)
                            .name);
                      },
                      itemCount: itemController.selectedCategories.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(color: ThemeColors.division);
                      },
                    );
                  }),
                  const SizedBox(height: 20),
                  Observer(builder: (BuildContext context) {
                    return DropDownButtonComponent(
                      onValueChange: (value) {
                        subCategory =
                            subCategoryController.getSubCategoryFromName(value);
                      },
                      validator: (String? value) =>
                          value == null || value.isEmpty || subCategory == null
                              ? requiredField
                              : null,
                      width: MediaQuery.of(context).size.width,
                      values: subCategoryController.subCategories
                          .map((element) => element.name)
                          .toList(),
                      labelText: chooseOneSubCategory,
                    );
                  }),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: DropDownButtonComponent(
                          onValueChange: (value) {
                            Character character = Character.fromString(value);
                            itemController.addSelectedCharacter(character);
                          },
                          validator: (String? value) => value == null ||
                                  value.isEmpty ||
                                  itemController.characters.isEmpty
                              ? requiredField
                              : null,
                          width: MediaQuery.of(context).size.width,
                          values: Character.getAll(),
                          labelText: targetCharacter,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedTextFieldComponent(
                          autoFocus: false,
                          keyboardType: TextInputType.number,
                          labelText: numberOfSlots,
                          onChanged: (value) {
                            slots = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Observer(builder: (context) {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Text(itemController.characters
                            .elementAt(index)
                            .character);
                      },
                      itemCount: itemController.characters.length,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(color: ThemeColors.division);
                      },
                    );
                  }),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: OutlinedTextFieldComponent(
                          keyboardType: TextInputType.number,
                          inputFormatters: [ValueTextInputFormatter()],
                          autoFocus: false,
                          labelText: itemPurchasePrice,
                          onChanged: (value) {
                            itemValue = value;
                          },
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: OutlinedTextFieldComponent(
                          autoFocus: false,
                          keyboardType: TextInputType.number,
                          labelText: inputLevelItem,
                          onChanged: (value) {
                            itemLevel = value;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: OutlinedTextFieldComponent(
                          autoFocus: false,
                          validator: (String? value) =>
                              value == null || value.isEmpty
                                  ? requiredField
                                  : itemNameAlreadyExist(value)
                                      ? itemAlreadyExist
                                      : null,
                          labelText: inputItemName,
                          onChanged: (value) {
                            itemName = value;
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: ElevatedButtonComponent(
                          focusNode: _btnFocusNode,
                          onButtonPressed: () async {
                            _btnFocusNode.requestFocus();
                            if (_formKey.currentState!.validate()) {
                              await itemController
                                  .saveItem(
                                    itemName!,
                                    itemValue,
                                    subCategory!,
                                    slots,
                                    itemLevel,
                                  )
                                  .then((value) =>
                                      _formKey.currentState!.reset());
                            }
                          },
                          text: save,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: TextWithBorderComponent(
                text: registeredItems,
                textStyle: greenTheme.textTheme.displayMedium,
              ),
            ),
            Observer(
              builder: (BuildContext context) {
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Text(
                        itemController.items.elementAt(index).name);
                  },
                  itemCount: itemController.items.length,
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
