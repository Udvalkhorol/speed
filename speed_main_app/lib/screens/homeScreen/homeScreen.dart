import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speed_app/screens/homeScreen/demandFood.dart';
import 'package:speed_app/screens/homeScreen/specialRestaur.dart';
import '../../const/colors.dart';
import '../../global/global.dart';
import '../../utils/helper.dart';
import '../../widgets/cards.dart';
import '../../widgets/customNavBar.dart';
import '../prod_detail/individualItem.dart';
import '../../widgets/searchBar.dart';
import '../shopping_cart/shoppingCartScreen.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  static const routeName = "/homeScreen";

  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  List<String> _location = [];
  String _selectedValue = "";

  List<dynamic> _data = [];
  List<dynamic> _foodList = [];

  Future<void> _getLocation() async {
    final response = await http.get(Uri.parse('http://localhost:8081/getLocation?userId=' + Global.userId.toString()));
    if (response.statusCode == 200) {
      setState(() {
        _data = jsonDecode(response.body);
        print(_data);
        for (var i in _data) {
          _location.add(i['city'] + " " + i['district'] + " " + i['street'] + " " + i['addrDesc']);
        }
        _selectedValue = _location.elementAt(0);
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

  Future<void> _getFoodList() async {
    final response = await http.get(Uri.parse('http://localhost:8081/selectFood'));
    if (response.statusCode == 200) {
      setState(() {
        _foodList = jsonDecode(response.body);
        print(_foodList);
      });
    } else {
      showToast(context, 'Алдаа гарлаа');
    }
  }

  @override
  void initState() {
    _getLocation();
    _getFoodList();
    _data = [];
    _foodList = [];
    super.initState();
  }

  void _onDropdownChanged(String newValue) {
    setState(() {
      _selectedValue = newValue;
      print(_selectedValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.blue2),
                            borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: SearchBar(
                            title: "Хайх",
                            width: 280,
                            height: 40,
                          ),
                        ),
                        SizedBox(
                          width: 50,
                          child: IconButton(
                            color: AppColor.red,
                            icon: Icon(Icons.shopping_cart),
                            onPressed: () {
                              Navigator.of(context).pushNamed(ShoppingCartScreen.routeName);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Text("Хаяг өөрчлөх"),
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                          ),
                          child: DropdownButton(
                            isExpanded: true,
                            value: _selectedValue,
                            items: _location.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  maxLines: 10,
                                ),
                              );
                            }).toList(),
                            onChanged: (String newValue) {
                              _onDropdownChanged(newValue);
                            },
                            icon: Image.asset(
                              Helper.getAssetName("dropdown_filled.png", "virtual"),
                            ),
                            // style: Helper.getTheme(context).headline4,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _foodList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    IndividualItem.routeName,
                                    arguments: {'food': _foodList[index]},
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: CategoryCard(
                                    image: _foodList[index]['image'],
                                    name: utf8.decode(_foodList[index]['name'].runes.toList()),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Онцгой харилцагч",
                          style: Helper.getTheme(context).headline5,
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(SpecialRes.routeName);
                            },
                            child: Text("Бүгдийг үзэх"))
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  RestaurantCard(
                    image: Image.asset(
                      Helper.getAssetName("pizza2.jpg", "real"),
                      fit: BoxFit.cover,
                    ),
                    name: "Minute by tuk tuk",
                  ),
                  RestaurantCard(
                    image: Image.asset(
                      Helper.getAssetName("breakfast.jpg", "real"),
                      fit: BoxFit.cover,
                    ),
                    name: "Cafe de Noir",
                  ),
                  RestaurantCard(
                    image: Image.asset(
                      Helper.getAssetName("bakery.jpg", "real"),
                      fit: BoxFit.cover,
                    ),
                    name: "Bakes by Tella",
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Эрэлттэй",
                          style: Helper.getTheme(context).headline5,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(DemandFood.routeName);
                          },
                          child: Text("Бүгдийг үзэх"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 250,
                    width: double.infinity,
                    padding: const EdgeInsets.only(left: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          MostPopularCard(
                            image: Image.asset(
                              Helper.getAssetName("pizza4.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                            name: "Cafe De Bambaa",
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          MostPopularCard(
                            name: "Burger by Bella",
                            image: Image.asset(
                              Helper.getAssetName("dessert3.jpg", "real"),
                              fit: BoxFit.cover,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 100),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomNavBar(
                home: true,
              )),
        ],
      ),
    );
  }
}
