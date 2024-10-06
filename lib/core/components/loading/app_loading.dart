import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  final EdgeInsets? margin;

  const AppLoading({Key? key, this.margin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: margin,
        child: SizedBox(
          height: 32,
          width: 32,
          child: Platform.isAndroid?
          const CircularProgressIndicator(color: Colors.amber):
          const CupertinoActivityIndicator(radius: 16, color: Colors.amber),
        ),
      ),
    );
  }
}
