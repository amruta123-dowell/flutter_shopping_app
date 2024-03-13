import 'package:flutter/material.dart';

import 'package:flutter_shopping_assignment/controller/home_controller.dart';
import 'package:flutter_shopping_assignment/utils/assets.dart';
import 'package:flutter_shopping_assignment/widgets/kids_cat_widget.dart';
import 'package:get/get.dart';

class CategorySelectionWidget extends StatelessWidget {
  const CategorySelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.only(top: 20),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                InkWell(
                  onTap: () {
                    controller.selectedCategory(1);
                  },
                  child: _CategoryImage(
                      opacity: controller.isSelectedCat &&
                              controller.selectedIndex == 1
                          ? 1
                          : 0.1,
                      image: AssetStrings.womenCatIcon,
                      categoryType: "Women"),
                ),
                const SizedBox(
                  height: 8,
                ),
                InkWell(
                  onTap: () {
                    controller.selectedCategory(2);
                  },
                  child: _CategoryImage(
                    opacity: controller.isSelectedCat &&
                            controller.selectedIndex == 2
                        ? 1
                        : 0.1,
                    image: AssetStrings.menCatIcon,
                    categoryType: "Men",
                    boxFit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                  padding: const EdgeInsets.only(right: 12, top: 32),
                  width: MediaQuery.sizeOf(context).width - 300 / 2,
                  child: KidsCatWidget(
                    enableOtherCategory: controller.isSelectedCat,
                  )),
            )
          ],
        ),
      );
    });
  }
}

class _CategoryImage extends StatelessWidget {
  final String image;
  final String categoryType;
  final BoxFit? boxFit;
  final double opacity;

  const _CategoryImage({
    required this.image,
    required this.categoryType,
    this.boxFit,
    required this.opacity,
  });
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: opacity,
          child: Container(
            height: 188,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0XFF000000).withOpacity(0.04),
                      blurRadius: 24,
                      offset: const Offset(0, 6))
                ]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(image, fit: boxFit ?? BoxFit.fitHeight),
            ),
          ),
        ),
        Positioned(
            bottom: 12,
            left: 8,
            child: Container(
              alignment: Alignment.center,
              height: 20,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0XFFFFFFFF),
              ),
              child: Text(
                categoryType,
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: Color(0XFFF37807)),
              ),
            ))
      ],
    );
  }
}
