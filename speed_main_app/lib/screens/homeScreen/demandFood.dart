import 'package:flutter/material.dart';
import 'package:speed_app/widgets/scaffold.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';
import '../../widgets/appbar.dart';
import '../../widgets/cards.dart';
import '../../widgets/customNavBar.dart';

class DemandFood extends StatelessWidget {
  static const routeName = "/demandFood";

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: DefaultAppBar(
        isRemoveLeadingSpace: false,
        title: 'Эрэлттэй',
      ),
      body: Container(
        height: Helper.getScreenHeight(context),
        width: Helper.getScreenWidth(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MostPopularCard(
                image: Image.asset(
                  Helper.getAssetName("pizza4.jpg", "real"),
                  fit: BoxFit.cover,
                ),
                name: "Pizza",
              ),
              SizedBox(height: 30),
              MostPopularCard(
                name: "Sandwich",
                image: Image.asset(
                  Helper.getAssetName("dessert3.jpg", "real"),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
