import 'package:flutter/material.dart';
import '../../../themes/app_color.dart';
import '../../../themes/assets.dart';
import '../../../utils/helper.dart';
import '../../../widgets/button.dart';
import '../../../widgets/customTextInput.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/loginScreen";

  @override
  Widget build(BuildContext context) {
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
                const SizedBox(height: 100),
                SizedBox(
                  width: 150,
                  height: 50,
                  child: Image.asset(Img.app_logo),
                ),
                const Spacer(),
                const Spacer(),
                const Spacer(),
                const Spacer(),
                const CustomTextInput(
                  hintText: "Утасны дугаар",
                  icon: Icon(Icons.phone),
                ),
                const SizedBox(height: 15),
                const CustomTextInput(
                  hintText: "Нууц үг",
                  icon: Icon(Icons.lock),
                ),
                const SizedBox(height: 120),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: btn(
                    onPressed: () {},
                    text: "Нэвтрэх",
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).pushReplacementNamed(ForgetPwScreen.routeName);
                      },
                      child: const Text(
                        "Нууц үгээ мартсан?",
                        style: TextStyle(color: AppColor.red),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: btn(
                    onPressed: () {},
                    text: "Бүртгүүлэх",
                    color: AppColor.lblPrimary,
                    isColor: true,
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
