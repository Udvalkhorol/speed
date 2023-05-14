import 'package:flutter/material.dart';
import 'package:speed_app/widgets/lbl.dart';
import 'package:speed_app/widgets/scaffold.dart';
import '../../utils/helper.dart';
import '../../widgets/appbar.dart';

class HelpScreen extends StatelessWidget {
  static const routeName = "/helpScreen";
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: DefaultAppBar(
        isRemoveLeadingSpace: false,
        title: 'Тусламж',
      ),
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: Helper.getScreenHeight(context) * 0.8,
              width: Helper.getScreenWidth(context),
              child: Center(
                child: lbl('Тун удахгүй'),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
