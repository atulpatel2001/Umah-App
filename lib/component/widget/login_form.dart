import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umah/controller/login_controller.dart';
import 'package:umah/helper/snackbar_helper.dart';
import 'package:umah/helper/validation_helper.dart';
import 'package:umah/screen/MainScreen/main_page.dart';

class LoginForm extends StatelessWidget {
  LoginForm({Key? key}) : super(key: key);

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  final LoginController loginController = Get.put(LoginController());
  String? email;
  String? password;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        constraints: const BoxConstraints(
          minWidth: 343,
          minHeight: 236,
        ),
        margin: const EdgeInsets.only(top: 20, left: 16),
        child: Form(
          key: loginKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  hintText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Add border radius
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!ValidationHelper().isValidEmail(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value;
                },
              ),
              const SizedBox(height: 24),
              Obx(() => TextFormField(
                    obscureText: !loginController.isPasswordVisible.value,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(loginController.isPasswordVisible.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          loginController.togglePasswordVisibility();
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }

                      return null;
                    },
                    onSaved: (value) {
                      password = value;
                    },
                  )),
              const SizedBox(height: 24),
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (newValue) {},
                  ),
                  const Text('Remember me'),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      SnackBarHelper().showSnackbar(
                          context, "Sorry! This Feature is not available yet.");
                    },
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.deepOrangeAccent,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (loginKey.currentState!.validate()) {
                      loginKey.currentState?.save();
                      await loginController.handleLoginData(email, password);
                      if (!loginController.isSuccess.value) {
                        SnackBarHelper().showSnackbar(
                             context,
                          "Please enter valid email and password.",
                        );
                      } else {
                        // Login successful, navigate to main page
                        Get.offAll(MainPage());
                      }
                      loginKey.currentState?.reset();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
