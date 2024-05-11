import '../helper/model_data/user_data.dart';
import '../model/user.dart';
/*
 *  User Repository Put all the Database related function
 */

class UserRepo{


  /*
   *
   * this function is use for get User  Data By email and password
   *
   * Parameter:- email id ,password
   *
   * return type:-User object ,if user is not present so return null
   */
  User? findUserByEmailAndPassword(String email, String password) {
    List<User> userList = getUserData();
    for (User user in userList) {
      if (user.emailId == email && user.password == password) {
        return user;
      }
    }
    return null;
  }


}