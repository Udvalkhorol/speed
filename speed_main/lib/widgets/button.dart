import 'package:flutter/material.dart';

import '../themes/app_color.dart';

/// signup & login
Widget btn({
  double height = 60.0,
  double radius = 10.0,
  EdgeInsets margin = EdgeInsets.zero,
  required VoidCallback onPressed,
  required String text,
  Color? color = AppColor.red,
  bool isColor = false,
}) {
  return Semantics(
    hidden: false,
    button: true,
    child: Visibility(
      child: Container(
        height: height,
        margin: margin,
        decoration: BoxDecoration(
            // color: !enabled ? AppColor.btnColor : null,
            color: isColor ? color : AppColor.red,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0.0, 1.5),
                blurRadius: 1.5,
              ),
            ]
            // border: enabled ? null : Border.all(width: 1.0, color: !enabled ? gColor!.lblPrimary : gColor!.lblPrimary),
            ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onPressed,
            borderRadius: BorderRadius.all(Radius.circular(radius)),
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: isColor ? AppColor.red : AppColor.lblPrimary),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
