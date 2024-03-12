import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_assignment/utils/assets.dart';

import '../controller/home_controller.dart';

class KidsCatWidget extends StatelessWidget {
  final List<String> kidImageList = [
    AssetStrings.kidOneIcon,
    AssetStrings.kidTwoIcon,
    AssetStrings.kidThreeIcon,
    AssetStrings.kidFourIcon,
    AssetStrings.kidFiveIcon,
    AssetStrings.kidSixIcon,
  ];
  final CatType category;
  KidsCatWidget({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: category == CatType.kids ? 1 : 0.1,
      child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          itemCount: kidImageList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns
            crossAxisSpacing: 3, // Spacing between columns
            mainAxisSpacing: 3, // Spacing between rows
          ),
          itemBuilder: ((context, index) {
            return Container(
              height: 25,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image.asset(
                  kidImageList[index],
                  fit: BoxFit.fill,
                  height: 25,
                ),
              ),
            );
          })),
    );
  }
}
