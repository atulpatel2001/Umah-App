import 'package:hive/hive.dart';

import '../model/wishlist.dart';

/*
 *  WishList Repository Put all the Database related function
 */
class WishListRepo {


  //open hive database box
  var box = Hive.box("wishlist");

  /*
   *
   * this function is use for Add  Wishlist in hive database
   *
   * Parameter:- Wishlist
   *
   * return type:-void data
   */

  void addToWishList(WishList wishList) {
    try {
      box.add(wishList);
    } catch (e) {
      print(e);
    }
  }

  /*
   *
   * this function is use for load wishlist from  in hive database
   *
   * Parameter:- void
   *
   * return type:-List<Wishlist> object ,if wishlist is not present so return null list
   */

  List<WishList> loadAllWishList() {
    try {
      List<WishList> list = box.values.cast<WishList>().toList();
      return list;
    } catch (e) {
      print(e);
      return [];
    }
  }

  /*
   *
   * this function is use for delete wishlist from  in hive database
   *
   * Parameter:- index of wishlist
   *
   * return type:-void
   */

  void deleteWishlist(index) {
    try {
      box.deleteAt(index);
    } catch (e) {
      print(e);
    }
  }


  // Find wishlist items by user ID
  List<WishList> findWishlistByUserId(String userId) {
    try {
      List<WishList> wishlistByUserId = [];
      for (var item in box.values) {
        if (item.userId == userId) {
          wishlistByUserId.add(item);
        }
      }
      return wishlistByUserId;
    } catch (e) {
      print(e);
      return [];
    }
  }


  void deleteWishlistByUserIdAndProductId( userId,  productId) {
    try {
      int index = box.values.toList().indexWhere((item) =>
      item.userId == userId && item.productId == productId);
      if (index != -1) {
        box.deleteAt(index);
      } else {
        print("Wishlist entry not found for user ID: $userId and product ID: $productId");
      }
    } catch (e) {
      print(e);
    }
  }
}
