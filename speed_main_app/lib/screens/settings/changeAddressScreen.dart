import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speed_app/widgets/btn.dart';
import 'package:speed_app/widgets/lbl.dart';
import 'package:speed_app/widgets/scaffold.dart';
import '../../const/colors.dart';
import '../../global/global.dart';
import '../../widgets/appbar.dart';
import 'package:http/http.dart' as http;

class ChangeAddressScreen extends StatefulWidget {
  static const routeName = "/changeAddressScreen";

  @override
  _ChangeAddressScreen createState() => _ChangeAddressScreen();
}

class _ChangeAddressScreen extends State<ChangeAddressScreen> {
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> _getLocation() async {
    final response = await http.get(Uri.parse('http://localhost:8081/getLocation?userId=' + Global.userId.toString()));
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
        isRemoveLeadingSpace: false,
        title: "Хаягийн мэдээлэл",
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _data.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
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
                            lbl(
                              _data[index]['city'],
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(width: 5),
                            lbl(
                              _data[index]['district'],
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(width: 5),
                            lbl(
                              _data[index]['street'],
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(width: 5),
                            lbl(
                              _data[index]['addrDesc'],
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: btn(
              text: 'Нэмэх',
              onPressed: () {
                // Navigator.pushNamed(context, )
              },
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 20),
          //   child: btn(
          //     text: 'Хаяг устгах',
          //     color: AppColor.white,
          //     isColor: true,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class CustomTriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
