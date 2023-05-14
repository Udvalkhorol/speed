import 'package:flutter/material.dart';
import 'package:speed_app/widgets/btn.dart';
import 'package:speed_app/widgets/scaffold.dart';
import '../../utils/helper.dart';
import '../../widgets/appbar.dart';
import '../../widgets/customTextInput.dart';
import '../login/introScreen.dart';

class NewPwScreen extends StatelessWidget {
  static const routeName = "/newPw";

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: DefaultAppBar(
        isRemoveLeadingSpace: false,
        title: "Шинэ нууц үг тохируулах",
      ),
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenHeight(context),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Та цаашид системд нэвтрэхдээ ашиглах нууц үгээ оруулна уу",
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextInput(hintText: "Шинэ нууц үг"),
                SizedBox(
                  height: 20,
                ),
                CustomTextInput(
                  hintText: "Нууц үгээ дахин оруулах",
                ),
                SizedBox(height: 20),
                SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: btn(
                        text: "Үргэлжлүүлэх",
                        onPressed: () {
                          Navigator.of(context).pushNamed(IntroScreen.routeName);
                        }))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
