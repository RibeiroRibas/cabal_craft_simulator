import 'package:cabal_craft_simulator/model/item.dart';
import 'package:cabal_craft_simulator/shared/util/format_text_util.dart';
import 'package:flutter/material.dart';

class NameQtdAndValueItem extends StatelessWidget {
  final Item item;
  final int qtd;

  const NameQtdAndValueItem({Key? key, required this.item, required this.qtd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(item.buildItemName()),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('x $qtd'),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                FormatTextUtil.convertToCabalCoin(
                  item.calculateTotalInvestment(qtd),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
