import 'package:get/get.dart';
import 'package:umah/services/cart_repo.dart';

import '../helper/model_data/product_data.dart';
import '../model/cart.dart';
import '../model/product.dart';
import 'login_controller.dart';
/*
 *This Controller handle State of Cart in this code write crud operation methode
 */
class CartController extends GetxController{
  //Cart observable list
  var carts = <Cart>[].obs;

  //product observable list
  var products = <Product>[].obs;

  var incrementProduct=0.obs;



  //Login controller for access Login User Data and perform operation
  final LoginController loginController = Get.put(LoginController());



  @override
  void onInit() {
    super.onInit();
    CartRepo().findCartByUserId(loginController.loginUser.value?.userId);
    getAllProductInCarts(loginController.loginUser.value?.userId);
  }


  void increaseProductQuantity(){
    if(incrementProduct.value < 0 ){
      incrementProduct.value=0;
    }
    incrementProduct.value+=1;
  }
  void decreaseProductQuantity(){
    incrementProduct.value-=1;
  }

  /*
   * This methode for fetch all products by product id from carts
   *
   * Params: userId
   * Returns: Null
   */
  void getAllProductInCarts(userId) {
    try {
      var productIds = carts.map((cart) => cart.productId).toSet();
      var userProducts = getProductData()
          .where((product) => productIds.contains(product.productId))
          .toList();

      products.value = userProducts;
    } catch (e) {
      print(e);
    }
  }

  void addCart(Cart cart) {
    try {
      CartRepo().addCartData(cart);
     carts.add(cart);
      getAllProductInCarts(loginController.loginUser.value?.userId);
    } catch (e) {
      print(e);
    }
  }


}