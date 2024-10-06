import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo_app/core/config/app_color.dart';
import 'package:todo_app/core/config/app_typography.dart';
import 'package:todo_app/main.dart';

class CustomAppBar extends AppBar {
  final Widget? child;
  final List<Widget>? menu;
  final Widget? closeIcon;
  final Color? bgColor;
  final Function? onBack;
  final bool isClose;
  final bool isBack;
  final SystemUiOverlayStyle? overlayStyle;

  CustomAppBar({
    super.key,
    this.child,
    this.menu,
    this.bgColor,
    this.onBack,
    this.closeIcon,
    this.isClose = false,
    this.isBack = true,
    this.overlayStyle,
  }) : super(
    title: child,
    backgroundColor: AppColor.blueOcean,
    actions: menu,
    elevation: 0,
    titleSpacing: 0,
    scrolledUnderElevation: 0.0,
    systemOverlayStyle: overlayStyle,
    leading: isBack? IconButton(
      icon: Platform.isIOS? const Icon(
        Icons.arrow_back_ios,
        size: 24,
        color: Colors.white,
      ): const Icon(
        Icons.arrow_back,
        size: 24,
        color: Colors.white,
      ),
      onPressed: () {
        if (onBack == null) {
          Navigator.pop(navigatorKey.currentContext!);
        } else {
          onBack.call();
        }
      },
    ): null,
  );

  factory CustomAppBar.titled({
    required String title,
    List<Widget>? menu,
    Function? onBack,
    bool isClose = false,
    bool isBack = true,
  }) {
    return CustomAppBar(
      menu: menu,
      onBack: onBack,
      isClose: isClose,
      isBack: isBack,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          title,
          style: AppTypography.copyWith(
            weight: FontWeight.w700,
            size: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  factory CustomAppBar.untitled({
    Function? onBack,
    bool isClose = false,
    bool isMoreMenu = false,
    Function? onTapMore,
  }) {
    return CustomAppBar(
      onBack: onBack,
      isClose: isClose,
      menu: isMoreMenu? [
        IconButton(
          icon: const Icon(
            Icons.more_horiz,
            size: 24,
            color: Colors.black,
          ),
          onPressed: () => onTapMore?.call(),
        ),
      ]: null,
    );
  }
}
