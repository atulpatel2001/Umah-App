
class ValidationHelper{



  bool isValidEmail(String email) {
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(email);
  }

  bool isPasswordValid(String password){
    if (password.length < 8) {
      return false;
    }
    else if(password.length > 11){
      return false;
    }
    else{
      return true;
    }
  }


}