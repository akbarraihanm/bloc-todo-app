import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_app/blocs/todo/todo_bloc.dart';
import 'package:todo_app/blocs/todo/todo_event.dart';
import 'package:todo_app/blocs/todo/todo_state.dart';
import 'package:todo_app/core/components/app_bar/app_bar.dart';
import 'package:todo_app/core/config/app_color.dart';
import 'package:todo_app/core/config/app_typography.dart';
import 'package:todo_app/core/extensions/double_extension.dart';
import 'package:todo_app/core/util/app_util.dart';
import 'package:todo_app/di/app_locator.dart';
import 'package:todo_app/presentation/todo/widgets/add_todo_item.dart';
import 'package:todo_app/presentation/todo/widgets/filter_todo_item.dart';
import 'package:todo_app/presentation/todo/widgets/todo_item.dart';

class TodoScreen extends StatelessWidget {
  static const routeName = '/todo';

  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<TodoBloc>();
    return Scaffold(
      appBar: CustomAppBar.titled(
        title: "Todo",
        isBack: false,
        menu: [
          IconButton(
            icon: const Icon(
              Icons.filter_alt,
              size: 24,
              color: Colors.white,
            ),
            onPressed: () async {
              final result = await AppUtil.openBottomSheet(
                context, BlocProvider<TodoBloc>(
                  create: (_) {
                    final b = TodoBloc(sl(), sl(), sl());
                    b.isCompleted = bloc.isCompleted;
                    return b;
                  },
                  child: FilterTodoItem(
                    value: bloc.isCompleted,
                    onTap: (v) {
                      Navigator.pop(context);
                      bloc.isCompleted = v;
                      bloc.add(GetListTodo(v));
                    },
                  ),
                ),
              );
              if (result == 0) {
                bloc.isCompleted = null;
                bloc.add(GetListTodo());
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColor.blueOcean,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 28,
        ),
        onPressed: () async {
          final result = await AppUtil.openBottomSheet(
            context, BlocProvider<TodoBloc>(
              create: (_) => TodoBloc(sl(), sl(), sl()),
              child: const AddTodoItem(),
            ),
          );
          if (result == true) bloc.add(GetListTodo());
        },
      ),
      body: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) => AppUtil.bindingInstance(() {
          state.when(
            onError: (msg) => Fluttertoast.showToast(msg: msg),
            onCreated: (msg) => bloc.add(GetListTodo()),
          );
        }),
        builder: (context, state) {
          return state.buildWhen(
            onEmpty: Center(
              child: Text(
                "Data kosong. Silahkan membuat data baru",
                style: AppTypography.copyWith(
                  size: 14,
                  color: Colors.grey,
                ),
              ),
            ),
            onInit: ListView.separated(
              itemCount: bloc.list.length,
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              separatorBuilder: (_, __) => 16.spaceHeight,
              itemBuilder: (context, pos) {
                final data = bloc.list[pos];
                return TodoItem(
                  data: data,
                  onTap: () async {
                    final result = await AppUtil.openBottomSheet(
                      context, BlocProvider<TodoBloc>(
                      create: (_) => TodoBloc(sl(), sl(), sl())..add(
                        ValidateTodo(data),
                      ),
                      child: const AddTodoItem(),
                    ));
                    if (result == true) bloc.add(GetListTodo());
                  },
                  onCheck: (v) {
                    bloc.body = data;
                    bloc.body.status = v;
                    bloc.add(AddUpdateTodo(bloc.body));
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
