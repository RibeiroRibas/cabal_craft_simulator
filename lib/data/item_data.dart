import 'package:cabal_craft_simulator/data/category_data.dart';
import 'package:cabal_craft_simulator/data/sub_category_data.dart';
import 'package:cabal_craft_simulator/model/character.dart';
import 'package:cabal_craft_simulator/model/item.dart';


Item amuletOfPain6 = Item(
    name: 'Amuleto da dor',
    level: 6,
    character: [Character.all],
    category: [accessory],
    subCategory: amulet,
    prices: {DateTime.now(): 1500000000});

Item amuletOfPain5 = Item(
    name: 'Amuleto da dor',
    level: 5,
    character: [Character.all],
    category: [accessory],
    subCategory: amulet,
    prices: {DateTime.now(): 110000000});

Item amuletOfPain4 = Item(
    name: 'Amuleto da dor',
    level: 4,
    character: [Character.all],
    category: [accessory],
    subCategory: amulet,
    prices: {DateTime.now(): 20000000});

Item amuletOfPain3 = Item(
    name: 'Amuleto da dor',
    level: 3,
    character: [Character.all],
    category: [accessory],
    subCategory: amulet,
    prices: {DateTime.now(): 33900000});

Item amuletOfPain2 = Item(
    name: 'Amuleto da dor',
    level: 2,
    character: [Character.all],
    category: [accessory],
    subCategory: amulet,
    prices: {DateTime.now(): 10000000});

Item amuletOfPain1 = Item(
    name: 'Amuleto da dor',
    level: 1,
    character: [Character.all],
    category: [accessory],
    subCategory: amulet,
    prices: {DateTime.now(): 7000000});

Item katanaOsmio = Item(
    name: 'Katana de Ósmio',
    level: 0,
    slot: 2,
    character: [Character.forceBlade, Character.blade, Character.forceShield],
    category: [weapon],
    subCategory: katana,
    prices: {DateTime.now(): 200000});

Item cartridgeThree = Item(
    name: 'Cartucho',
    level: 3,
    category: [chloe],
    subCategory: cartridges,
    prices: {DateTime.now(): 65000});

Item cartridgeOne = Item(
    name: 'Cartucho',
    level: 1,
    category: [chloe],
    subCategory: cartridges,
    prices: {DateTime.now(): 10236});

Item cartridgeTwo = Item(
    name: 'Cartucho',
    level: 2,
    category: [chloe],
    subCategory: cartridges,
    prices: {DateTime.now(): 400});

Item jewelThree = Item(
    name: 'Circuito de Jóia',
    level: 3,
    category: [chloe],
    subCategory: jewel,
    prices: {DateTime.now(): 29777});

Item jewelFour = Item(
    name: 'Circuito de Jóia',
    level: 4,
    category: [chloe],
    subCategory: jewel,
    prices: {DateTime.now(): 138571});

Item jewelFive = Item(
    name: 'Circuito de Jóia',
    level: 5,
    category: [chloe],
    subCategory: jewel,
    prices: {DateTime.now(): 7559});

Item fruitParasite = Item(
    name: 'Frutinha Parasitada',
    category: [chloe],
    subCategory: dungeons,
    prices: {DateTime.now(): 545450});

Item darkDisc = Item(
    name: 'Disco da Escuridão',
    level: 3,
    category: [chloe],
    subCategory: discs,
    prices: {DateTime.now(): 39370});

Item sagradDisc = Item(
    name: 'Disco Sagrado',
    level: 1,
    category: [chloe],
    subCategory: discs,
    prices: {DateTime.now(): 400});

Item sagradDisc2 = Item(
    name: 'Disco Sagrado',
    level: 2,
    category: [chloe],
    subCategory: discs,
    prices: {DateTime.now(): 22716});

Item cristalEnhancement = Item(
    name: 'Núcleo de aprimoramento (Cristal)',
    category: [chloe],
    subCategory: basic,
    prices: {DateTime.now(): 45000});

Item amuletCraftsman = Item(
    name: 'Amuleto do artesão',
    level: 1,
    category: [accessory],
    subCategory: amulet,
    prices: {DateTime.now(): 1150000});

Item amuletCraftsman2 = Item(
    name: 'Amuleto do artesão',
    level: 2,
    category: [accessory],
    subCategory: amulet,
    prices: {DateTime.now(): 200000});

Item amuletCraftsman3 = Item(
    name: 'Amuleto do artesão',
    level: 3,
    category: [accessory],
    subCategory: amulet,
    prices: {DateTime.now(): 0});

Item amuletCraftsman4 = Item(
    name: 'Amuleto do artesão',
    level: 4,
    category: [accessory],
    subCategory: amulet,
    prices: {DateTime.now(): 0});

Item sienaOne = Item(
    name: 'Siena 1ss',
    category: [chloe],
    subCategory: dungeons,
    prices: {DateTime.now(): 1000000});

Item sienaTwo = Item(
    name: 'Siena 2ss',
    category: [chloe,favorites],
    subCategory: dungeons,
    prices: {DateTime.now(): 1755496});

Item unpolishedStone = Item(
    name: 'Pedra Bruta da Dimenção',
    category: [chloe],
    subCategory: basic,
    prices: {DateTime.now(): 100000});

Item t2Dg = Item(
    name: 'Templo esquecido 2ss',
    category: [chloe],
    subCategory: dungeons,
    prices: {DateTime.now(): 2630000});

Item beetleBark= Item(
    name: 'Casca de besouro',
    category: [chloe],
    subCategory: dungeons,
    prices: {DateTime.now(): 966000});

Item coreArcanePiece= Item(
    name: 'Núcleo arcano (pedaço)',
    category: [chloe],
    subCategory: basic,
    prices: {DateTime.now(): 3488});

Item coreArcane= Item(
    name: 'Núcleo arcano',
    category: [chloe],
    subCategory: basic,
    prices: {DateTime.now(): 130000});

Item coreArcaneCristal = Item(
    name: 'Núcleo arcano cristal',
    category: [chloe],
    subCategory: basic,
    prices: {DateTime.now(): 54530});

Item coreApriCristal = Item(
    name: 'Núcleo de aprimoramento cristal',
    category: [chloe],
    subCategory: basic,
    prices: {DateTime.now(): 40944});

Item quartceCoreAmetista = Item(
    name: 'Núcleo de quatzo ametisma',
    category: [chloe],
    subCategory: basic,
    prices: {DateTime.now(): 122307});

Item quartceCoreTopazio = Item(
    name: 'Núcleo de quatzo Topazio',
    category: [chloe],
    subCategory: basic,
    prices: {DateTime.now(): 197164});

Item quartceCoreSigmetal = Item(
    name: 'Núcleo de quatzo Sigmetal',
    category: [chloe],
    subCategory: basic,
    prices: {DateTime.now(): 590551});

List<Item> getAllItems = [
  amuletOfPain4,
  amuletOfPain3,
  amuletOfPain2,
  katanaOsmio,
  cartridgeThree,
  cartridgeOne,
  jewelThree,
  jewelFour,
  fruitParasite,
  darkDisc,
  sagradDisc,
  cristalEnhancement,
  amuletCraftsman,
  sienaOne,
  unpolishedStone,
  sienaTwo,
  t2Dg,
  beetleBark,
  coreArcanePiece,
  coreArcane,
  coreArcaneCristal,
  sagradDisc2,
  cartridgeTwo,
  jewelFive,
  amuletOfPain5,
  amuletOfPain6,
  quartceCoreAmetista,
  coreApriCristal,
  quartceCoreTopazio,
  quartceCoreSigmetal
];
