import 'package:flutter/material.dart';

import '../const/colors.dart';

class lbl extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final String format;
  final String semLabel;
  final bool hidden;
  final int maxLines;
  final TextOverflow overflow;
  final TextAlign textAlign;
  final bool softWrap;
  final bool isCapitalized;
  final TextDecoration decoration;

  lbl(
    this.text, {
    this.fontSize,
    this.fontWeight = FontWeight.normal,
    this.color,
    this.format,
    this.semLabel = '',
    this.hidden = false,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
    this.softWrap = false,
    this.isCapitalized = false,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semLabel,
      hidden: hidden,
      child: Text(
        text,
        // isCapitalized ? text?.toUpperCase() : '',
        maxLines: maxLines,
        overflow: overflow,
        softWrap: softWrap,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color ?? AppColor.blue1,
          height: (maxLines != null && maxLines > 1) ? 1.2 : 1.0,
          decoration: decoration,
        ),
      ),
    );
  }
}

/// BASE DIALOG TITLE
class lblDlgTitle extends StatelessWidget {
  final String text;
  final String semLabel;
  final bool hidden;
  final double titleFontSize;
  final TextAlign textAlign;
  final Color titleColor;

  lblDlgTitle(
    this.text, {
    this.semLabel = '',
    this.hidden = false,
    this.titleFontSize,
    this.textAlign = TextAlign.center,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Semantics(
        label: semLabel,
        hidden: hidden,
        child: Text(
          text,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: titleFontSize,
            fontWeight: FontWeight.bold,
            color: titleColor ?? AppColor.blue1,
          ),
          textAlign: textAlign,
        ),
      ),
    );
  }
}

/// BASE DIALOG TITLE
// ignore: camel_case_types
class lblDlgText extends StatelessWidget {
  final String text;
  final FontWeight textFontWeight;
  final String semLabel;
  final bool hidden;
  final TextAlign textAlign;

  lblDlgText(
    this.text, {
    this.textFontWeight,
    this.semLabel = '',
    this.hidden = false,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
        label: semLabel,
        hidden: hidden,
        child: Text(
          text,
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
          textAlign: textAlign ?? TextAlign.start,
          style: TextStyle(
            // fontSize: gLayout.fontSizeNormal,
            color: AppColor.blue1,
            fontWeight: textFontWeight ?? FontWeight.w400,
          ),
        ));
  }
}
