import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/blocs/todo/todo_bloc.dart';
import 'package:todo_app/blocs/todo/todo_event.dart';
import 'package:todo_app/blocs/todo/todo_state.dart';
import 'package:todo_app/core/components/button/app_button.dart';
import 'package:todo_app/core/components/form/app_form_field.dart';
import 'package:todo_app/core/config/app_color.dart';
import 'package:todo_app/core/config/app_typography.dart';
import 'package:todo_app/core/extensions/double_extension.dart';
import 'package:todo_app/core/util/app_util.dart';
import 'package:todo_app/domain/todo/data/models/todo_data.dart';

class AddTodoItem extends StatelessWidget {
  final TodoData? data;

  const AddTodoItem({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TodoBloc>();
    return BlocConsumer<TodoBloc, TodoState>(
      listener: (context, state) => AppUtil.bindingInstance(() {
        state.when(
          onError: (msg) => Fluttertoast.showToast(msg: msg),
          onCreated: (msg) => Navigator.pop(context, true),
        );
      }),
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.viewInsetsOf(context).bottom,
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: AppColor.analogous,
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
            child: Column(
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
                      "Add To-do",
                      style: AppTypography.copyWith(
                        size: 16,
                        weight: FontWeight.w600,
                        color: Colors.white
                      ),
                    ),
                  ],
                ),
                16.spaceHeight,
                AppFormField(
                  hint: "Input To-Do",
                  height: 50,
                  padding: const EdgeInsets.all(12),
                  controller: bloc.ctrl,
                  hintColor: Colors.grey,
                  bgColor: Colors.white,
                  radius: 12,
                  margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  onChanged: (v) {
                    bloc.body.description = v;
                    if (v.isEmpty) bloc.body.description = null;
                    bloc.add(ValidateTodo());
                  },
                ),
                AppButton(
                  title: "Save",
                  margin: const EdgeInsets.all(16),
                  isEnable: bloc.isValid,
                  radius: 12,
                  onPressed: () => bloc.add(AddUpdateTodo()),
                )
              ],
            ),
          ),
        );
      }
    );
  }
}
