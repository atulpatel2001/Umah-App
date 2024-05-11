import 'package:hive/hive.dart';
part 'cart.g.dart';

@HiveType(typeId: 1)
class Cart {
  @HiveField(0)
  int? userId;
  @HiveField(1)
  int? productId;

  Cart({this.userId, this.productId});

  Cart.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['productId'] = this.productId;
    return data;
  }
}