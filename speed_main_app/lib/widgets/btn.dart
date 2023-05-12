import 'package:flutter/material.dart';

import '../const/colors.dart';

/// signup & login
Widget btn({
  double height = 60.0,
  double radius = 10.0,
  EdgeInsets margin = EdgeInsets.zero,
  VoidCallback onPressed,
  String text,
  Color color = AppColor.red,
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

Widget btnIconWithBg({VoidCallback onPressed, String semLabel, IconData icon, String img, double size, Color color, Color bgColor, bool enabled = true, bool hasBorderRadius = true, bool hasBorderColor = false, bool isSquare = true}) {
  return Material(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0), side: BorderSide(color: hasBorderColor ? AppColor.blue2 : Colors.transparent)),
      elevation: 0.0,
      clipBehavior: Clip.hardEdge,
      color: bgColor,
      child: Semantics(
        label: semLabel,
        hidden: false,
        button: true,
        child: InkWell(
          onTap: enabled ? onPressed : null,
          child: icon != null
              ? Padding(
                  padding: isSquare ? EdgeInsets.all(8) : EdgeInsets.only(left: 16.0, right: 16, top: 8, bottom: 8),
                  child: Icon(
                    icon,
                    size: size ?? 24.0,
                    color: color ?? AppColor.white,
                  ),
                )
              : Image.asset(
                  img ?? '',
                  color: color,
                  width: size ?? 20.0,
                  height: size ?? 28.0,
                ),
        ),
      ));
}
