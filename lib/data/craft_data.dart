import 'package:cabal_craft_simulator/data/item_data.dart';
import 'package:cabal_craft_simulator/model/craft.dart';

Craft amuletPain4 = Craft(item: amuletOfPain4, materials: {
  amuletCraftsman: 9,
  cartridgeOne: 3,
  jewelFour: 15,
  sagradDisc: 15,
}, results: [
  amuletOfPain5,
  amuletOfPain4,
  amuletOfPain3,
  amuletOfPain2,
  amuletOfPain1,
]);

Craft amuletCraftsman1 = Craft(item: amuletCraftsman, materials: {
  cartridgeOne: 3,
  jewelThree: 15,
}, results: [
  amuletCraftsman,
  amuletCraftsman2,
  amuletCraftsman3,
  amuletCraftsman4
]);

Craft siena1 = Craft(item: sienaOne, materials: {
  fruitParasite: 1,
  unpolishedStone: 4,
}, results: [
  sienaOne
]);

List<Craft> getAllCrafts = [amuletPain4, amuletCraftsman1, siena1];
