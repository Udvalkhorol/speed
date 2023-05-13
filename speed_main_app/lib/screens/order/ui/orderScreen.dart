import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../const/colors.dart';
import '../../../const/const.dart';
import '../../../global/global.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/customNavBar.dart';
import '../../../widgets/scaffold.dart';
import '../../../widgets/tabbar.dart';
import '../../notification/notificationScreen.dart';
import 'OrderHistoryWidget.dart';
import 'orderWidgets.dart';
import 'package:http/http.dart' as http;

class OrderScreen extends StatefulWidget {
  static const routeName = "/orderScreen";

  final orderListFrom;

  const OrderScreen({this.orderListFrom}) : super();
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _tabCount = 2;
  List<dynamic> data;

  @override
  void initState() {
    _tabController = TabController(length: _tabCount, vsync: this);
    super.initState();
    data = [];
    getData();
  }

  Future<void> getData() async {
    final response = await http.post(Uri.parse('http://localhost:8081/selectOrder?userId=' + Global.userId.toString()));
    if (response.statusCode == 200) {
      setState(() {
        data = jsonDecode(response.body);
        print(data);
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
    var _tabBarView = TabBarView(controller: _tabController, physics: const NeverScrollableScrollPhysics(), children: <Widget>[
      OrderWidget(orderType: OrderType.active, data: data.isEmpty ? null : data),
      OrderHistoryWidget(orderType: OrderType.history, data: data.isEmpty ? null : data),
    ]);
    return DefaultScaffold(
        appBar: DefaultAppBar(
          actions: [
            IconButton(
              color: AppColor.primary,
              icon: Icon(Icons.notifications_none_rounded),
              // icon: notifIcon(Icons.notifications_none_rounded, count: app.menuCount?.smartNotifCount),
              onPressed: () {
                Navigator.of(context).pushNamed(NotificationScreen.routeName);
              },
            ),
          ],
          isRemoveLeadingSpace: true,
          title: 'Захиалга',
          tab: tabBar(margin: EdgeInsets.zero, tabController: _tabController, tabItems: [
            TabItem(
                child: tabLbl(
              'Идэвхтэй',
            )),
            TabItem(
              child: tabLbl('Түүх'),
            ),
          ]),
        ),
        body: Stack(
          children: [
            _tabBarView,
            Positioned(
              bottom: 0,
              left: 0,
              child: CustomNavBar(
                order: true,
              ),
            ),
          ],
        ));
  }
}
