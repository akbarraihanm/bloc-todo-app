import 'package:flutter/material.dart';
import 'package:todo_app/core/config/app_typography.dart';

class AppFormField extends StatelessWidget {
  final double? height;
  final double? width;
  final double? radius;
  final Color? borderColor;
  final Color? bgColor;
  final String? hint;
  final Color? hintColor;
  final bool? isEnable;
  final bool isPassword;
  final bool isPasswordHidden;
  final TextInputType? inputType;
  final bool isMultiline;
  final int? maxLength;
  final int? maxLines;
  final double? contentPaddingVert;
  final TextEditingController? controller;
  final Function(String v)? onChanged;
  final Function(String v)? onSubmit;
  final Function(bool a)? onTapPassword;
  final FocusNode? focusNode;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Function? onTap;

  const AppFormField(
      {super.key,
      this.height,
      this.width,
      this.borderColor,
      this.hint,
      this.isEnable,
      this.inputType,
      this.isMultiline = false,
      this.controller,
      this.onChanged,
      this.onSubmit,
      this.bgColor,
      this.isPassword = false,
        this.hintColor,
      this.onTapPassword,
      this.isPasswordHidden = false,
      this.radius = 4,
      this.maxLength,
      this.contentPaddingVert,
      this.focusNode,
      this.margin,
      this.padding,
        this.onTap,
        this.maxLines,
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: bgColor ?? Colors.transparent,
        border: Border.all(color: borderColor ?? Colors.transparent),
        borderRadius: BorderRadius.circular(radius!),
      ),
      child: InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: () => onTap?.call(),
        child: Row(
          crossAxisAlignment: isMultiline
              ? CrossAxisAlignment.start
              : CrossAxisAlignment.center,
          children: [
            Expanded(
              child: TextFormField(
                controller: controller,
                enabled: isEnable,
                focusNode: focusNode,
                maxLength: maxLength,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    hintText: hint,
                    counterText: "",
                    isCollapsed: true,
                    isDense: true,
                    hintStyle: AppTypography.copyWith(
                      color: hintColor ?? Colors.black12,
                      size: 14,
                      weight: FontWeight.normal,
                    ),
                    hintMaxLines: isMultiline ? null : 2,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    fillColor: Colors.transparent,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(4)),
                style: AppTypography.copyWith(
                  color: Colors.black,
                  size: 14,
                  weight: FontWeight.normal,
                ),
                obscureText: isPassword,
                keyboardType: inputType ?? TextInputType.text,
                onChanged: onChanged,
                onFieldSubmitted: onSubmit,
                maxLines: isMultiline ? maxLines : 1,
                textInputAction: isMultiline
                    ? TextInputAction.newline
                    : TextInputAction.done,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DefaultAppFormField extends StatelessWidget {
  final double? height;
  final double? width;
  final String? hint;
  final bool? isEnable;
  final TextInputType? inputType;
  final bool isMultiline;
  final int? maxLength;
  final TextEditingController? controller;
  final Function(String v)? onChanged;
  final Function(String v)? onSubmit;
  final FocusNode? focusNode;
  final double? fontSize;
  final Color? fontColor;
  final bool? obscure;
  final TextAlign? textAlign;
  final EdgeInsets? margin;
  final String? errorText;

  const DefaultAppFormField(
      {super.key,
      this.height,
      this.width,
      this.hint,
      this.isEnable,
      this.inputType,
      this.isMultiline = false,
      this.maxLength,
      this.controller,
      this.onChanged,
      this.onSubmit,
      this.focusNode,
      this.fontSize,
      this.fontColor,
      this.obscure,
      this.textAlign,
      this.margin,
      this.errorText});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: TextFormField(
        controller: controller,
        enabled: isEnable,
        focusNode: focusNode,
        maxLength: maxLength,
        textAlign: textAlign ?? TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
            hintText: hint,
            counterText: "",
            isCollapsed: true,
            isDense: true,
            errorText: errorText,
            hintStyle: AppTypography.copyWith(
              color: Colors.grey,
              size: 14,
              weight: FontWeight.normal,
            ),
            hintMaxLines: isMultiline ? null : 2,
            fillColor: Colors.transparent,
            contentPadding: const EdgeInsets.all(4)),
        style: TextStyle(
          color: fontColor ?? Colors.black,
          fontSize: fontSize ?? 14,
        ),
        obscureText: obscure ?? false,
        keyboardType: inputType ?? TextInputType.text,
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        maxLines: isMultiline ? null : 1,
      ),
    );
  }
}
