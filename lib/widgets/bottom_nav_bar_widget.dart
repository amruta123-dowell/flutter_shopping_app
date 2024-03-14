import 'package:flutter/material.dart';
import 'package:flutter_shopping_assignment/extensions.dart';

import 'package:flutter_shopping_assignment/utils/assets.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final void Function(int) onChangeItem;
  BottomNavBarWidget(
      {super.key, required this.selectedIndex, required this.onChangeItem});

  final List<Map<String, String>> bottomImageList = [
    {
      "image": AssetStrings.homeIcon,
      "label": "Home",
    },
    {"image": AssetStrings.searchIcon, "label": "Search"},
    {"image": AssetStrings.favoriteIcon, "label": "Favorite"},
    {"image": AssetStrings.profileIcon, "label": "Profile"}
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: onChangeItem,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        items: List.generate(
            4,
            (index) => BottomNavigationBarItem(
                  icon: Column(
                    children: [
                      Image.asset(
                        bottomImageList[index]["image"]!,
                        height: 24,
                        width: 24,
                        color: selectedIndex == index
                            ? const Color(0XFF9C4400)
                            : const Color(0XFF727272),
                      ),
                      Text(
                        bottomImageList[index]["label"]!,
                        style: TextStyle(
                            color: selectedIndex == index
                                ? const Color(0XFF9C4400)
                                : const Color(0XFF727272),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 17.57.toFigmaHeight(14)),
                      )
                    ],
                  ),
                  label: '',
                )));
  }
}
