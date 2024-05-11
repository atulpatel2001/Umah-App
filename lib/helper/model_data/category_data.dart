import '../../model/category.dart';

List<Category> getCategoryData() {
  return [
    Category(
      categoryId: 1,
      categoryTitle: "Chair",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.",
      image: "assets/category/chair.png",
      imageIcon: "assets/category_icons/Chair.png",
    ),
    Category(
      categoryId: 2,
      categoryTitle: "Table",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.",
      image: "assets/category/table.png",
      imageIcon: "assets/category_icons/Table.png",
    ),
    Category(
      categoryId: 3,
      categoryTitle: "Lamp",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.",
      image: "assets/category/lamp.png",
      imageIcon: "assets/category_icons/Lamp.png",

    ),
    Category(
      categoryId: 4,
      categoryTitle: "Sofa",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.",
      image: "assets/category/sofa.png",
      imageIcon: "assets/category_icons/Sofa.png",
    ),
    Category(
      categoryId: 5,
      categoryTitle: "Cabinet",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.",
      image: "assets/category/cabinet.png",
      imageIcon: "assets/category_icons/Cabinet.png",
    ),
    Category(
      categoryId: 6,
      categoryTitle: "Wardrobe",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod.",
      image: "assets/category/wordrobe.png",
      imageIcon: "assets/category_icons/Wardrobe.png",
    ),
  ];
}
