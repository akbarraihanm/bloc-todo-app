import 'package:flutter/material.dart';

import '../../config/app_typography.dart';

class AppButton extends StatelessWidget {
  final Function? onPressed;
  final double? height;
  final double? width;
  final Widget? child;
  final bool isEnable;
  final double? radius;
  final String? title;
  final double? elevation;
  final Color? color;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  const AppButton(
      {Key? key,
        this.onPressed,
        this.height,
        this.width,
        this.child,
        this.isEnable = true,
        this.radius = 6,
        this.title,
        this.elevation,
        this.textStyle,
        this.padding,
        this.margin,
        this.color,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: MaterialButton(
        onPressed: () {
          if (isEnable) onPressed?.call();
        },
        height: height ?? 42,
        minWidth: width ?? double.infinity,
        color: isEnable ? color ?? Colors.blue : Colors.grey,
        elevation: elevation ?? 2.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius!)),
        child: title != null ? Text(
          title ?? "",
          style: textStyle ?? AppTypography.copyWith(
            size: 14,
            weight: FontWeight.w500,
            color: Colors.white,
          ),
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ) : child,
      ),
    );
  }
}