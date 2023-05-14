import 'package:flutter/material.dart';
import 'package:speed_app/screens/login/introScreen.dart';
import '../../const/colors.dart';
import '../../global/global.dart';
import '../forgotPin/forgetPwScreen.dart';
import '../homeScreen/homeScreen.dart';
import '../signup/signUpScreen.dart';
import '../../utils/helper.dart';
import '../../widgets/btn.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  static const routeName = "/loginScreen";

  @override
  _LoginScreen createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();

  Future<void> _postData() async {
    final response = await http.post(
      Uri.parse('http://localhost:8081/login?mobileNum=' + phone.text + '&password=' + password.text),
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
          Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
        } else {
          showToast(context, 'Утасны дугаар эсвэл нууц үг буруу байна.');
        }
      });
    } else {
      showToast(context, 'Утасны дугаар эсвэл нууц үг буруу байна.');
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
    _initControls();
  }

  void _initControls() {
    // phone = TextEditingController();
    // password = TextEditingController();
  }

  void dispose() {
    phone.dispose();
    password.dispose();
    super.dispose();
  }

  void _blocListener() {}

  @override
  Widget build(BuildContext context) {
    // Widget _blocBuilder(BuildContext context, BaseControlState state) {
    return Scaffold(
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                Spacer(),
                Spacer(),
                Spacer(),
                Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    Helper.getAssetName("logo.png", "virtuals"),
                  ),
                ),
                Spacer(),
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
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(ForgetPwScreen.routeName);
                      },
                      child: const Text(
                        "Нууц үгээ мартсан?",
                        style: TextStyle(color: AppColor.red, fontSize: 13),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: btn(
                    onPressed: () {
                      _postData();
                    },
                    text: "Нэвтрэх",
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: btn(
                    onPressed: () {
                      Navigator.of(context).pushNamed(SignUpScreen.routeName);
                    },
                    text: "Бүртгүүлэх",
                    color: AppColor.lblPrimary,
                    isColor: true,
                  ),
                ),
                Spacer(),
                Spacer(
                  flex: 2,
                ),
                Spacer(
                  flex: 4,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
