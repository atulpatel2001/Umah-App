import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/navbar_controller.dart';

class BottomNavBar extends StatelessWidget {
  final NavBarController navBarController = Get.put(NavBarController());

  BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Obx(() => BottomNavigationBar(
        currentIndex: navBarController.selectedIndex.value,
        onTap: (index) => navBarController.onItemTapped(index),
        unselectedItemColor: Colors.deepOrangeAccent,
        selectedItemColor:Colors.grey ,
        items:  const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.grey),
            label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category,color: Colors.grey),
              label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark,color: Colors.grey),
              label: ''
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person,color: Colors.grey),
              label: ''
          ),
        ],
      )
      );

  }
}

