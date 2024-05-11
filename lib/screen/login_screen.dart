import 'package:flutter/material.dart';
import 'package:umah/component/widget/login_header.dart';

import '../component/widget/login_form.dart';
import '../component/widget/third_party_login.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: const Color(0xFFF4F8FF),
      ),
      body: Column(
        children: [
          Flexible(
            child: LoginHeader(
              title: 'Welcome to\nUMAH!',
            ),
          ),
          LoginForm(),

          const Flexible(
            child: ThirdPartyLogin(),

          ),
        ],
      ),

    );
  }
}