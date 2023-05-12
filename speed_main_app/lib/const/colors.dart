import 'package:flutter/material.dart';

class AppColor {
  // base colors

  static const primary = Color(0xFF4A4B4D);
  static const secondary = Color(0xFF7C7D7E);
  static const placeholder = Color(0xFFB6B7B7);
  static const placeholderBg = Color(0xFFF2F2F2);
  static const red = Colors.red;

  static const lblPrimary = Color(0xFFF2F2F2);

  //blue
  static const blue2 = Color(0xFF616F8D);
  static const blue1 = Color(0xFF1C2D50);

  // gray
  static const gray = Color(0xFFECECFC);
  static const gray2 = Color(0xFFA8B1C3);
  static const gray10 = Color(0xFF5F5F5F);

  static const black = Color(0xFF000000);
  static const white = Color(0xFFFFFFFF);

  static const blackAlpha80 = Color(0xCC000000);

  LinearGradient appBar = const LinearGradient(colors: [AppColor.white, AppColor.white], begin: Alignment.centerLeft, end: Alignment.centerRight);
  LinearGradient button = const LinearGradient(colors: [AppColor.red, AppColor.red], begin: Alignment.centerLeft, end: Alignment.centerRight);
}
