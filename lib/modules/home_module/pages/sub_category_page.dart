import 'package:cabal_craft_simulator/model/category.dart';
import 'package:cabal_craft_simulator/modules/home_module/controllers/sub_category_controller.dart';
import 'package:cabal_craft_simulator/modules/home_module/pages/app_layout_base.dart';
import 'package:cabal_craft_simulator/modules/home_module/routes/home_rote_navigator.dart';
import 'package:cabal_craft_simulator/modules/home_module/routes/route_named.dart';
import 'package:cabal_craft_simulator/shared/green_theme.dart';
import 'package:cabal_craft_simulator/shared/i18n/messages.dart';
import 'package:cabal_craft_simulator/shared/ui/text_with_border_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SubCategoryPage extends StatefulWidget {
  final Category category;

  const SubCategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  State<SubCategoryPage> createState() => _SubCategoryPageState();
}

class _SubCategoryPageState extends State<SubCategoryPage> {
  late final SubCategoryController controller;
  late final HomeRouteNavigator navigator;

  @override
  void initState() {
    controller = Modular.get<SubCategoryController>();
    navigator = Modular.get<HomeRouteNavigator>();
    _findByCategory();
    super.initState();
  }

  Future _findByCategory() async {
    await controller.findByCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return AppLayoutBase(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                  itemCount: controller.subCategories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return OutlinedButton(
                      onPressed: () {
                        Map<String, dynamic> arguments = {
                          "subCategory":
                              controller.subCategories.elementAt(index),
                        };
                        navigator.goTo(
                          itemsRoute,
                          arguments,
                        );
                      },
                      child:
                          Text(controller.subCategories.elementAt(index).name),
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
