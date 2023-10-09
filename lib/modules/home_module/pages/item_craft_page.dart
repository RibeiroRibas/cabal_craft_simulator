import 'package:cabal_craft_simulator/model/category.dart';
import 'package:cabal_craft_simulator/model/sub_category.dart';
import 'package:cabal_craft_simulator/modules/home_module/controllers/item_craft_controller.dart';
import 'package:cabal_craft_simulator/modules/home_module/pages/app_layout_base.dart';
import 'package:cabal_craft_simulator/modules/home_module/routes/home_rote_navigator.dart';
import 'package:cabal_craft_simulator/modules/home_module/routes/route_named.dart';
import 'package:cabal_craft_simulator/shared/green_theme.dart';
import 'package:cabal_craft_simulator/shared/i18n/messages.dart';
import 'package:cabal_craft_simulator/shared/ui/text_with_border_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ItemCraftPage extends StatefulWidget {
  final SubCategory subCategory;
  final Category category;

  const ItemCraftPage(
      {Key? key, required this.subCategory, required this.category})
      : super(key: key);

  @override
  State<ItemCraftPage> createState() => _ItemCraftPageState();
}

class _ItemCraftPageState extends State<ItemCraftPage> {
  late final ItemCraftController controller;
  late final HomeRouteNavigator navigator;

  @override
  void initState() {
    controller = Modular.get<ItemCraftController>();
    navigator = Modular.get<HomeRouteNavigator>();
    _findBySubCategory();
    super.initState();
  }

  Future _findBySubCategory() async {
    await controller.findBySubCategoryAndCategory(widget.subCategory,widget.category);
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
                text: selectAnItemToCraft,
                textStyle: greenTheme.textTheme.displayMedium,
              ),
            ),
            Observer(
              builder: (BuildContext context) {
                return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 4.5,
                      mainAxisSpacing: 12.0,
                      crossAxisSpacing: 4.0,
                    ),
                    itemCount: controller.itemsToCraft.length,
                    itemBuilder: (BuildContext context, int index) {
                      return OutlinedButton(
                        onPressed: () {
                          Map<String, dynamic> arguments = {
                            "craft": controller.itemsToCraft.elementAt(index),
                          };
                          navigator.goTo(
                            craftRoute,
                            arguments,
                          );
                        },
                        child: Text(
                          controller.itemsToCraft
                              .elementAt(index)
                              .item
                              .buildItemName(),
                          textAlign: TextAlign.center,
                        ),
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
