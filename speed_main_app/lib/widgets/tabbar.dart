import 'package:flutter/material.dart';

import '../const/colors.dart';
import 'lbl.dart';

Widget tabBar({
  TabController tabController,
  List<TabItem> tabItems,
  EdgeInsets margin = EdgeInsets.zero,
}) {
  return Container(
    margin: margin,
    color: AppColor.white,
    child: Stack(
      children: [
        // Bottom border
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: AppColor.red, width: 0.8),
              ),
            ),
          ),
        ),

        // Tabs
        Material(
            color: AppColor.white,
            child: TabBar(
              // onTap: (int index) => app.tranCurrentTabIndex = index,
              labelColor: AppColor.blackAlpha80,
              unselectedLabelColor: Colors.red,
              tabs: tabItems,
              controller: tabController,
              indicatorColor: AppColor.white,
              indicatorSize: TabBarIndicatorSize.tab,
            )),
      ],
    ),
  );
}

class TabItem extends StatelessWidget {
  @required
  final String text;
  final String semLabel;
  final Widget child;
  final Widget icon;
  final EdgeInsetsGeometry iconMargin;

  TabItem({
    this.text,
    this.semLabel,
    this.child,
    this.icon,
    this.iconMargin,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      child: Tab(text: text, child: child, icon: icon, iconMargin: iconMargin ?? EdgeInsets.only(bottom: 10.0)),
      hidden: false,
      label: text,
      button: true,
    );
  }
}

Widget tabLbl(
  String text, {
  final double fontSize,
  final TextOverflow overflow,
  final bool softWrap,
}) {
  return lbl(
    text.toUpperCase(),
    fontWeight: FontWeight.w500,
    fontSize: fontSize,
    softWrap: softWrap ?? false,
    overflow: overflow,
    semLabel: text,
    textAlign: TextAlign.center,
  );
}

Widget txnTabLbl(
  String text, {
  final double fontSize,
  final TextOverflow overflow,
  final bool softWrap,
}) {
  return lbl(
    text.toUpperCase(),
    fontWeight: FontWeight.w700,
    fontSize: fontSize,
    softWrap: softWrap ?? false,
    overflow: overflow,
    semLabel: text,
    textAlign: TextAlign.center,
  );
}
