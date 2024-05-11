import 'package:get/get.dart';
import 'package:umah/model/user.dart';
import 'package:umah/services/user_repo.dart';

/*
 *
 * this  login controller use for manage login user for manage session
 */
class LoginController extends GetxController {
  //this is login user object
  Rx<User?> loginUser = Rx<User?>(null);

  //password visible variable inform
  var isPasswordVisible = false.obs;

  //login is success
  var isSuccess = false.obs;

  /*
   *password visibility update
   */
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /*
   *handle login data and check user is valid or not
   *
   * @parameter:- ema
   * ilid , password
   *
   * @return :- it is future return type
   */
  Future<void> handleLoginData(email, password) async {
    try {
      User? user = UserRepo().findUserByEmailAndPassword(email, password);
      if (user != null) {
        loginUser.value = user;
        isSuccess.value = true;
      } else {
        isSuccess.value = false;
      }
    } catch (e) {
      print(e);
      isSuccess.value = false;
    }
  }
}

