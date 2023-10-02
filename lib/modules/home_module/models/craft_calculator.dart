import 'package:cabal_craft_simulator/model/craft.dart';
import 'package:cabal_craft_simulator/model/item.dart';

class CraftCalculator {
  int totalInvestmentPurchase = 0;
  int totalInvestmentSale = 0;
  int purchasePrice = 0;
  int salePrice = 0;
  int finalResultPurchase = 0;
  int finalResultSale = 0;

  CraftCalculator();

  CraftCalculator.calculate(
      Craft craft, List<Map<Item, int>> craftResult, int qtd) {
    craft.materials.forEach((key, value) {
      int result = key.prices.values.last * value;
      totalInvestmentPurchase += result;
    });
    int auctionFee = ((totalInvestmentPurchase * 9) / 100).round();
    totalInvestmentSale =  totalInvestmentPurchase - auctionFee;
    totalInvestmentPurchase *= qtd;
    totalInvestmentSale *= qtd;
    for (var element in craftResult) {
      int result = element.keys.first.prices.values.last * element.values.first;
      purchasePrice += result;
    }
    auctionFee = ((purchasePrice * 9) / 100).round();
    salePrice = purchasePrice - auctionFee;
    finalResultPurchase = purchasePrice - totalInvestmentPurchase;
    finalResultSale = salePrice - totalInvestmentSale;
  }
}
