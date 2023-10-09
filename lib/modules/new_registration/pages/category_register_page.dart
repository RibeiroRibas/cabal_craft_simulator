import 'package:cabal_craft_simulator/modules/home_module/controllers/category_controller.dart';
import 'package:cabal_craft_simulator/modules/home_module/pages/app_layout_base.dart';
import 'package:cabal_craft_simulator/modules/new_registration/new_registration_rote_navigator.dart';
import 'package:cabal_craft_simulator/shared/green_theme.dart';
import 'package:cabal_craft_simulator/shared/i18n/messages.dart';
import 'package:cabal_craft_simulator/shared/ui/elevated_button_component.dart';
import 'package:cabal_craft_simulator/shared/ui/outlined_text_field_component.dart';
import 'package:cabal_craft_simulator/shared/ui/text_with_border_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoryRegisterPage extends StatefulWidget {
  const CategoryRegisterPage({Key? key}) : super(key: key);

  @override
  State<CategoryRegisterPage> createState() => _CategoryRegisterPageState();
}

class _CategoryRegisterPageState extends State<CategoryRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _focusNode = FocusNode();
  late final TextEditingController _textController;
  late final CategoryController controller;
  late final NewRegistrationRouteNavigator navigator;
  String? categoryName;

  @override
  void initState() {
    _textController = TextEditingController();
    controller = Modular.get<CategoryController>();
    navigator = Modular.get<NewRegistrationRouteNavigator>();
    _findAllCategories();
    super.initState();
  }

  Future _findAllCategories() async {
    await controller.findAllCategories();
  }

  bool categoryNameAlreadyExist(String name) {
    return controller.categories.any((category) {
      String categoryName = name;
      return category.name.toLowerCase() ==
          categoryName.trimLeft().trimRight().toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppLayoutBase(
      isShowFabButton: false,
      backButton: false,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: TextWithBorderComponent(
                text: newCategory,
                textStyle: greenTheme.textTheme.displayMedium,
              ),
            ),
            Row(
              children: [
                Form(
                  key: _formKey,
                  child: Expanded(
                    child: OutlinedTextFieldComponent(
                      focusNode: _focusNode,
                      autoFocus: false,
                      controller: _textController,
                      validator: (String? value) =>
                          value == null || value.isEmpty
                              ? requiredField
                              : categoryNameAlreadyExist(value)
                                  ? categoryAlreadyExist
                                  : null,
                      labelText: inputCategoryName,
                      onChanged: (String value) {
                        categoryName = value;
                        _formKey.currentState!.validate();
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.25,
                  child: ElevatedButtonComponent(
                    onButtonPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.saveCategory(categoryName!);
                        _textController.clear();
                        _focusNode.unfocus();
                      }
                    },
                    text: save,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: TextWithBorderComponent(
                text: registeredCategories,
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
                  itemCount: controller.categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return OutlinedButton(
                      onPressed: () {},
                      child: Text(controller.categories.elementAt(index).name),
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
