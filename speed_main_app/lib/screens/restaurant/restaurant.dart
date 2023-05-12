import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speed_app/widgets/scaffold.dart';
import '../../const/colors.dart';
import '../../utils/helper.dart';
import '../../widgets/appbar.dart';
import '../../widgets/cards.dart';
import 'package:http/http.dart' as http;
import '../../widgets/customNavBar.dart';

class RestaurantScreen extends StatefulWidget {
  static const routeName = "/restaurantScreen";

  @override
  _RestaurantScreen createState() => _RestaurantScreen();
}

class _RestaurantScreen extends State<RestaurantScreen> {
  List<dynamic> _data = [];

  @override
  void initState() {
    getRestaurantList();
    super.initState();
  }

  Future<void> getRestaurantList() async {
    final response = await http.get(Uri.parse('http://localhost:8081/selectRestaurant'));
    if (response.statusCode == 200) {
      setState(() {
        _data = jsonDecode(response.body);
        print(_data);
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
    return DefaultScaffold(
      appBar: DefaultAppBar(
        actions: [],
        isRemoveLeadingSpace: true,
        title: 'Ресторан',
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                SizedBox(height: 20),
                SizedBox(
                    height: Helper.getScreenHeight(context) * 0.6,
                    width: Helper.getScreenWidth(context),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: _data.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              // Navigator.pushNamed(context, IndividualItem.routeName);
                                            },
                                            child: MenuCard(
                                              imageShape: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: Container(
                                                  height: 55,
                                                  width: 55,
                                                  child: Image.network(
                                                    _data[index]["logo"],
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context, error, stackTrace) {
                                                      return Image.asset(
                                                        'assets/images/placeholder.jpg',
                                                        fit: BoxFit.cover,
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              name: _data[index]["name"],
                                              count: "12",
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                        ],
                                      );
                                    }),
                              )
                            ],
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              restaurant: true,
            ),
          )
        ],
      ),
    );
  }
}
