import 'package:get/get.dart';

import '../helper/model_data/category_data.dart';
import '../model/category.dart';

/*
 *This Controller handle State of category in this code write crud operation methode
 */
class CategoryController extends GetxController {
  //category observable list
  var categories = <Category>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadCategory();
  }

  /*
   * this methode use load all category or fetch all category
   *
   * parameter :- no parameter
   *
   * return:- void return type
   */
  void loadCategory() {
    try {
      List<Category> lists = getCategoryData();
      categories.value = lists;
    } catch (e) {
      printInfo(info: e.toString());
    }
  }
}
