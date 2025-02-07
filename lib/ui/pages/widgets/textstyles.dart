import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FontFamily {
  static const spprotext = 'Poppins';
}

class AppTextStyles {
  static TextStyle extralarge = TextStyle(
      fontSize: 24.spMin,
      fontWeight: FontWeight.w800,
      fontFamily: FontFamily.spprotext);

  static TextStyle large = TextStyle(
      fontSize: 20.spMin,
      fontWeight: FontWeight.w600,
      fontFamily: FontFamily.spprotext);
  static TextStyle normal = TextStyle(
      fontSize: 14.spMin,
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.6),
      fontFamily: FontFamily.spprotext);
  TextStyle medium = TextStyle(
      fontSize: 16.spMin,
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.6),
      fontFamily: FontFamily.spprotext);
  static TextStyle small = TextStyle(
      fontSize: 12.spMin,
      fontWeight: FontWeight.w500,

      // height: 1.6.h,
      color: Colors.black.withOpacity(0.6),
      fontFamily: FontFamily.spprotext);
  static TextStyle extraSmall = TextStyle(
      fontSize: 10.spMin,
      fontWeight: FontWeight.w500,
      color: Colors.black.withOpacity(0.7),
      fontFamily: FontFamily.spprotext);
}

class AppText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final String? family;
  const AppText(this.text, {super.key, this.textStyle, this.family});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: textStyle?.copyWith(fontFamily: family) ??
          AppTextStyles.normal.copyWith(fontFamily: family),
    );
  }
}
