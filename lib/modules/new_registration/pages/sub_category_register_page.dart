import 'package:cabal_craft_simulator/model/category.dart';
import 'package:cabal_craft_simulator/modules/home_module/controllers/category_controller.dart';
import 'package:cabal_craft_simulator/modules/home_module/controllers/sub_category_controller.dart';
import 'package:cabal_craft_simulator/modules/home_module/pages/app_layout_base.dart';
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

class SubCategoryRegisterPage extends StatefulWidget {
  const SubCategoryRegisterPage({Key? key}) : super(key: key);

  @override
  State<SubCategoryRegisterPage> createState() =>
      _SubCategoryRegisterPageState();
}

class _SubCategoryRegisterPageState extends State<SubCategoryRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  late final SubCategoryController subCategoryController;
  late final CategoryController categoryController;
  late final NewRegistrationRouteNavigator navigator;
  String? subCategoryName;
  Category? category;

  @override
  void initState() {
    subCategoryController = Modular.get<SubCategoryController>();
    categoryController = Modular.get<CategoryController>();
    navigator = Modular.get<NewRegistrationRouteNavigator>();
    _findAllCategories();
    _findAllSubCategories();
    super.initState();
  }

  Future _findAllCategories() async {
    await categoryController.findAllCategories();
  }

  Future _findAllSubCategories() async {
    await subCategoryController.findAllSubCategories();
  }

  bool subCategoryNameAlreadyExist(String name) {
    return subCategoryController.subCategories.any((category) {
      String categoryName = name;
      return category.name.toLowerCase() ==
          categoryName.trimLeft().trimRight().toLowerCase();
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
                text: newSubCategory,
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
                        subCategoryController.addSelectedCategory(category);
                        _formKey.currentState!.validate();
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
                        return Text(subCategoryController.selectedCategories
                            .elementAt(index)
                            .name);
                      },
                      itemCount:
                          subCategoryController.selectedCategories.length,
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
                          focusNode: _focusNode,
                          autoFocus: false,
                          validator: (String? value) =>
                              value == null || value.isEmpty
                                  ? requiredField
                                  : subCategoryNameAlreadyExist(value)
                                      ? subCategoryAlreadyExist
                                      : null,
                          labelText: inputSubCategoryName,
                          onChanged: (value) {
                            subCategoryName = value;
                            _formKey.currentState!.validate();
                          },
                        ),
                      ),
                      const SizedBox(width: 20),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.25,
                        child: ElevatedButtonComponent(
                          onButtonPressed: () {
                            if (_formKey.currentState!.validate()) {
                              subCategoryController
                                  .saveSubCategory(subCategoryName!);
                              if (_focusNode.hasFocus) {
                                _focusNode.unfocus();
                              }
                              _formKey.currentState!.reset();
                            } else {
                              _focusNode.unfocus();
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
                text: registeredSubCategories,
                textStyle: greenTheme.textTheme.displayMedium,
              ),
            ),
            Observer(
              builder: (BuildContext context) {
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4.5,
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 4.0,
                  ),
                  itemCount: subCategoryController.subCategories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return OutlinedButton(
                      onPressed: () {},
                      child: Text(subCategoryController.subCategories
                          .elementAt(index)
                          .name),
                    );
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
