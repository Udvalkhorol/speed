import 'package:flutter/material.dart';
import 'package:speed_app/widgets/btn.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';
import '../homeScreen/homeScreen.dart';

class IntroScreen extends StatefulWidget {
  static const routeName = "/introScreen";

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var _controller;
  int count;
  final List<Map<String, String>> _pages = [
    {"image": "vector1.png", "title": "Яг одоо захиал", "desc": "Таны хэзээд бид таны хоолыг гэрт тань хүргэнэ"},
    {"image": "vector3.png", "title": "Түргэн хоол", "desc": "Хүссэн газарт тань бид таны захиалгыг хүргэнэ"},
  ];

  @override
  void initState() {
    _controller = new PageController();
    count = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Spacer(),
                Container(
                  height: 400,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (value) {
                      setState(() {
                        count = value;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(Helper.getAssetName(_pages[index]["image"], "virtual"));
                    },
                    itemCount: _pages.length,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: count == 0 ? AppColor.red : AppColor.placeholder,
                    ),
                    SizedBox(width: 5),
                    CircleAvatar(
                      radius: 5,
                      backgroundColor: count == 1 ? AppColor.red : AppColor.placeholder,
                    ),
                    SizedBox(width: 5),
                  ],
                ),
                Spacer(),
                Text(
                  _pages[count]["title"],
                  style: Helper.getTheme(context).headline6,
                ),
                Spacer(),
                Text(
                  _pages[count]["desc"],
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: btn(
                      text: 'Үргэлжлүүлэх',
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                      }),
                ),
                Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
