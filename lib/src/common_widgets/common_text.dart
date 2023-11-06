import 'package:drive_seller/src/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final String text;
  final double? fontSize, height;
  final Color? color;
  final FontWeight? fontWeight;
  const CommonText({
    Key? key,
    required this.text,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? AppColors.blackText,
        fontFamily: 'Public Sans',
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w400,
        height: height,
      ),
    );
  }
}
