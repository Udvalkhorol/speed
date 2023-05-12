import 'dart:convert';
import 'package:flutter/material.dart';

import '../const/colors.dart';
import '../global/global.dart';
import '../utils/helper.dart';
import 'btn.dart';
import 'lbl.dart';
import 'package:http/http.dart' as http;

Widget ShoppingCard({
  VoidCallback onPressed,
  dynamic shopCart,
  TextEditingController qty,
}) {
  TextEditingController qty = TextEditingController();
  qty.text = shopCart['qty'].toString();
  void showToast(BuildContext context, String message) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(
            color: AppColor.black,
          ),
          textAlign: TextAlign.center,
        ),
        duration: Duration(seconds: 2),
        backgroundColor: AppColor.placeholderBg,
      ),
    );
  }

  return InkWell(
    onTap: () {},
    child: Container(
      width: double.infinity,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(minHeight: 100, minWidth: double.infinity),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 1.5),
            blurRadius: 1.5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                // child: lbl('product.supplierName', fontWeight: FontWeight.bold),
                child: lbl('Food Mongolia', fontWeight: FontWeight.bold),
              ),
            ],
          ),

          /// Item card
          Container(
            height: 130,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: shopCart.length,
              // itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(5))),
                      child: Row(children: [
                        // CheckBox(product.scfShopCartProduct[index].productControl),

                        /// Item picture
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              height: 80,
                              child: Center(
                                child: SizedBox(
                                    height: Helper.getScreenHeight(context) * 0.5,
                                    width: Helper.getScreenWidth(context),
                                    child: Image.network(
                                      shopCart['image'],
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, error, stackTrace) {
                                        return Image.asset(
                                          'assets/images/placeholder.jpg',
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    )),
                              ),
                            ),
                          ),
                        ),

                        Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: lbl(
                                                utf8.decode(shopCart['name'].runes.toList()),
                                                maxLines: 2,
                                                fontSize: 14,
                                                // fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: btnIconWithBg(
                                        icon: Icons.delete_outline_rounded,
                                        color: AppColor.red,
                                        isSquare: true,
                                        size: 24,
                                        onPressed: () async {
                                          final response = await http.post(Uri.parse('http://localhost:8081/removeCartProd?userId=' + Global.userId.toString() + '&foodId=' + '${shopCart['foodId']}'));
                                          if (response.statusCode == 200) {
                                            Navigator.pop(context);
                                            showToast(context, 'Амжилттай');
                                          } else {
                                            showToast(context, 'Алдаа гарлаа');
                                          }
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                        flex: 5,
                                        child: lbl(
                                          shopCart['totalPrice'].toString() + '₮',
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        )),
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        height: 35,
                                        decoration: const BoxDecoration(
                                          color: AppColor.lblPrimary,
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black,
                                              blurRadius: 0.5,
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5),
                                          child: TextField(
                                            enabled: false,
                                            textAlign: TextAlign.center,
                                            controller: qty,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    //   ],
                                    // ),
                                  ],
                                ),
                                SizedBox(height: 3),
                              ],
                            )),
                      ]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ),
  );
}
