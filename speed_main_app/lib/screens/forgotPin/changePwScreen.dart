import 'package:flutter/material.dart';
import 'package:speed_app/widgets/scaffold.dart';

import '../../utils/helper.dart';
import '../../widgets/appbar.dart';
import '../../widgets/btn.dart';
import '../../widgets/customTextInput.dart';
import 'sentOTPScreen.dart';

class ChangePwScreen extends StatefulWidget {
  static const routeName = "/changePwScreen";

  @override
  _ChangePwScreen createState() => _ChangePwScreen();
}

class _ChangePwScreen extends State<ChangePwScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: DefaultAppBar(
        isRemoveLeadingSpace: false,
        title: "Нууц үг солих",
      ),
      body: Container(
        width: Helper.getScreenWidth(context),
        height: Helper.getScreenWidth(context),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [
              Spacer(),
              Text(
                "Та өөрийн бүртгэлтэй утасны дугаараа оруулна уу",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              CustomTextInput(hintText: "Хуучин нууц үг"),
              SizedBox(height: 20),
              CustomTextInput(hintText: "Шинэ нууц үг"),
              SizedBox(height: 20),
              CustomTextInput(hintText: "Шинэ нууц үг"),
              SizedBox(height: 20),
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
    );
  }
}
