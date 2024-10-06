import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/core/config/app_typography.dart';
import 'package:todo_app/main.dart';

class AppUtil {
  static bindingInstance(Function function) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      function.call();
    });
  }

  static Future openBottomSheet(BuildContext context, Widget child) async {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      enableDrag: true,
      builder: (_) => Material(
        color: Colors.transparent,
        child: child,
      ),
    );
  }

  static void forceCloseApp(String msg) {
    bindingInstance(() {
      Fluttertoast.showToast(msg: msg);
      Navigator.popUntil(navigatorKey.currentContext!, (route) => route.isFirst);
      exit(100);
    });
  }

  static Future showAlertDialog({
    required BuildContext context,
    String? title,
    String? content,
    String? cancelTxt,
    String? confirmTxt,
    Function? tapNo,
    Function? tapYes,
  }) async {
    return await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          title ?? "",
          style: AppTypography.copyWith(
            size: 16,
            weight: FontWeight.w700,
          ),
        ),
        content: Text("$content"),
        actions: [
          TextButton(
            onPressed: () => tapNo?.call(),
            child: Text(
              "$cancelTxt",
              style: AppTypography.copyWith(
                weight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
          ),
          TextButton(
            onPressed: () => tapYes?.call(),
            child: Text(
              "$confirmTxt",
              style: AppTypography.copyWith(
                weight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}