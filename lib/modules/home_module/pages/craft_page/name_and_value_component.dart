import 'package:cabal_craft_simulator/shared/green_theme.dart';
import 'package:cabal_craft_simulator/shared/theme_colors.dart';
import 'package:cabal_craft_simulator/shared/util/format_text_util.dart';
import 'package:flutter/material.dart';

class NameAndValueComponent extends StatelessWidget {
  final String description;
  final int value;
  final bool isChangeColor;

  const NameAndValueComponent(
      {Key? key,
      required this.description,
      required this.value,
      this.isChangeColor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Text(description)),
            Text(
              FormatTextUtil.convertToCabalCoin(value),
              style: TextStyle(
                  color: isChangeColor ?
                  value < 0 ? ThemeColors.red : greenTheme.primaryColor : null),
            ),
          ],
        ),
        const Divider(color: ThemeColors.division),
      ],
    );
  }
}
