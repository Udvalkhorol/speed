import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speed_app/widgets/scaffold.dart';
import '../../const/colors.dart';
import '../../utils/helper.dart';
import '../../widgets/appbar.dart';
import '../../widgets/btn.dart';
import '../../widgets/customFormInput.dart';
import 'package:http/http.dart' as http;
import '../../../global/global.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = "/profileScreen";

  @override
  _ProfileScreen createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  List<dynamic> _data = [];

  @override
  void initState() {
    super.initState();
    _getUserInfo();
  }

  Future<void> _getUserInfo() async {
    final res = await http.get(Uri.parse('http://localhost:8081/selectUser?userId=' + Global.userId.toString()));
    if (res.statusCode == 200) {
      setState(() {
        _data = jsonDecode(res.body);
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
    final Map<String, dynamic> args = ModalRoute.of(context).settings.arguments;
    final data = args['data'];

    return DefaultScaffold(
      appBar: DefaultAppBar(
        isRemoveLeadingSpace: false,
        title: "Хувийн тохиргоо",
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Container(
              height: Helper.getScreenHeight(context),
              width: Helper.getScreenWidth(context),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      ClipOval(
                        child: Stack(
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              child: Image.asset(
                                Helper.getAssetName(
                                  "user.jpg",
                                  "real",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                height: 20,
                                width: 80,
                                color: Colors.black.withOpacity(0.3),
                                child: Image.asset(Helper.getAssetName("camera.png", "virtual")),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            Helper.getAssetName("edit_filled.png", "virtual"),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Өөрчлөх",
                            style: TextStyle(color: AppColor.red),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      CustomFormImput(
                        label: "Нэр",
                        value: "Udval ",
                      ),
                      SizedBox(height: 15),
                      CustomFormImput(
                        label: "И-мэйл",
                        value: "udval@email.com",
                      ),
                      SizedBox(height: 15),
                      CustomFormImput(
                        label: "Нууц үг",
                        value: "Emilia Clarke",
                        isPassword: true,
                      ),
                      SizedBox(height: 15),
                      CustomFormImput(
                        label: "Нууц үг давтах",
                        value: "Emilia Clarke",
                        isPassword: true,
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: btn(
                          text: 'Хадгалах',
                          onPressed: () {},
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
