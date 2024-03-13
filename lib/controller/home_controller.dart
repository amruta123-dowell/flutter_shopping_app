import 'package:get/get.dart';

class HomeController extends GetxController {
  int selectedBottomItem = 0;

  int selectedIndex = 0;
  bool isSelectedCat = false;

//To handle Bottom navigation selection changes
  void onChangeBottomNavItem(int index) {
    selectedBottomItem = index;
    update();
  }

//on click image - used to change the opacity of category image.
  selectedCategory(int index) {
    int tempIndex = index;

    if (selectedIndex != tempIndex) {
      isSelectedCat = true;
    } else {
      isSelectedCat = !isSelectedCat;
    }
    selectedIndex = index;

    update();
  }
}
