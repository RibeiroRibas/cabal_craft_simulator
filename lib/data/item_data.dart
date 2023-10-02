import 'package:cabal_craft_simulator/data/category_data.dart';
import 'package:cabal_craft_simulator/data/sub_category_data.dart';
import 'package:cabal_craft_simulator/model/character.dart';
import 'package:cabal_craft_simulator/model/item.dart';

Item amuletOfPain5 = Item(
    name: 'Amuleto da dor',
    level: 5,
    character: [Character.all],
    category: accessory,
    subCategory: amulet,
    prices: {DateTime.now(): 200000000});

Item amuletOfPain4 = Item(
    name: 'Amuleto da dor',
    level: 4,
    character: [Character.all],
    category: accessory,
    subCategory: amulet,
    prices: {DateTime.now(): 50000000});

Item amuletOfPain3 = Item(
    name: 'Amuleto da dor',
    level: 3,
    character: [Character.all],
    category: accessory,
    subCategory: amulet,
    prices: {DateTime.now(): 100000000});

Item amuletOfPain2 = Item(
    name: 'Amuleto da dor',
    level: 2,
    character: [Character.all],
    category: accessory,
    subCategory: amulet,
    prices: {DateTime.now(): 10000000});

Item amuletOfPain1 = Item(
    name: 'Amuleto da dor',
    level: 1,
    character: [Character.all],
    category: accessory,
    subCategory: amulet,
    prices: {DateTime.now(): 25000000});

Item katanaOsmio = Item(
    name: 'Katana de Ósmio',
    level: 0,
    slot: 2,
    character: [Character.forceBlade, Character.blade, Character.forceShield],
    category: weapon,
    subCategory: katana,
    prices: {DateTime.now(): 200000});

Item cartridgeThree = Item(
    name: 'Cartucho',
    level: 3,
    category: craft,
    subCategory: cartridges,
    prices: {DateTime.now(): 65000});

Item cartridgeOne = Item(
    name: 'Cartucho',
    level: 1,
    category: craft,
    subCategory: cartridges,
    prices: {DateTime.now(): 400});

Item jewelThree = Item(
    name: 'Circuito de Jóia',
    level: 3,
    category: craft,
    subCategory: jewel,
    prices: {DateTime.now(): 29777});

Item jewelFour = Item(
    name: 'Circuito de Jóia',
    level: 4,
    category: craft,
    subCategory: jewel,
    prices: {DateTime.now(): 138571});

Item fruitParasite = Item(
    name: 'Frutinha Parasitada',
    category: craft,
    subCategory: dungeons,
    prices: {DateTime.now(): 400000});

Item darkDisc = Item(
    name: 'Disco da Escuridão',
    level: 3,
    category: craft,
    subCategory: discs,
    prices: {DateTime.now(): 39370});

Item sagradDisc = Item(
    name: 'Disco Sagrado',
    level: 1,
    category: craft,
    subCategory: discs,
    prices: {DateTime.now(): 400});

Item cristalEnhancement = Item(
    name: 'Núcleo de aprimoramento (Cristal)',
    category: craft,
    subCategory: basic,
    prices: {DateTime.now(): 45000});

Item amuletCraftsman = Item(
    name: 'Amuleto do artesão',
    level: 1,
    category: accessory,
    subCategory: amulet,
    prices: {DateTime.now(): 1500000});

Item amuletCraftsman2 = Item(
    name: 'Amuleto do artesão',
    level: 2,
    category: accessory,
    subCategory: amulet,
    prices: {DateTime.now(): 200000});

Item amuletCraftsman3 = Item(
    name: 'Amuleto do artesão',
    level: 3,
    category: accessory,
    subCategory: amulet,
    prices: {DateTime.now(): 0});

Item amuletCraftsman4 = Item(
    name: 'Amuleto do artesão',
    level: 4,
    category: accessory,
    subCategory: amulet,
    prices: {DateTime.now(): 0});

Item sienaOne = Item(
    name: 'Siena 1ss',
    category: chloe,
    subCategory: dungeons,
    prices: {DateTime.now(): 1000000});

Item unpolishedStone = Item(
    name: 'Pedra Bruta da Dimenção',
    category: craft,
    subCategory: basic,
    prices: {DateTime.now(): 100000});

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
];
