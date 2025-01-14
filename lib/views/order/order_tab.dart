import 'package:allfit_flutter/utils/colors.dart';
import 'package:allfit_flutter/views/main_controller.dart';
import 'package:allfit_flutter/views/order/category_selection_page.dart';
import 'package:allfit_flutter/views/order/my_size/my_size_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderTab extends GetView<MainController> {
  const OrderTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: const [
            Image(
              fit: BoxFit.fitWidth,
              image: AssetImage("assets/images/order_tab_background.png"),
            ),
          ],
        ),
        const Positioned(
          top: 225,
          right: 25,
          child: Text(
            "집에서 맡기는\n편한 수선",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Column(
          children: [
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              height: 240,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 21),
                  InkWell(
                    onTap: () => Get.toNamed(CategorySelectionPage.route),
                    child: Container(
                      color: lightGreyBackgroundColor,
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      height: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "수선 맡기기",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Image(
                            width: 45,
                            image: AssetImage("assets/images/camera.png"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 17),
                  InkWell(
                    onTap: () {
                      Get.toNamed(MySizePage.route);
                    },
                    child: Container(
                      color: lightGreyBackgroundColor,
                      padding: const EdgeInsets.symmetric(horizontal: 28),
                      height: 90,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "마이사이즈\n확인하기",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 45,
                            height: 79,
                            child: Image(
                              image: AssetImage(
                                "assets/images/avatar_pic.png",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
