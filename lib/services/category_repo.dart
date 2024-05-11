
import '../helper/model_data/category_data.dart';
import '../model/category.dart';


/*
 *  Category Repository Put all the Database related function
 */
class CategoryRepo{

  /*
   * Fetch Category By ID
   *
   * Params:- Category Id
   * return: Category Object | null
   */
  Category? getCategoryById(int categoryId) {
    try {

      Category category = getCategoryData().firstWhere((category) => category.categoryId == categoryId);
      return category;
    } catch (e) {
      print(e);
      return null;
    }
  }
}