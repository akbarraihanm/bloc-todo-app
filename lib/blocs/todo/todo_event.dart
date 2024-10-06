import 'package:todo_app/domain/todo/data/models/todo_data.dart';

abstract class TodoEvent {}

class GetListTodo extends TodoEvent {
  int? status;

  GetListTodo([this.status]);
}

class ValidateTodo extends TodoEvent {
  TodoData? data;

  ValidateTodo([this.data]);
}

class AddUpdateTodo extends TodoEvent {
  TodoData? data;

  AddUpdateTodo([this.data]);
}

class DeleteTodo extends TodoEvent {
  TodoData data;

  DeleteTodo(this.data);
}