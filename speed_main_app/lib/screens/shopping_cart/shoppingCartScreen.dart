import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speed_app/screens/order/ui/orderScreen.dart';

import '../../const/colors.dart';
import '../../global/global.dart';
import '../../widgets/appbar.dart';
import '../../widgets/bottomBtnWithPrice.dart';
import '../../widgets/lbl.dart';
import '../../widgets/scaffold.dart';
import '../../widgets/shoppingCard.dart';
import 'package:http/http.dart' as http;

import '../order/ui/orderConfirmScreen.dart';

class ShoppingCartScreen extends StatefulWidget {
  static const routeName = "/shoppingCartScreen";

  String location;

  ShoppingCartScreen({this.location});

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  List<dynamic> _shopCart = [];
  double totalPrice = 0;
  final TextEditingController qty = TextEditingController();

  @override
  void initState() {
    _selectShopCart();
    super.initState();
    _shopCart = [];
    // widget.location = ModalRoute.of(context).settings.arguments as String;

    print(widget.location);
  }

  Future<void> _selectShopCart() async {
    final response = await http.get(Uri.parse('http://localhost:8081/selectShopCart?userId=' + Global.userId.toString()));
    if (response.statusCode == 200) {
      setState(() {
        _shopCart = jsonDecode(response.body);
        print('***' '${_shopCart}' '*****');
      });

      for (var i in _shopCart) {
        totalPrice = totalPrice + i['totalPrice'];
      }
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
    return DefaultScaffold(
        appBar: DefaultAppBar(
          isRemoveLeadingSpace: false,
          title: 'Сагс',
        ),
        body: _shopCart != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: _shopCart.length != 0
                        ? ListView.builder(
                            shrinkWrap: true,
                            itemCount: _shopCart?.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Column(
                                children: [
                                  ShoppingCard(
                                    onPressed: () {},
                                    shopCart: _shopCart[index],
                                    qty: qty,
                                  ),
                                  index == _shopCart.length - 1
                                      ? SizedBox(
                                          // height: gLayout.padding4x,
                                          )
                                      : Container(),
                                ],
                              );
                            })
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: lbl(
                              'Одоогоор таны сагс хоосон байна',
                              maxLines: 2,
                              textAlign: TextAlign.center,
                            )),
                          ),
                  ),
                  if (_shopCart.length > 0)
                    bottomBtnWithPrice(
                      value: totalPrice,
                      text: 'Захиалга үүсгэх',
                      onPressed: () {
                        Navigator.pushNamed(context, OrderConfirmScreen.routeName, arguments: '');
                      },
                      isHaveLeading: true,
                      // control: checkAll
                    ),
                ],
              )
            : Container(
                child: Center(child: lbl('Одоогоор таны сагс хоосон байна')),
              ));
  }
}
