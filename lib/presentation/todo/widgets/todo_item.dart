import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todo/todo_bloc.dart';
import 'package:todo_app/blocs/todo/todo_event.dart';
import 'package:todo_app/core/config/app_color.dart';
import 'package:todo_app/core/config/app_typography.dart';
import 'package:todo_app/core/util/app_util.dart';
import 'package:todo_app/domain/todo/data/models/todo_data.dart';

class TodoItem extends StatelessWidget {
  final TodoData data;
  final Function(bool) onCheck;
  final Function? onTap;

  const TodoItem({
    super.key,
    required this.data,
    required this.onCheck,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TodoBloc>();
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () => onTap?.call(),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        decoration: BoxDecoration(
          color: AppColor.analogous.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [BoxShadow(
            color: Colors.black12,
            offset: Offset(2,2),
            blurRadius: 2.5,
          )],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Checkbox(
              value: data.status ?? false,
              onChanged: (v) => onCheck.call(v ?? false),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.description ?? '',
                    style: AppTypography.copyWith(
                      size: 16,
                      weight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.delete,
                size: 24,
                color: Colors.white,
              ),
              onPressed: () async {
                final result = await AppUtil.showAlertDialog(
                  context: context,
                  title: "Delete Task",
                  content: "Are you sure you want to delete this task?",
                  confirmTxt: "Delete",
                  cancelTxt: "Cancel",
                  tapNo: () => Navigator.pop(context, false),
                  tapYes: () => Navigator.pop(context, true),
                );
                if (result == true) bloc.add(DeleteTodo(data));
              },
            )
          ],
        ),
      ),
    );
  }
}
