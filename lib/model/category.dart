// class Category {
//   int? categoryId;
//   String? categoryTitle;
//   String? description;
//   String? image;
//
//   Category({this.categoryId, this.categoryTitle, this.description, this.image});
//
//   Category.fromJson(Map<String, dynamic> json) {
//     categoryId = json['categoryId'];
//     categoryTitle = json['categoryTitle'];
//     description = json['description'];
//     image = json['image'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['categoryId'] = this.categoryId;
//     data['categoryTitle'] = this.categoryTitle;
//     data['description'] = this.description;
//     data['image'] = this.image;
//     return data;
//   }
// }


class Category {
  int? categoryId;
  String? categoryTitle;
  String? description;
  String? image;
  String? imageIcon;

  Category(
      {this.categoryId,
        this.categoryTitle,
        this.description,
        this.image,
        this.imageIcon});

  Category.fromJson(Map<String, dynamic> json) {
    categoryId = json['categoryId'];
    categoryTitle = json['categoryTitle'];
    description = json['description'];
    image = json['image'];
    imageIcon = json['imageIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['categoryTitle'] = this.categoryTitle;
    data['description'] = this.description;
    data['image'] = this.image;
    data['imageIcon'] = this.imageIcon;
    return data;
  }
}
