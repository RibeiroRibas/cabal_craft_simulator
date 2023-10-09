import 'package:cabal_craft_simulator/modules/home_module/controllers/category_controller.dart';
import 'package:cabal_craft_simulator/modules/home_module/pages/app_layout_base.dart';
import 'package:cabal_craft_simulator/modules/home_module/routes/home_rote_navigator.dart';
import 'package:cabal_craft_simulator/modules/home_module/routes/route_named.dart';
import 'package:cabal_craft_simulator/shared/green_theme.dart';
import 'package:cabal_craft_simulator/shared/i18n/messages.dart';
import 'package:cabal_craft_simulator/shared/ui/text_with_border_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  late final CategoryController controller;
  late final HomeRouteNavigator navigator;

  @override
  void initState() {
    controller = Modular.get<CategoryController>();
    navigator = Modular.get<HomeRouteNavigator>();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _findAllCategories();
    super.didChangeDependencies();
  }

  Future _findAllCategories() async {
    await controller.findAllCategories();
  }

  @override
  Widget build(BuildContext context) {
    return AppLayoutBase(
      backButton: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: TextWithBorderComponent(
              text: selectACategory,
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
                    onPressed: () {
                      Map<String, dynamic> arguments = {
                        "category": controller.categories.elementAt(index),
                      };
                      navigator.goTo(
                        subCategoryRoute,
                        arguments,
                      );
                    },
                    child: Text(controller.categories.elementAt(index).name),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
