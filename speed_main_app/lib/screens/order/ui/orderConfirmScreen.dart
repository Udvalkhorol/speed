import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speed_app/screens/homeScreen/homeScreen.dart';
import 'package:speed_app/widgets/btn.dart';
import 'package:speed_app/widgets/lbl.dart';

import '../../../const/colors.dart';
import '../../../global/global.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/scaffold.dart';
import 'package:http/http.dart' as http;

class OrderConfirmScreen extends StatefulWidget {
  static const routeName = "/orderConfirmScreen";

  @override
  _OrderConfirmScreen createState() => _OrderConfirmScreen();
}

class _OrderConfirmScreen extends State<OrderConfirmScreen> {
  List<dynamic> _data = [];
  double totalPrice = 0;

  @override
  initState() {
    super.initState();
    _selectShopCart();
  }

  Future<void> _createOrder() async {
    final response = await http.post(Uri.parse('http://localhost:8081/createOrder?userId=' + Global.userId.toString()));
    if (response.statusCode == 200) {
      setState(() {
        showToast(context, "Амжилттай");
        Navigator.popAndPushNamed(context, HomeScreen.routeName);
      });
    } else {
      showToast(context, 'Алдаа гарлаа');
    }
  }

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

  Future<void> _selectShopCart() async {
    final response = await http.get(Uri.parse('http://localhost:8081/selectShopCart?userId=' + Global.userId.toString()));
    if (response.statusCode == 200) {
      setState(() {
        _data = jsonDecode(response.body);
      });

      for (var i in _data) {
        totalPrice = totalPrice + i['totalPrice'];
      }
    } else {
      showToast(context, 'Алдаа гарлаа');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        appBar: DefaultAppBar(
          isRemoveLeadingSpace: false,
          title: 'Баталгаажуулалт',
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 80,
                width: double.infinity,
                child: Container(
                  decoration: const BoxDecoration(
                    color: AppColor.lblPrimary,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: lbl(
                              'Хаяг',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: lbl(
                          Global.location.toString(),
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: _data?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                          color: AppColor.lblPrimary,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                lbl(
                                  utf8.decode(_data[index]['name'].runes.toList()),
                                  fontSize: 15,
                                ),
                                lbl('${_data[index]['qty'].toString()}ш'),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                    color: AppColor.lblPrimary,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      lbl('Нийт дүн :', fontWeight: FontWeight.bold),
                      lbl(totalPrice.toString(), fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: btn(
                    text: 'Захиалга хийх',
                    onPressed: () {
                      _createOrder();
                    }),
              ),
              SizedBox(height: 10),
            ],
          ),
        ));
  }
}
