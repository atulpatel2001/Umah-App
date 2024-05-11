import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umah/controller/product_controller.dart';
import 'package:umah/helper/model_data/category_data.dart';
import 'package:umah/helper/model_data/room-data.dart';

import '../../component/widget/main_page_component/app_bar.dart';
import '../../component/widget/main_page_component/bottom_bar.dart';
import '../../helper/snackbar_helper.dart';

class DiscoverScreen extends StatelessWidget {
  DiscoverScreen({Key? key}) : super(key: key);
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    var rooms = getRoomData();
    var categories = getCategoryData();
    var roomLastData = getRoomLastData();
    return Scaffold(
      appBar: const TopAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white38),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  labelText: "Search",
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: TextButton(
                    onPressed: () {
                      Get.toNamed("/productscan");
                    },
                    child: const Icon(Icons.document_scanner_outlined),
                  ),
                ),
                onChanged: (value) {
                  SnackBarHelper().showSnackbar(
                      context, "Sorry! This Feature is not available yet.");
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Rooms",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 80, // Set a fixed height or adjust as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: rooms.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 2.0),
                      // Add spacing between items
                      child: GestureDetector(
                        onTap: () {
                          SnackBarHelper().showSnackbar(context,
                              "Sorry! This Feature is not available yet.");
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                rooms[index]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 80, // Set a fixed height or adjust as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: roomLastData.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 2.0),
                      // Add spacing between items
                      child: GestureDetector(
                        onTap: () {
                          SnackBarHelper().showSnackbar(context,
                              "Sorry! This Feature is not available yet.");
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                roomLastData[index]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: categories.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      productController
                          .getProductByCategoryId(categories[index].categoryId);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        // Set the background color here
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: Colors.black26,
                          width: 1.0,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        // Added padding for better spacing
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // Align leading content to the top
                          children: [
                            Expanded(
                              flex: 2, // Adjust flex values as needed
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    categories[index].categoryTitle.toString(),
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  Text(
                                    "$index products",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 10),
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                image: DecorationImage(
                                  image: AssetImage(
                                      categories[index].image.toString()),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
