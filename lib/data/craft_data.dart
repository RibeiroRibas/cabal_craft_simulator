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

Craft amuletPain5 = Craft(item: amuletOfPain5, materials: {
  amuletCraftsman2: 3,
  amuletOfPain4: 3,
  cartridgeTwo: 3,
  jewelFive: 24,
  sagradDisc2: 24,
}, results: [
  amuletOfPain6,
  amuletOfPain5,
  amuletOfPain4,
  amuletOfPain3,
  amuletOfPain2,
  amuletOfPain1,
  amuletCraftsman3
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

Craft siena2 = Craft(item: sienaTwo, materials: {
  fruitParasite: 1,
  unpolishedStone: 5,
}, results: [
  sienaTwo
]);

Craft t2 = Craft(item: t2Dg, materials: {
  beetleBark: 1,
  unpolishedStone: 6,
}, results: [
  t2Dg
]);

Craft crystalArcaneCore = Craft(item: coreArcaneCristal, materials: {
  coreArcane: 1,
  coreArcanePiece: 50,
}, results: [
  coreArcaneCristal
]);

Craft quartizeCoreSigmetal = Craft(item: quartceCoreSigmetal, materials: {
  quartceCoreTopazio: 30,
  coreApriCristal: 5,
}, results: [
  quartceCoreSigmetal
]);

List<Craft> getAllCrafts = [
  amuletPain4,
  amuletCraftsman1,
  siena1,
  siena2,
  t2,
  crystalArcaneCore,
  amuletPain5,
  quartizeCoreSigmetal
];
