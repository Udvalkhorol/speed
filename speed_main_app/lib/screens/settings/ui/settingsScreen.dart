import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:speed_app/screens/forgotPin/forgetPwScreen.dart';
import 'package:speed_app/screens/login/loginScreen.dart';
import 'package:speed_app/screens/settings/moreScreen.dart';
import 'package:speed_app/widgets/lbl.dart';
import 'package:speed_app/widgets/scaffold.dart';

import '../../../const/colors.dart';
import '../../../global/global.dart';
import '../../../utils/helper.dart';
import '../../../widgets/appbar.dart';
import '../../../widgets/customNavBar.dart';
import '../../../widgets/separator.dart';
import '../changeAddressScreen.dart';
import '../profileScreen.dart';
import 'package:http/http.dart' as http;

class SettingsScreen extends StatefulWidget {
  static const routeName = "/settingsScreen";

  @override
  _SettingsScreenToState createState() => _SettingsScreenToState();
}

class _SettingsScreenToState extends State<SettingsScreen> {
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
    return DefaultScaffold(
      appBar: DefaultAppBar(
        isRemoveLeadingSpace: true,
        title: 'Тохиргоо',
      ),
      body: Stack(
        children: [
          SafeArea(
              child: Container(
            height: Helper.getScreenHeight(context),
            width: Helper.getScreenWidth(context),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                    child: Column(
                  children: [
                    /// profile
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
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
                        SizedBox(width: 10),
                        if (_data != null)
                          lbl(
                            // _data[0]['firstname'],
                            'Udvalkhorol',
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                      ],
                    ),
                    SizedBox(height: 10),

                    /// settings
                    _settingCard(
                        title: 'Хувийн тохиргоо',
                        icon: Icons.person,
                        iconColor: AppColor.red,
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            ProfileScreen.routeName,
                            arguments: {'data': _data},
                          );
                        }),
                    _settingCard(
                        title: 'Хаяг',
                        icon: Icons.location_on,
                        iconColor: AppColor.red,
                        onPressed: () {
                          Navigator.pushNamed(context, ChangeAddressScreen.routeName);
                        }),
                    _settingCard(
                        title: 'Нууц үг солих',
                        icon: Icons.lock,
                        iconColor: AppColor.red,
                        onPressed: () {
                          Navigator.pushNamed(context, ForgetPwScreen.routeName);
                        }),
                    _settingCard(
                        title: 'Тусламж',
                        icon: Icons.help,
                        iconColor: AppColor.red,
                        onPressed: () {
                          Navigator.of(context).pushNamed(MoreScreen.routeName);
                        }),
                    _settingCard(
                        title: 'Гарах',
                        icon: Icons.logout,
                        iconColor: AppColor.red,
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                        }),
                  ],
                )),
              ),
            ),
          )),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              settings: true,
            ),
          ),
        ],
      ),
    );
  }
}

Widget _settingCard({String title, IconData icon, Function onPressed, Color iconColor}) {
  return InkWell(
    onTap: () {
      onPressed();
    },
    child: Container(
      width: double.infinity,
      height: 70,
      child: Column(
        children: [
          ListTile(
            leading: Container(
                width: 40,
                child: Icon(
                  icon ?? Icon(Icons.more_horiz_rounded),
                  size: 30,
                  color: iconColor ?? AppColor.gray2,
                )),
            title: lbl(title),
            trailing: Icon(Icons.keyboard_arrow_right),
          ),
          Separator(),
        ],
      ),
    ),
  );
}
