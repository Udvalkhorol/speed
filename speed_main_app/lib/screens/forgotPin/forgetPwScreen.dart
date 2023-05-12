import 'package:flutter/material.dart';
import 'package:speed_app/widgets/scaffold.dart';

import '../../utils/helper.dart';
import '../../widgets/appbar.dart';
import '../../widgets/btn.dart';
import '../../widgets/customTextInput.dart';
import 'sentOTPScreen.dart';

class ForgetPwScreen extends StatelessWidget {
  static const routeName = "/restpwScreen";
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: DefaultAppBar(
        isRemoveLeadingSpace: false,
        title: "Нууц үг мартсан",
      ),
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenWidth(context),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
              vertical: 30,
            ),
            child: Column(
              children: [
                Spacer(),
                Text(
                  "Та өөрийн бүртгэлтэй утасны дугаараа оруулна уу",
                  textAlign: TextAlign.center,
                ),
                Spacer(flex: 2),
                CustomTextInput(hintText: "Утас"),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: btn(
                      text: 'Илгээх',
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(SendOTPScreen.routeName);
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
