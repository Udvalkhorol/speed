import 'package:flutter/material.dart';

import '../const/colors.dart';

class Separator extends StatelessWidget {
  Separator({
    this.height = 1.0,
    this.margin = EdgeInsets.zero,
    this.color,
  });

  final double height;
  final EdgeInsets margin;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      color: color ?? AppColor.blue2,
    );
  }
}

class SeparatorWithChild extends StatelessWidget {
  SeparatorWithChild(
    this.child, {
    this.margin = EdgeInsets.zero,
    this.color,
  });

  final Widget child;
  final EdgeInsets margin;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        child,
        Separator(
          margin: margin,
          color: color,
        ),
      ],
    );
  }
}

class SeparatorDate extends StatelessWidget {
  SeparatorDate({
    this.date,
    this.height = 1.0,
    this.margin = EdgeInsets.zero,
    this.color,
  });

  final double height;
  final EdgeInsets margin;
  final Color color;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 20),
        Expanded(
          child: Container(
            margin: margin,
            height: height,
            color: color ?? AppColor.blue2,
          ),
        ),
        // SizedBox(width: gLayout.marginNormal),
        // lbl('${DateFormat('yyyy.MM.dd').format(date)}', color: gColor?.lblCaptionGray),
        // SizedBox(width: gLayout.marginNormal),
        Expanded(
          child: Container(
            margin: margin,
            height: height,
            color: color ?? AppColor.blue2,
          ),
        ),
        // SizedBox(width: gLayout.marginLong),
      ],
    );
  }
}
