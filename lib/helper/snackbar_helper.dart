import 'package:flutter/material.dart';

class SnackBarHelper{
  void showSnackbar(BuildContext context,String text) {
     var snackBar = SnackBar(
      backgroundColor:const Color(0xFFFF4081),
      content: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color:Colors.white,
          ),
          const SizedBox(width: 12),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}