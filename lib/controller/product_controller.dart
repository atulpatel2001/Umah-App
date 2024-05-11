import 'package:get/get.dart';
import 'package:umah/helper/model_data/product_data.dart';
import 'package:umah/model/product.dart';
import 'package:umah/services/category_repo.dart';
import 'package:umah/services/product_repo.dart';

import '../model/category.dart';

/*
 *This Controller handle State of product in this code write crud operation methode
 */
class ProductController extends GetxController {
  //product observable list
  var products = <Product>[].obs;

  //category observable object
  Rx<Category?> category = Rx<Category?>(null);

  @override
  void onInit() {
    super.onInit();
    loadProduct();
  }

  /*
   * this methode use load all product or fetch all product
   *
   * parameter :- no parameter
   *
   * return:- void return type
   */
  void loadProduct() {
    try {
      List<Product> lists = getProductData();
      products.value = lists;
    } catch (e) {
      printInfo(info: e.toString());
    }
  }

  /*
   * get Products By Category Id
   *
   * Param:- Category Id
   *
   * Return:-void
   */
  void getProductByCategoryId(categoryId) {
    try {
      List<Product> lists = ProductRepo().getByCategoryId(categoryId);
      products.value = lists;
      getCategoryByCategoryId(categoryId);
      Get.toNamed("/list");
    } catch (e) {
      print(e);
    }
  }

  /*
   * get Category By Category Id
   *
   * Param:- Category Id
   *
   * Return:-void
   */

  void getCategoryByCategoryId(categoryId) {
    try {
      Category? category2 = CategoryRepo().getCategoryById(categoryId);
      category.value = category2;
    } catch (e) {
      print(e);
    }
  }
  // Method to load more products
  void fetchMoreProducts() {
    List<Product> additionalProducts = getProductData();
    products.addAll(additionalProducts);
  }


}
