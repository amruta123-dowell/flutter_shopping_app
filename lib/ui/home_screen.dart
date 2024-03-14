import 'package:flutter/material.dart';
import 'package:flutter_shopping_assignment/ui/cart_screen.dart';
import 'package:flutter_shopping_assignment/widgets/catagory_selection_widget.dart';
import 'package:flutter_shopping_assignment/widgets/bottom_nav_bar_widget.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';
import '../utils/assets.dart';

class HomeScreen extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Image.asset(
          AssetStrings.menuIcon,
          height: 20,
        ),
        title: const Center(
          child: Text(
            "Home",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0XFF3D3D3D),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              onTap: () {
                Get.to(() => CartScreen());
              },
              child: Image.asset(
                AssetStrings.cartIcon,
                height: 20,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 2,
            width: double.infinity,
            color: const Color(0XFFD9D9D9),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          AssetStrings.bannerImage,
                          fit: BoxFit.fitWidth,
                          height: 200,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Trending Collection for you",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: Color(0XFF0A191E)),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text("View all",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0XFF9C4400))),
                      ],
                    ),
                    const CategorySelectionWidget(),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 1,
            width: double.infinity,
            color: const Color(0XFFD9D9D9),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<HomeController>(builder: (controller) {
        return BottomNavBarWidget(
            selectedIndex: controller.selectedBottomItem,
            onChangeItem: (value) {
              controller.onChangeBottomNavItem(value);
            });
      }),
    );
  }
}
