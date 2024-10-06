import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';

extension NumExtension on num {
  double get fromWidthPct => MediaQuery
      .sizeOf(navigatorKey.currentContext!)
      .width*(this/100);

  double get fromHeightPct => MediaQuery
      .sizeOf(navigatorKey.currentContext!)
      .height*(this/100);

  SizedBox get spaceWidth => SizedBox(width: double.tryParse("$this"));
  SizedBox get spaceHeight => SizedBox(height: double.tryParse("$this"));
}