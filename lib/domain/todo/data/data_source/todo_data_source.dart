import 'package:todo_app/domain/todo/data/models/todo_data.dart';
import 'package:todo_app/domain/todo/data/service/todo_service.dart';

abstract class TodoDataSource {
  Future<int> addOrUpdate(TodoData data);
  Future<int> delete(TodoData data);
  Future<List<TodoData>> getList([bool? status]);
}

class TodoDataSourceImpl implements TodoDataSource {
  final TodoService service;

  TodoDataSourceImpl(this.service);

  @override
  Future<int> addOrUpdate(TodoData data) {
    return service.addOrUpdate(data);
  }

  @override
  Future<int> delete(TodoData data) {
    return service.delete(data);
  }

  @override
  Future<List<TodoData>> getList([bool? status]) {
    return service.getList(status);
  }

}