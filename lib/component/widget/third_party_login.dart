import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../helper/snackbar_helper.dart';

class ThirdPartyLogin extends StatelessWidget {


  const ThirdPartyLogin({
    super.key,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 1,
                    width: 100,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 10),
                  const Text("Or login With"),
                  const SizedBox(width: 10),
                  Container(
                    height: 1,
                    width: 100,
                    color: Colors.black,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  // color: Colors.grey[200],
                ),
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        SnackBarHelper().showSnackbar(context,
                            "Sorry! This Feature is not available yet.");
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          //border: Border.all(color: Colors.black26),
                          color: Colors.black26
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/image/google-logo.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        SnackBarHelper().showSnackbar(context,
                            "Sorry! This Feature is not available yet.");
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // border: Border.all(color: Colors.grey),
                            color: Colors.black26
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/image/apple-logo.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        SnackBarHelper().showSnackbar(context,
                            "Sorry! This Feature is not available yet.");
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          // border: Border.all(color: Colors.grey),
                            color: Colors.black26
                        ),
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          'assets/image/facebook-logo.png',
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              const SizedBox(height: 50),
              GestureDetector(
                child: RichText(
                  text: TextSpan(
                    text: 'Already Have an Account ? ',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'register',
                        style: const TextStyle(
                          color: Colors.deepOrangeAccent,
                          decoration: TextDecoration.underline,
                        ),


                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            SnackBarHelper().showSnackbar(context,
                                "Sorry! This Feature is not available yet.");
                          },
                      ),
                    ],
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
