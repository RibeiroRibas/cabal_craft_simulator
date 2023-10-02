import 'package:cabal_craft_simulator/modules/home_module/models/craft_calculator.dart';
import 'package:cabal_craft_simulator/modules/home_module/pages/craft_page/name_and_value_component.dart';
import 'package:cabal_craft_simulator/shared/i18n/messages.dart';
import 'package:flutter/material.dart';

class NameAndValueSection extends StatelessWidget {
  final CraftCalculator craftCalculator;

  const NameAndValueSection({Key? key, required this.craftCalculator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NameAndValueComponent(
            description: totalInvestmentPurchasePrice,
            value: craftCalculator.totalInvestmentPurchase),
        NameAndValueComponent(
            description: totalInvestmentSalePrice,
            value: craftCalculator.totalInvestmentSale),
        NameAndValueComponent(
            description: totalCreatedPurchasePrice,
            value: craftCalculator.purchasePrice),
        NameAndValueComponent(
            description: totalCreatedSalePrice,
            value: craftCalculator.salePrice),
        NameAndValueComponent(
          description: finalGainPurchasePrice,
          value: craftCalculator.finalResultPurchase,
          isChangeColor: true,
        ),
        NameAndValueComponent(
            description: finalGainSalePrice,
            value: craftCalculator.finalResultSale,
            isChangeColor: true),
      ],
    );
  }
}
