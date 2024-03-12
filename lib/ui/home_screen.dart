import 'package:flutter/material.dart';
import 'package:flutter_shopping_assignment/widgets/cat_selection_widget.dart';
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
      appBar: AppBar(
        leading: Image.asset(AssetStrings.menuIcon),
        title: const Center(
          child: Text(
            "Home",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: InkWell(
              child: Image.asset(AssetStrings.cartIcon),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 2,
                width: double.infinity,
                color: const Color.fromARGB(255, 230, 227, 227),
              ),
              Container(
                height: 200,
                margin: const EdgeInsets.only(
                  top: 12,
                ),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                child: Image.asset(AssetStrings.bannerImage),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Trending Collection for you",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color.fromRGBO(10, 25, 30, 1)),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text("View all",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Color.fromRGBO(156, 68, 0, 1))),
                  ],
                ),
              ),
              const CatSelectionWidget()
            ],
          ),
        ),
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
