import 'package:hive/hive.dart';
import 'package:umah/model/cart.dart';

class CartRepo{
  //open hive database box
  var box = Hive.box("cart");

  /*
   * add Cart Data in Hive Database
   *
   * Params: Cart Object
   * Returns: Null
   */
  void addCartData(Cart cart) {
    try {
      box.add(cart);
    } catch (e) {
      print(e);
    }
  }


  /*
   * Fetch Cart By User Id
   *
   * Params: User Id
   * Returns: List<Cart> Object | Null
   */
  List<Cart> findCartByUserId(userId) {
    try {
      List<Cart> cartByUserId = [];
      for (var item in box.values) {
        if (item.userId == userId) {
          cartByUserId.add(item);
        }
      }
      return cartByUserId;
    } catch (e) {
      return [];
    }
  }


  /*
   * Delete Cart By User Id And Product Id
   *
   * Params: User Id  | Product Id
   * Returns:  Null
   */
  void deleteCartByUserIdAndProductId(userId,productId) {
    try {
      int index = box.values.toList().indexWhere((item) =>
      item.userId == userId && item.productId == productId);
      if (index != -1) {
        box.deleteAt(index);
      } else {
        print("Cart entry not found for user ID: $userId and product ID: $productId");
      }
    } catch (e) {
      print(e);
    }
  }

}