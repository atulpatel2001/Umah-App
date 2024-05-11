import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:umah/helper/imageStrings.dart';
import 'card_main_page.dart';

class CarouselController extends GetxController {
  static CarouselController get instance => Get.find();
  final carouselCurrentIndex = 0.obs;

  void updatePageIndicator(int index) {
    carouselCurrentIndex.value = index;
  }
}

class Cards extends StatelessWidget {
  Cards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CarouselController controller = Get.put(CarouselController());

    return Column(
      children: [
        CarouselSlider(
          items: const [
            TRoundedImage(imageUrl: ImageStrings.myImage1),
            TRoundedImage(imageUrl: ImageStrings.myImage2),
            TRoundedImage(imageUrl: ImageStrings.myImage3),
          ],
          options: CarouselOptions(
            viewportFraction: 1.0,
            onPageChanged: (index, _) =>
                CarouselController.instance.updatePageIndicator(index),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 138),
          child: Obx(
            () => Row(
              children: List.generate(
                3,
                (index) => Icon(
                  Icons.horizontal_rule_rounded,
                  size: 25,
                  color: controller.carouselCurrentIndex.value == index
                      ? Colors.orange
                      : Colors.grey, // Change color based on index
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
