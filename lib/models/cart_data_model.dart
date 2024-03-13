class CartDataModel {
  static final CartDataModel _instance = CartDataModel._internal();

  factory CartDataModel() {
    return _instance;
  }

  CartDataModel._internal();

  List<CartItem> _cartItemList = [];

  List<CartItem> get cartItemList => _cartItemList;

  void initCartItems(List<Map<String, dynamic>> cartDataList) {
    _cartItemList = cartDataList.map((cartItem) {
      return CartItem(
        name: cartItem['name'] ?? '',
        id: cartItem['id'] ?? '',
        image: cartItem['image'] ?? '',
        price: cartItem['price'] ?? 0,
        size: cartItem['size'] ?? '',
        quantity: cartItem['qty'] ?? 0,
      );
    }).toList();
  }
}

class CartItem {
  final String name;
  final String id;
  final String image;
  final int price;
  final String size;
  int? quantity;

  CartItem({
    required this.name,
    required this.id,
    required this.image,
    required this.price,
    required this.size,
    required this.quantity,
  });
}
