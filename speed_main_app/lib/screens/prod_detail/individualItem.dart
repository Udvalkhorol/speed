import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speed_app/widgets/separator.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';
import '../../widgets/bottomBtnWithPrice.dart';
import 'package:http/http.dart' as http;
import '../../global/global.dart';

class IndividualItem extends StatefulWidget {
  static const routeName = "/individualScreen";

  @override
  _IndividualItem createState() => _IndividualItem();
}

class _IndividualItem extends State<IndividualItem> {
  int value = 1;
  void addBtn() {
    setState(() {
      value++;
    });
  }

  void subBtn() {
    if (value > 1) {
      setState(() {
        value--;
      });
    }
  }

  // Future<void> _addShoppingCart() async {
  //   // Uri.parse('http://localhost:8081/login?mobileNum=' + phone.text + '&password=' + password.text),
  //   final response = await http.post(Uri.parse('http://localhost:8081/addShopCart?userId=' + Global.userId  + '&foodId='  +  food['id'] + '&price=' + food['price'] + '&qty=' value + '&totalPrice=' + value * double.parse(food['price']));
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       showToast(context, 'Амжилттай');
  //     });
  //   } else {
  //     showToast(context, 'Алдаа гарлаа');
  //   }
  // }

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

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    final food = args['food'];

    Future<void> _addShoppingCart() async {
      final response = await http.post(Uri.parse('http://localhost:8081/addShopCart?userId=' +
          Global.userId.toString() +
          '&foodId=' +
          food['id'].toString() +
          '&price=' +
          food['price'].toString() +
          '&qty=' +
          value.toString() +
          '&totalPrice=' +
          (value * double.parse(food['price'])).toString()));
      if (response.statusCode == 200) {
        setState(() {
          showToast(context, 'Амжилттай');
          Navigator.pop(context);
        });
      } else {
        showToast(context, 'Алдаа гарлаа');
      }
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                    height: Helper.getScreenHeight(context) * 0.5,
                    width: Helper.getScreenWidth(context),
                    child: Image.network(
                      food['image'],
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/images/placeholder.jpg',
                          fit: BoxFit.cover,
                        );
                      },
                    )),
                Container(
                  height: Helper.getScreenHeight(context) * 0.5,
                  width: Helper.getScreenWidth(context),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 0.4],
                      colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Helper.getScreenHeight(context) * 0.35,
                      ),
                      SizedBox(
                        height: Helper.getScreenHeight(context) * 0.6,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 30.0),
                              child: Container(
                                // height: 460,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(vertical: 30),
                                decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40),
                                    ),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                        utf8.decode(food['name'].runes.toList()),
                                        style: Helper.getTheme(context).headline5,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Text(
                                                  food['price'] + '₮',
                                                  style: TextStyle(
                                                    color: AppColor.primary,
                                                    fontSize: 28,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                Text(
                                                  food['portion'] != null ? utf8.decode(food['portion'].runes.toList()) : '3/4 хүний порц',
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Text(
                                        "Орц, найрлага",
                                        style: Helper.getTheme(context).headline4.copyWith(
                                              fontSize: 16,
                                            ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20),
                                        child: Text(
                                          utf8.decode(food['ingredient'].runes.toList()),
                                        )),
                                    SizedBox(height: 20),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Separator(),
                                    ),
                                    SizedBox(height: 40),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: Row(
                                        children: [
                                          Text(
                                            "Ширхэг",
                                            style: Helper.getTheme(context).headline4.copyWith(
                                                  fontSize: 16,
                                                ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                ElevatedButton(
                                                  style: ButtonStyle(elevation: MaterialStateProperty.all(5.0)),
                                                  onPressed: () {
                                                    subBtn();
                                                  },
                                                  child: Text("-"),
                                                ),
                                                SizedBox(width: 5),
                                                Container(
                                                  height: 35,
                                                  width: 55,
                                                  decoration: ShapeDecoration(
                                                    shape: StadiumBorder(
                                                      side: BorderSide(color: AppColor.red),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: [
                                                      Text(
                                                        value.toString(),
                                                        style: TextStyle(
                                                          color: AppColor.red,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                ElevatedButton(
                                                  style: ButtonStyle(elevation: MaterialStateProperty.all(5.0)),
                                                  onPressed: () {
                                                    addBtn();
                                                  },
                                                  child: Text("+"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            bottomBtnWithPrice(
                              value: value * double.parse(food['price']),
                              text: 'Сагсанд нэмэх',
                              onPressed: () {
                                _addShoppingCart();
                                // _shoppingCartBloc.add(DetailCartFin(req: MakeOrderRequest(supplierIds: _suppIds)));
                              },
                              isHaveLeading: true,
                              // control: checkAll
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
