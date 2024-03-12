import 'package:get/get.dart';

class HomeController extends GetxController {
  int selectedBottomItem = 0;
  CatType category = CatType.kids;
  @override
  void onInit() {}

  void onChangeBottomNavItem(int index) {
    selectedBottomItem = index;
    update();
  }

  selectedCategory(int index) {
    category = index == 1
        ? CatType.women
        : index == 2
            ? CatType.men
            : CatType.kids;

    update();
  }
}

enum CatType { men, women, kids }
