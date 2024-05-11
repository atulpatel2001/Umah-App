import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umah/component/widget/wishlist/empty_data_component.dart';
import 'package:umah/controller/wishlist_controller.dart';

import '../../component/widget/main_page_component/app_bar.dart';
import '../../component/widget/main_page_component/bottom_bar.dart';
import '../../controller/login_controller.dart';
import '../../helper/snackbar_helper.dart';


class WishListScreen extends StatelessWidget {
  WishListScreen({super.key});

  final WishListController wishListController = Get.put(WishListController());
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white38),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  labelText: "Search your WishList",
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  SnackBarHelper().showSnackbar(
                      context, "Sorry! This Feature is not available yet.");
                },
              ),
              const SizedBox(height: 10),
             Text("${wishListController.products.length} products",style: const TextStyle(
               fontSize: 15,fontWeight: FontWeight.bold
             ),),
              
              const SizedBox(height: 10),
              Obx(() {
                if (wishListController.products.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.all(16),
                    child: GridView.builder(
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.65,
                      ),
                      itemCount: wishListController.products.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Container(

                          width: 165,
                          height: 500,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                                Radius.circular(12)),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  width: 165,
                                  height: 400,
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        wishListController.products[index].image
                                            .toString(),
                                        width: 165,
                                        height: 200,
                                        fit: BoxFit.fitHeight,
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: IconButton(
                                          icon: const Icon(Icons.bookmark),
                                          onPressed: () {
                                            wishListController.removeWishlistData(index,wishListController.products[index].productId);
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                    'Successfully Remove Product From Wishlist'),
                                              ),
                                            );
                                          },

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  SizedBox(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            wishListController.products[index]
                                                .productTitle.toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "\$${wishListController
                                                .products[index].price
                                                .toString()}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        0, 0, 3, 0),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.deepOrangeAccent,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        color: Colors.white,
                                        onPressed: () {

                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                        );
                      },
                    ),
                  );
                } else {
                   return emptyDataComponent("wishlist");

                }
              }),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }

}
