class Product {
  int? productId;
  int? categoryId;
  String? productTitle;
  String? description;
  int? price;
  String? color;
  String? image;

  Product(
      {this.productId,
        this.categoryId,
        this.productTitle,
        this.description,
        this.price,
        this.color,
        this.image});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    categoryId = json['categoryId'];
    productTitle = json['productTitle'];
    description = json['description'];
    price = json['price'];
    color = json['color'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['categoryId'] = this.categoryId;
    data['productTitle'] = this.productTitle;
    data['description'] = this.description;
    data['price'] = this.price;
    data['color'] = this.color;
    data['image'] = this.image;
    return data;
  }
}