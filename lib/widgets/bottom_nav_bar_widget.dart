import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 4, 237, 47)),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        currentIndex: selectedIndex,
        unselectedFontSize: 14,
        selectedFontSize: 14,
        items: List.generate(
            4,
            (index) => BottomNavigationBarItem(
                  icon: Image.asset(
                    bottomImageList[index]["image"]!,
                    height: 24,
                    width: 24,
                  ),
                  label: bottomImageList[index]["label"]!,
                )));
  }
}
