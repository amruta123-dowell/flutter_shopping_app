import 'package:flutter/material.dart';
import 'package:flutter_shopping_assignment/extensions.dart';
import 'package:flutter_shopping_assignment/models/cart_data_model.dart';
import 'package:flutter_shopping_assignment/utils/assets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem itemModel;
  final VoidCallback onClickDecrement;
  final VoidCallback onClickIncrement;
  final VoidCallback onClickDelete;
  const CartItemWidget(
      {super.key,
      required this.itemModel,
      required this.onClickDelete,
      required this.onClickDecrement,
      required this.onClickIncrement});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Slidable(
          key: UniqueKey(),
          endActionPane: ActionPane(
              motion: const ScrollMotion(),
              extentRatio: 0.3,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      onClickDelete();
                    },
                    child: Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: const Color(0XFFE03A3E).withOpacity(0.1),
                        ),
                        child: Image.asset(
                          AssetStrings.deleteIcon,
                        )),
                  ),
                )
              ]),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
                color: const Color(0XFFFFFFFF),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                      color: const Color(0XFF000000).withOpacity(0.05),
                      blurRadius: 6,
                      offset: const Offset(0, 4)),
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    itemModel.image,
                    fit: BoxFit.cover,
                    height: 88,
                    width: 88,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemModel.name,
                        style: TextStyle(
                            color: const Color(0XFF3D3D3D),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            height: 22.0.toFigmaHeight(16)),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      Text(
                        "Size: ${itemModel.size}",
                        style: TextStyle(
                            color: const Color(0XFF8F8F8F),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            height: 17.64.toFigmaHeight(14)),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "\u{20B9} ${itemModel.price}",
                              style: TextStyle(
                                  color: const Color(0XFF4C4C4C),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  height: 25.2.toFigmaHeight(20)),
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 100,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 2, vertical: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: const Color(0XFFF0F0F0),
                                  width: 1,
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    onClickDecrement();
                                  },
                                  child: SizedBox(
                                    width: 30,
                                    child: Image.asset(
                                      AssetStrings.minusIcon,
                                      height: 16,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 24,
                                  alignment: Alignment.center,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  child: Text(
                                    "${itemModel.quantity}",
                                    style: TextStyle(
                                        color: const Color(0XFF000000),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                        height: 20.16.toFigmaHeight(16)),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    onClickIncrement();
                                  },
                                  child: SizedBox(
                                    width: 30,
                                    child: Image.asset(
                                      AssetStrings.addIcon,
                                      height: 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
