import 'package:get/get.dart';
import 'package:umah/controller/product_controller.dart';
import 'package:umah/model/category.dart';

/*
 * navbar controller use for manage a nav bar routing  and also manage app bar routing
 */
class NavBarController extends GetxController {

  //bottom bar select page index
  var selectedIndex = 0.obs;

  //product controller for access product and perform operation
  ProductController productController = Get.put(ProductController());

  /*
   *this function use for get-current index  and routing in this page
   *
   *  parameter:- take current index of navbar
   *
   * return:- void return type
   */
  void onItemTapped(int index) {
    selectedIndex.value = index;
    switch (selectedIndex.value) {
      case 0:
        Get.offAllNamed('/mainPage');
        break;
      case 1:
        Get.offAllNamed('/discover');
        break;
      case 2:
        Get.offAllNamed('/wishList');

        break;
      case 3:
        //show all product
        productController.category.value = Category(
          categoryId: 0,
          categoryTitle: "ALL",
          description: "kkkfmfek",
          image: "assets/category/cabinet.png",
        );
        productController.loadProduct();
        Get.offAllNamed('/list');
        break;
    }
  }
}
