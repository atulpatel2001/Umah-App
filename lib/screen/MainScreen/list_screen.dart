import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umah/component/widget/wishlist/empty_data_component.dart';
import 'package:umah/controller/wishlist_controller.dart';
import 'package:umah/model/cart.dart';
import 'package:umah/model/wishlist.dart';

import '../../controller/cart_controlller.dart';
import '../../controller/login_controller.dart';
import '../../controller/product_controller.dart';
import '../../model/category.dart';

class ListScreen extends StatelessWidget {
  ListScreen({Key? key}) : super(key: key);
  final WishListController wishListController = Get.put(WishListController());
  final LoginController loginController = Get.put(LoginController());

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());
    final CartController cartController = Get.put(CartController());
    // Function to load more products
    void loadMoreProducts() {
      productController.fetchMoreProducts();
    }

    // Flag to indicate whether more products are being loaded
    bool isLoadingMore = false;

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent &&
          !isLoadingMore) {
        isLoadingMore = true; // Set flag to true when loading more products
        Future.delayed(const Duration(seconds: 1), () {
          loadMoreProducts();
          isLoadingMore = false; // Reset flag when loading is complete
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black.withOpacity(0.2),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            icon: const Stack(
              children: [
                Icon(Icons.arrow_back, size: 30),
              ],
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        backgroundColor: const Color(0xFFF4F8FF),
      ),
      body: Obx(() {
        final Category? category = productController.category.value;
        return ListView(
          controller: _scrollController,
          children: [
            Container(
              width: 400,
              height: 150,
              color: const Color(0xFFF4F8FF),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              category?.categoryTitle.toString() ?? '',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${productController.products.length} products",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          category?.image.toString() ?? '',
                          width: 318,
                          height: 318,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (productController.products.isNotEmpty)
              Obx(() {
                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: GridView.builder(
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.65,
                    ),
                    itemCount: productController.products.length + 1,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      if (index < productController.products.length) {
                        return Container(
                          width: 165,
                          height: 500,
                          decoration: BoxDecoration(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(12)),
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
                                        productController
                                            .products[index].image
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
                                          color: (wishListController.isSaved
                                              .isNotEmpty &&
                                              wishListController.isSaved[index])
                                              ? Colors.blue
                                              : Colors.black45,
                                          onPressed: () {
                                            wishListController.addWishList(
                                              WishList(
                                                productId: productController
                                                    .products[index].productId,
                                                userId: loginController
                                                    .loginUser.value?.userId,
                                              ),
                                              index,
                                            );

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: const Text(
                                                    'Successfully added to wishlist'),
                                                action: SnackBarAction(
                                                  label: 'View Wishlist',
                                                  onPressed: () {
                                                    Get.toNamed("/wishList");
                                                  },
                                                ),
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
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            productController.products[index]
                                                .productTitle
                                                .toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            "\$${productController.products[index].price.toString()}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.fromLTRB(0, 0, 3, 0),
                                    child: Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: Colors.deepOrangeAccent,
                                        borderRadius:
                                        BorderRadius.circular(8),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        color: Colors.white,
                                        onPressed: () {
                                          cartController.addCart(
                                            Cart(
                                              productId: productController
                                                  .products[index].productId,
                                              userId: loginController
                                                  .loginUser.value?.userId,
                                            ),

                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: const Text(
                                                  'Successfully added to cart'),
                                              action: SnackBarAction(
                                                label: 'View Cart',
                                                onPressed: () {
                                                  Get.toNamed("/cart");
                                                },
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                );
              })
            else
              emptyDataComponent("product")
          ],
        );
      }),
    );
  }
}
