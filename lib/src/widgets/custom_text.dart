import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? height;

  const CustomText(
    this.text, {
    Key? key,
    this.textColor,
    this.fontWeight,
    this.textDecoration,
    this.maxLines,
    this.textAlign,
    this.fontSize = 16,
    this.overflow,
    this.height = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      textAlign: textAlign,
      maxLines: maxLines ?? 100,
      overflow: overflow,
      style: textStyle(
        fontWeight: fontWeight,
        fontSize: fontSize,
        textColor: textColor,
        textDecoration: textDecoration,
        height: height,
      ),
    );
  }
}

/// Parametros necesarios para el control del tkdjjd
// ignore: long-parameter-list
textStyle(
        {FontWeight? fontWeight,
        double? fontSize,
        Color? textColor,
        TextDecoration? textDecoration,
        double? height,
        bool? darkMode}) =>
    TextStyle(
        fontFamily: 'Golos',
        fontWeight: fontWeight ?? FontWeight.w400,
        fontSize: fontSize,
        color: textColor,
        decoration: textDecoration ?? TextDecoration.none,
        height: height);
