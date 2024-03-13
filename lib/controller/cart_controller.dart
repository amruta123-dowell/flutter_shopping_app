import 'package:get/get.dart';

import '../cart_data.dart';
import '../models/cart_data_model.dart';

class CartController extends GetxController {
  List<CartItem> _cartList = [];

  @override
  void onInit() {
    super.onInit();

    CartDataModel().initCartItems(cartData);
    _cartList = CartDataModel().cartItemList;
  }

//cart item list
  List<CartItem> get getCartList {
    return _cartList.where((element) => element.quantity != 0).toList();
  }

//Increase the item  quantity
  void incrementQuantity(int index) {
    _cartList[index].quantity = _cartList[index].quantity! + 1;
    update();
  }

//Decrease the item quantity
  void decrementQuantity(int index) {
    _cartList[index].quantity = _cartList[index].quantity! - 1;
    if (_cartList[index].quantity == 0) {
      _cartList.removeAt(index);
    }
    update();
  }

//Delete cart item
  void deleteCartItem(int index) {
    _cartList.removeAt(index);
    update();
  }
}
