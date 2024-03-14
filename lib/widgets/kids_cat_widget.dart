import 'package:flutter/material.dart';
import 'package:flutter_shopping_assignment/utils/asset_strings.dart';

class KidsCatWidget extends StatelessWidget {
  final List<String> kidImageList = [
    AssetStrings.kidOneIcon,
    AssetStrings.kidTwoIcon,
    AssetStrings.kidThreeIcon,
    AssetStrings.kidFourIcon,
    AssetStrings.kidFiveIcon,
    AssetStrings.kidSixIcon,
  ];
  final bool enableOtherCategory;
  KidsCatWidget({super.key, required this.enableOtherCategory});

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: enableOtherCategory == false ? 1 : 0.1,
        child: GridView.count(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          crossAxisCount: 2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
          childAspectRatio: 1.2,
          children: kidImageList.map((String value) {
            return Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(6)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    value,
                    fit: BoxFit.fill,
                  ),
                ));
          }).toList(),
        ));
  }
}
