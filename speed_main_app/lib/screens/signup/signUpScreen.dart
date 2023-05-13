import 'package:flutter/material.dart';
import 'package:speed_app/screens/login/introScreen.dart';
import 'package:speed_app/widgets/btn.dart';
import 'package:speed_app/widgets/scaffold.dart';
import '../../const/colors.dart';
import '../../global/global.dart';
import '../login/loginScreen.dart';
import '../../utils/helper.dart';
import '../../widgets/appbar.dart';
import '../../widgets/customTextInput.dart';
import '../homeScreen/homeScreen.dart';

import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signUpScreen';

  @override
  _SignUpScreen createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController password2 = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController district = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController info = TextEditingController();

  Future<void> _postData() async {
    final response = await http.post(
      Uri.parse('http://localhost:8081/register?firstName=' +
          name.text +
          '&lastName=' +
          name.text +
          '&mobileNum=' +
          phone.text +
          '&password=' +
          password.text +
          '&district=' +
          district.text +
          '&city=' +
          city.text +
          '&street=' +
          street.text +
          '&addr_desc=' +
          info.text),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      setState(() {
        if (response.body != null && response.body != "") {
          Global.userId = int.parse(response.body);
          print('****' '${Global.userId}' '****');
          showToast(context, 'Амжилттай');
          // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          Navigator.of(context).pushReplacementNamed(IntroScreen.routeName);
        } else {
          showToast(context, 'Утасны дугаар давхцсан эсвэл буруу байна.');
        }
      });
    } else {
      showToast(context, 'Утасны дугаар давхцсан эсвэл буруу байна.');
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
        appBar: DefaultAppBar(
          isRemoveLeadingSpace: false,
          title: 'Бүртгүүлэх',
        ),
        body: SingleChildScrollView(
          child: Container(
            width: Helper.getScreenWidth(context),
            height: Helper.getScreenHeight(context),
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Өөрийн мэдээллээ оруулна уу")],
                    ),
                    Spacer(),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColor.lblPrimary,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.5),
                            blurRadius: 1.5,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          controller: name,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Нэр",
                            hintStyle: const TextStyle(
                              color: AppColor.primary,
                            ),
                            icon: Icon(Icons.person),
                            iconColor: AppColor.red,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColor.lblPrimary,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.5),
                            blurRadius: 1.5,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          controller: phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Утасны дугаар",
                            hintStyle: const TextStyle(
                              color: AppColor.primary,
                            ),
                            icon: Icon(Icons.phone),
                            iconColor: AppColor.red,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColor.lblPrimary,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.5),
                            blurRadius: 1.5,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          controller: password,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Нууц үг",
                            hintStyle: const TextStyle(
                              color: AppColor.primary,
                            ),
                            icon: Icon(Icons.lock),
                            iconColor: AppColor.red,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColor.lblPrimary,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.5),
                            blurRadius: 1.5,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          controller: password2,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Нууц үг дахин оруулах",
                            hintStyle: const TextStyle(
                              color: AppColor.primary,
                            ),
                            icon: Icon(Icons.lock),
                            iconColor: AppColor.red,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [Text("Хаягийн мэдээллээ оруулна уу")],
                    ),
                    Spacer(),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColor.lblPrimary,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.5),
                            blurRadius: 1.5,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          controller: city,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Хот",
                            hintStyle: const TextStyle(
                              color: AppColor.primary,
                            ),
                            icon: Icon(Icons.location_on),
                            iconColor: AppColor.red,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColor.lblPrimary,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.5),
                            blurRadius: 1.5,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          controller: district,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Дүүрэг",
                            hintStyle: const TextStyle(
                              color: AppColor.primary,
                            ),
                            icon: Icon(Icons.location_on),
                            iconColor: AppColor.red,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColor.lblPrimary,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.5),
                            blurRadius: 1.5,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          controller: street,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Хороо",
                            hintStyle: const TextStyle(
                              color: AppColor.primary,
                            ),
                            icon: Icon(Icons.location_on),
                            iconColor: AppColor.red,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 55,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColor.lblPrimary,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 0.5),
                            blurRadius: 1.5,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          controller: info,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Нэмэлт мэдээлэл",
                            hintStyle: const TextStyle(
                              color: AppColor.primary,
                            ),
                            icon: Icon(Icons.location_on),
                            iconColor: AppColor.red,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                    SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: btn(
                            text: 'Хадгалах',
                            onPressed: () {
                              _postData();
                              // Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
                            })),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Бүртгэлтэй эсэх?"),
                          SizedBox(width: 5),
                          Text(
                            "Нэвтрэх",
                            style: TextStyle(
                              color: AppColor.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
