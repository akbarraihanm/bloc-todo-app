import 'package:flutter/material.dart';
import 'package:todo_app/core/config/app_color.dart';
import 'package:todo_app/core/config/app_typography.dart';
import 'package:todo_app/core/extensions/double_extension.dart';

class FilterTodoItem extends StatelessWidget {
  final Function(int?)? onTap;
  final int? value;

  const FilterTodoItem({super.key, this.onTap, this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColor.analogous,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.close,
                  size: 24,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              Text(
                "Filter",
                style: AppTypography.copyWith(
                    size: 16,
                    weight: FontWeight.w600,
                    color: Colors.white
                ),
              ),
            ],
          ),
          16.spaceHeight,
          Theme(
            data: ThemeData(
              checkboxTheme: const CheckboxThemeData(
                side: BorderSide(color: Colors.white),
              ),
            ),
            child: CheckboxListTile(
              onChanged: (v) {
                if (v == true) {
                  onTap?.call(1);
                } else {
                  onTap?.call(null);
                }
              },
              value: value == 1? true: false,
              title: Text(
                "Completed",
                style: AppTypography.copyWith(
                  weight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Theme(
            data: ThemeData(
              checkboxTheme: const CheckboxThemeData(
                side: BorderSide(color: Colors.white),
              ),
            ),
            child: CheckboxListTile(
              onChanged: (v) {
                if (v == true) {
                  onTap?.call(2);
                } else {
                  onTap?.call(null);
                }
              },
              value: value == 2? true: false,
              title: Text(
                "Incompleted",
                style: AppTypography.copyWith(
                  weight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
