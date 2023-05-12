import 'package:flutter/material.dart';

import '../const/colors.dart';

class DefaultScaffold extends StatelessWidget {
  final GlobalKey<ScaffoldState> sKey;
  final EdgeInsets padding;
  final WillPopCallback willPop;

  // body
  final Widget body;
  final bool hasSafeArea;

  // appbar
  final PreferredSizeWidget appBar;

  // drawer
  final Widget drawer;

  // bottom
  final Widget bottomNavigationBar;
  final Widget floatingActionButton;
  final FloatingActionButtonLocation floatingActionButtonLocation;

  DefaultScaffold({
    Key key,
    this.sKey,
    this.body,
    this.padding = EdgeInsets.zero,
    this.willPop,
    this.hasSafeArea = false,
    this.appBar,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var bdy = Container(padding: padding, child: body);

    var bdy2 = hasSafeArea ? SafeArea(child: bdy) : bdy;

    var bdy3 = willPop == null ? bdy2 : WillPopScope(onWillPop: willPop, child: bdy2);

    var scffld = Scaffold(
      backgroundColor: AppColor.white,
      key: sKey,
      appBar: appBar,
      drawer: drawer,
      body: bdy3,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
    );

    return scffld;
  }
}
