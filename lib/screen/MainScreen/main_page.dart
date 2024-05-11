import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:umah/component/widget/main_page_component/app_bar.dart';
import '../../component/widget/main_page_component/bottom_bar.dart';
import '../../component/widget/main_page_component/main_page_carousel.dart';
import '../../controller/category_controller.dart';
import '../../controller/login_controller.dart';
import '../../controller/product_controller.dart';
import '../../controller/wishlist_controller.dart';
import '../../model/category.dart';
import '../../model/wishlist.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  void fun() {
    Get.toNamed("/discover");
  }

  final CategoryController categoryController = Get.put(CategoryController());
  final ProductController productController = Get.put(ProductController());
  final WishListController wishListController = Get.put(WishListController());
  final LoginController loginController = Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // Align children to the start (left) of the column
          children: [
            // First row
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.5),
                      color: const Color.fromRGBO(4, 19, 48, 1),
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/image/WalletIcon.png',
                            color: Colors.deepOrangeAccent,
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Wallet",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "\$2,700",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      color: const Color.fromRGBO(4, 19, 48, 1),
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/image/ahievement-icon.png',
                            color: Colors.deepOrangeAccent,
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Points",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "4,500",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5.5),
                      color: const Color.fromRGBO(4, 19, 48, 1),
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/image/discount-icon.png',
                            color: Colors.deepOrangeAccent,
                          ),
                          const SizedBox(width: 10),
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Vouchers",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "2",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Second row
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Cards()),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Categories",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {
                        Get.toNamed("/discover");
                      },
                      child: const Text(
                        "View all >",
                        style: TextStyle(
                            color: Colors.orange, // Set text color to orange
                            fontWeight:
                                FontWeight.bold, // Set font weight to bold
                            decoration: TextDecoration
                                .underline, // Add underline decoration
                            decorationColor: Colors.orange),
                      ))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    // Wrap with SizedBox
                    height: 110, // Set height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryController.categories.length,
                      // Replace with your item count
                      itemBuilder: (BuildContext context, int index) {
                        // Replace this with your item widget builder
                        return Column(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 70,
                              height: 65,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors
                                    .white, // Optional: you can set a background color for the circle
                              ),
                              child: Center(
                                child: Image.asset(
                                  categoryController.categories[index].imageIcon
                                      .toString(),
                                  width: 40, // Set width as needed
                                  height: 40, // Set height as needed
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            // Add some spacing between the icon and text
                            Text(
                              categoryController.categories[index].categoryTitle
                                  .toString(),
                              style: const TextStyle(
                                fontSize:
                                    16, // Set font weight to bold if desired
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Products",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton(
                      onPressed: () {
                        productController.category.value = Category(
                          categoryId: 0,
                          categoryTitle: "ALL",
                          description: "kkkfmfek",
                          image: "assets/category/cabinet.png",
                        );
                        productController.loadProduct();
                        Get.toNamed('/list');
                      },
                      child: const Text(
                        "View all >",
                        style: TextStyle(
                            color: Colors.orange, // Set text color to orange
                            fontWeight:
                                FontWeight.bold, // Set font weight to bold
                            decoration: TextDecoration
                                .underline, // Add underline decoration
                            decorationColor: Colors.orange),
                      ))
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    // Wrap with SizedBox
                    height: 250, // Set height as needed
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productController.products.length,
                        // Replace with your item count
                        itemBuilder: (BuildContext context, int index) {
                          // Replace this with your item widget builder
                          return Container(
                            margin: const EdgeInsets.only(right: 20),
                            width: 200,
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
                                        Positioned(
                                          top: 0,
                                          left: 10,
                                          child: Image.asset(
                                            productController
                                                .products[index].image
                                                .toString(),
                                            width: 155,
                                            height: 230,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: -10,
                                          child: IconButton(
                                            icon: const Icon(Icons.bookmark),
                                            onPressed: () {
                                              wishListController.addWishList(WishList(
                                                productId: productController.products[index].productId,
                                                userId: loginController.loginUser.value?.userId,
                                              ),index);

                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(
                                                  content: const Text('Successfully added to wishlist'),
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
                                const SizedBox(height: 15),
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
                                            padding: const EdgeInsets.only(
                                                top: 5.0,
                                                right: 5.0,
                                                left: 5.0),
                                            child: Text(
                                              productController
                                                  .products[index].productTitle
                                                  .toString(),
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5.0,
                                                left: 5.0,
                                                bottom: 5.0),
                                            child: Text(
                                              "\$${productController.products[index].price.toString()}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 10, 0),
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
                                          onPressed: () {},
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
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

//
// class ProductCard extends StatelessWidget {
//   final Product product;
//
//   const ProductCard({required this.product});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: const EdgeInsets.all(8.0),
//       elevation: 4.0,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Image.asset(
//               product.image.toString(),
//               height: 10,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(height: 8.0),
//             Text(
//               product.productTitle.toString(),
//               style: const TextStyle(
//                 fontSize: 18.0,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 4.0),
//             Text(
//               product.price.toString(),
//               style: const TextStyle(
//                 fontSize: 16.0,
//               ),
//             ),
//             const SizedBox(height: 4.0),
//             // Text(
//             //   '\$${product.price.toStringAsFixed(2)}',
//             //   style: const TextStyle(
//             //     fontSize: 16.0,
//             //     fontWeight: FontWeight.bold,
//             //     color: Colors.green,
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
