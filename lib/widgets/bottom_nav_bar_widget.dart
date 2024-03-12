import 'package:flutter/material.dart';
import 'package:flutter_shopping_assignment/utils/assets.dart';

class BottomNavBarWidget extends StatefulWidget {
  BottomNavBarWidget({super.key});

  @override
  State<BottomNavBarWidget> createState() => _BottomNavBarWidgetState();
}

class _BottomNavBarWidgetState extends State<BottomNavBarWidget> {
  final List<Map<String, String>> bottomImageList = [
    {
      "image": AssetStrings.homeIcon,
      "label": "Home",
    },
    {"image": AssetStrings.searchIcon, "label": "Search"},
    {"image": AssetStrings.favoriteIcon, "label": "Favorite"},
    {"image": AssetStrings.profileIcon, "label": "Profile"}
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        unselectedLabelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 4, 237, 47)),
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(
          decorationColor: Colors.black,
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
            (index) => getNavItem(bottomImageList[index]["image"]!,
                bottomImageList[index]["label"]!)));
  }
}

BottomNavigationBarItem getNavItem(String image, String label) {
  return BottomNavigationBarItem(
    icon: Image.asset(
      image,
      height: 24,
      width: 24,
    ),
    label: label,
  );
}
