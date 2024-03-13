import 'package:flutter/material.dart';
import 'package:flutter_shopping_assignment/widgets/cart_item_widget.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../utils/assets.dart';

class CartScreen extends StatelessWidget {
  final CartController controller = Get.put(CartController());
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            AssetStrings.arrowLeftIcon,
            height: 20,
          ),
        ),
        title: const Center(
          child: Text(
            "Shopping Cart",
            style: TextStyle(
                color: Color(0XFF3D3D3D),
                fontSize: 20,
                fontWeight: FontWeight.w500),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset(
              AssetStrings.cartIcon,
              height: 20,
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            height: 2,
            width: double.infinity,
            color: const Color.fromARGB(255, 230, 227, 227),
          ),
          GetBuilder<CartController>(builder: (controller) {
            return Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 15),
                itemCount: controller.getCartList.length,
                itemBuilder: ((context, index) {
                  return CartItemWidget(
                    onClickIncrement: () {
                      controller.incrementQuantity(index);
                    },
                    itemModel: controller.getCartList[index],
                    onClickDelete: () {
                      controller.deleteCartItem(index);
                    },
                    onClickDecrement: () {
                      controller.decrementQuantity(index);
                    },
                  );
                }),
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
              ),
            );
          }),
          InkWell(
            onTap: () {},
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: const Color(0XFF9C4400),
              ),
              alignment: Alignment.center,
              child: const Text(
                "Proceed to Checkout",
                style: TextStyle(
                    color: Color(0XFFFFFFFF),
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
