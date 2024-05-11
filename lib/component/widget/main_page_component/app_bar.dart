import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false, // To remove the back arrow button
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1),
        // Adjust the padding as needed
        child: Align(
          alignment: Alignment.centerLeft, // Align the title to the left
          child: Image.asset(
            'assets/image/mainPage_umah.png',
            width: 100,
            height: 22,
            fit: BoxFit.contain, // Adjust the fit as needed
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          // Adjust the padding as needed
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black.withOpacity(0.2),
                width: 1,
              ),

              borderRadius: BorderRadius.circular(10), // Border radius
            ),
            child: IconButton(
              icon: Stack(
                children: [
                  const Icon(Icons.shopping_cart, size: 30),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: const Icon(Icons.notifications_none,
                          size: 10,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                Get.toNamed('/vouchersList');

              Get.offAllNamed("/cart");

              },
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
