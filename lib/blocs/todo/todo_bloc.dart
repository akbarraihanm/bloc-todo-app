import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/blocs/todo/todo_event.dart';
import 'package:todo_app/blocs/todo/todo_state.dart';
import 'package:todo_app/domain/todo/data/models/todo_data.dart';
import 'package:todo_app/domain/todo/domain/use_case/add_update_todo_use_case.dart';
import 'package:todo_app/domain/todo/domain/use_case/delete_todo_use_case.dart';
import 'package:todo_app/domain/todo/domain/use_case/get_list_todo_use_case.dart';
import 'package:uuid/uuid.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final AddUpdateTodoUseCase _addUpdate;
  final DeleteTodoUseCase _delete;
  final GetListTodoUseCase _getList;

  List<TodoData> _list = [];
  List<TodoData> get list => _list;

  final ctrl = TextEditingController();
  var body = TodoData();
  bool isValid = false;
  int? isCompleted;

  TodoBloc(
      this._addUpdate,
      this._delete,
      this._getList,
      ): super(InitTodo()) {
    on<GetListTodo>((event, emit) async {
      bool? status = isCompleted == 1? true: isCompleted == 2? false : null;
      final result = await _getList(status);
      result.when(
        onError: (msg) => emit(ErrorTodo(msg)),
        onSuccess: (data) {
          _list = data ?? [];
          emit(InitTodo(_list.isEmpty));
        },
      );
    });

    on<DeleteTodo>((event, emit) async {
      final result = await _delete(event.data);
      result.when(
        onError: (msg) => emit(ErrorTodo(msg)),
        onSuccess: (data) => add(GetListTodo()),
      );
    });

    on<ValidateTodo>((event, emit) {
      isValid = false;
      if (event.data != null) {
        body = event.data ?? body;
        ctrl.text = body.description ?? '';
      }
      if (body.description != null) isValid = true;
      emit(InitTodo());
    });

    on<AddUpdateTodo>((event, emit) async {
      if (event.data != null) {
        body = event.data ?? body;
      } else {
        body.id ??= const Uuid().v4();
      }
      final result = await _addUpdate(body);
      result.when(
        onError: (msg) => emit(ErrorTodo(msg)),
        onSuccess: (data) {
          emit(SuccessTodo(
            'To-do has been ${event.data != null? 'updated': 'created'}',
          ));
        },
      );
    });
  }

}