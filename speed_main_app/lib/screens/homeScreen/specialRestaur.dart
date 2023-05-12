import 'package:flutter/material.dart';
import 'package:speed_app/widgets/scaffold.dart';

import '../../const/colors.dart';
import '../../utils/helper.dart';
import '../../widgets/appbar.dart';
import '../../widgets/cards.dart';
import '../../widgets/customNavBar.dart';

class SpecialRes extends StatelessWidget {
  static const routeName = "/specialRes";

  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      appBar: DefaultAppBar(
        isRemoveLeadingSpace: false,
        title: 'Онцгой харилцагч',
      ),
      body: SafeArea(
        child: Container(
          height: Helper.getScreenHeight(context),
          width: Helper.getScreenWidth(context),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30),
                OfferCard(
                  image: Image.asset(
                    Helper.getAssetName("breakfast.jpg", "real"),
                    fit: BoxFit.cover,
                  ),
                  name: "Tous Le Jours",
                ),
                OfferCard(
                  image: Image.asset(
                    Helper.getAssetName("western2.jpg", "real"),
                    fit: BoxFit.cover,
                  ),
                  name: "Нарийн боов",
                ),
                OfferCard(
                  image: Image.asset(
                    Helper.getAssetName("coffee3.jpg", "real"),
                    fit: BoxFit.cover,
                  ),
                  name: "Cafe Bene Mongolia",
                ),
                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
