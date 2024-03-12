import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_shopping_assignment/controller/home_controller.dart';
import 'package:flutter_shopping_assignment/utils/assets.dart';
import 'package:flutter_shopping_assignment/widgets/kids_cat_widget.dart';
import 'package:get/get.dart';

class CatSelectionWidget extends StatelessWidget {
  const CatSelectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Stack(
        children: [
          Column(
            children: [
              InkWell(
                onTap: () {
                  controller.selectedCategory(1);
                },
                child: _CategoryImage(
                    opacity: controller.category == CatType.women ? 1 : 0.1,
                    image: AssetStrings.womenCatIcon,
                    categoryType: "Women"),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  controller.selectedCategory(2);
                },
                child: _CategoryImage(
                  opacity: controller.category == CatType.men ? 1 : 0.1,
                  image: AssetStrings.menCatIcon,
                  categoryType: "Men",
                  boxFit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
          Positioned(
            right: 6,
            child: InkWell(
              onTap: () {
                controller.selectedCategory(0);
              },
              child: SizedBox(
                  height: 500,
                  width: MediaQuery.sizeOf(context).width - 300 / 2,
                  child: KidsCatWidget(
                    category: controller.category,
                  )),
            ),
          )
        ],
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
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                  height: 188,
                  width: double.infinity,
                  image,
                  fit: boxFit ?? BoxFit.fitHeight),
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
                  color: const Color(0XFFFFFFFF)),
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
