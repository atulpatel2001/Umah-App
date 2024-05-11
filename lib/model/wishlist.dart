import 'package:hive/hive.dart';
part 'wishlist.g.dart';

@HiveType(typeId: 0)
class WishList {
  @HiveField(0)
  int? userId;
  @HiveField(1)
  int? productId;

  WishList({ this.userId, this.productId});

  WishList.fromJson(Map<String, dynamic> json) {
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
