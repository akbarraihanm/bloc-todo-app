import 'package:flutter/material.dart';

class AppTypography extends TextStyle {
  final double? size;
  final Color? fontColor;
  final FontWeight? weight;
  final FontStyle? style;

  const AppTypography({
    this.size = 14,
    this.fontColor = Colors.black,
    this.weight = FontWeight.normal,
    this.style = FontStyle.normal,
  }) : super(
    color: fontColor,
    fontSize: size,
    fontWeight: weight,
    fontStyle: style,
  );

  factory AppTypography.copyWith({
    double? size,
    Color? color,
    FontWeight? weight,
    FontStyle? fontStyle,
  }) {
    return AppTypography(
      size: size,
      fontColor: color,
      style: fontStyle,
      weight: weight,
    );
  }
}
