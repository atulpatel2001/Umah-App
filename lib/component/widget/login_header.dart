import 'package:flutter/material.dart';

class LoginHeader extends StatelessWidget {
  final String title;

  LoginHeader({
    Key? key,
    required this.title,
  }) : super(key: key);

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 150,
      color: const Color(0xFFF4F8FF),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: Image.asset(
                  'assets/image/login-page-chair.png',
                  width: 318,
                  height: 318,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
