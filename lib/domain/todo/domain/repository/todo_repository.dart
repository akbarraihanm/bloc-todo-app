import 'package:todo_app/core/util/resource.dart';
import 'package:todo_app/domain/todo/data/models/todo_data.dart';

abstract class TodoRepository {
  Future<Resource<int>> addOrUpdate(TodoData data);
  Future<Resource<int>> delete(TodoData data);
  Future<Resource<List<TodoData>>> getList([bool? status]);
}