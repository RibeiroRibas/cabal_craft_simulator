import 'package:cabal_craft_simulator/data/category_data.dart';
import 'package:cabal_craft_simulator/model/sub_category.dart';

SubCategory amulet = SubCategory(
  name: "Amuleto",
  categories: [accessory],
);

SubCategory katana = SubCategory(
  name: "Katana",
  categories: [weapon],
);

SubCategory cartridges = SubCategory(
  name: "Cartuchos",
  categories: [chloe],
);

SubCategory dungeons = SubCategory(
  name: "Calabouços",
  categories: [chloe,favorites],
);

SubCategory discs = SubCategory(
  name: "Discos",
  categories: [chloe],
);

SubCategory basic = SubCategory(
  name: "Básico",
  categories: [chloe],
);

SubCategory jewel = SubCategory(
  name: "Jóia",
  categories: [chloe],
);

List<SubCategory> getAllSubCategories = [
  amulet,
  katana,
  cartridges,
  dungeons,
  discs,
  basic,
  jewel,
];
