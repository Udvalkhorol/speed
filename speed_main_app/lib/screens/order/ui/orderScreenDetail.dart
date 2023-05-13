import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speed_app/screens/homeScreen/homeScreen.dart';
import 'package:speed_app/widgets/scaffold.dart';

import '../../../const/colors.dart';
import '../../../utils/helper.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/btn.dart';
import 'package:http/http.dart' as http;

class OrderScreenDetail extends StatefulWidget {
  static const routeName = "/orderScreenDetail";

  @override
  _OrderScreenDetail createState() => _OrderScreenDetail();
}

class _OrderScreenDetail extends State<OrderScreenDetail> {
  double total = 0.0;
  String orderId = '';

  @override
  void initState() {
    super.initState();
  }

  Future<void> updateOrder() async {
    final response = await http.post(Uri.parse('http://localhost:8081/updateOrderStatus?orderId=' + orderId.toString()));
    if (response.statusCode == 200) {
      setState(() {
        // _data = jsonDecode(response.body);
        showToast(context, 'Амжилттай');
        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
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

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    final data = args['data'];
    final from = args['from'];
    print(data);

    total = 0;
    orderId = '';
    for (int i = 0; i < data.length; i++) {
      total = total + data[i]['totalPrice'];
      orderId = (data[i]['orderId']).toString();
    }

    return DefaultScaffold(
      appBar: DefaultAppBar(
        actions: [],
        isRemoveLeadingSpace: false,
        title: 'Миний захиалга',
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Container(
                        color: AppColor.placeholderBg,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: BurgerCard(
                          price: data[index]['totalPrice'].toString(),
                          qty: data[index]['qty'].toString() + 'ш',
                          name: utf8.decode(data[index]['name'].toString().runes.toList()),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  SizedBox(height: 10),
                  Divider(
                    color: AppColor.placeholder.withOpacity(0.25),
                    thickness: 1.5,
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Нийт дүн",
                          style: Helper.getTheme(context).headline3,
                        ),
                      ),
                      Text(
                        total.toString(),
                        style: Helper.getTheme(context).headline3.copyWith(
                              color: AppColor.red,
                              fontSize: 22,
                            ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  (from != 'history')
                      ? btn(
                          onPressed: () {
                            updateOrder();
                          },
                          text: "Хүлээн авах",
                        )
                      : Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BurgerCard extends StatelessWidget {
  const BurgerCard({
    Key key,
    String name,
    String price,
    String qty,
    bool isLast = false,
  })  : _name = name,
        _price = price,
        _isLast = isLast,
        _qty = qty,
        super(key: key);

  final String _name;
  final String _price;
  final bool _isLast;
  final String _qty;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: _isLast
              ? BorderSide.none
              : BorderSide(
                  color: AppColor.placeholder.withOpacity(0.25),
                ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _name,
            style: TextStyle(
              color: AppColor.primary,
              fontSize: 16,
            ),
          ),
          Text(
            _qty,
            style: TextStyle(
              color: AppColor.primary,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 8),
          Text(
            _price,
            style: TextStyle(
              color: AppColor.primary,
              fontSize: 16,
              fontWeight: FontWeight.w900,
            ),
          )
        ],
      ),
    );
  }
}
