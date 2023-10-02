import 'package:cabal_craft_simulator/data/category_data.dart';
import 'package:cabal_craft_simulator/model/category.dart';
import 'package:cabal_craft_simulator/model/sub_category.dart';

SubCategory amulet = SubCategory(
  name: "Amuleto",
  category: accessory,
);

SubCategory katana = SubCategory(
  name: "Katana",
  category: weapon,
);

SubCategory cartridges = SubCategory(
  name: "Cartuchos",
  category: chloe,
);

SubCategory dungeons = SubCategory(
  name: "Calabouços",
  category: chloe,
);

SubCategory discs = SubCategory(
  name: "Discos",
  category: chloe,
);

SubCategory basic = SubCategory(
  name: "Básico",
  category: craft,
);

SubCategory jewel = SubCategory(
  name: "Jóia",
  category: craft,
);

List<SubCategory> getAllCategories = [
  amulet,
  katana,
  cartridges,
  dungeons,
  discs,
  basic,
  jewel,
];
