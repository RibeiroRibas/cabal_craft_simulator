import 'package:cabal_craft_simulator/model/craft.dart';
import 'package:cabal_craft_simulator/modules/home_module/pages/craft_page/name_qtd_and_value_item.dart';
import 'package:cabal_craft_simulator/shared/green_theme.dart';
import 'package:cabal_craft_simulator/shared/theme_colors.dart';
import 'package:cabal_craft_simulator/shared/ui/text_with_border_component.dart';
import 'package:flutter/material.dart';

class CraftItemSection extends StatelessWidget {
  final Craft craft;

  const CraftItemSection({Key? key, required this.craft}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextWithBorderComponent(
            text: craft.item.buildItemName(),
            textStyle: greenTheme.textTheme.displayMedium,
          ),
        ),
        const Row(
          children: [
            Expanded(child: SizedBox()),
            Text("TOTAL \$"),
          ],
        ),
        const Divider(color: ThemeColors.division),
        ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return NameQtdAndValueItem(
              item: craft.materials.keys.elementAt(index),
              qtd: craft.materials.values.elementAt(index),
            );
          },
          itemCount: craft.materials.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(color: ThemeColors.division);
          },
        ),
      ],
    );
  }
}
