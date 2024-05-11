import '../helper/model_data/product_data.dart';
import '../model/product.dart';
/*
 *  Product Repository Put all the Database related function
 */

class ProductRepo {

  /*
   * Fetch Product Base on Category By ID
   *
   * Params:- Category Id
   * return: List<Product> Object | null
   */
  List<Product> getByCategoryId(int categoryId) {
    try {
      List<Product> products = getProductData()
          .where((product) => product.categoryId == categoryId)
          .toList();
      return products;
    } catch (e) {
      return [];
    }
  }
}
