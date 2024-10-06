import 'package:todo_app/core/util/resource.dart';
import 'package:todo_app/domain/todo/data/data_source/todo_data_source.dart';
import 'package:todo_app/domain/todo/data/models/todo_data.dart';
import 'package:todo_app/domain/todo/domain/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource dataSource;

  TodoRepositoryImpl(this.dataSource);

  @override
  Future<Resource<int>> addOrUpdate(TodoData data) async {
    try {
      final result = await dataSource.addOrUpdate(data);
      return Resource.success(result);
    } catch (ex) {
      return Resource.error("$ex");
    }
  }

  @override
  Future<Resource<int>> delete(TodoData data) async {
    try {
      final result = await dataSource.delete(data);
      return Resource.success(result);
    } catch (ex) {
      return Resource.error("$ex");
    }
  }

  @override
  Future<Resource<List<TodoData>>> getList([bool? status]) async {
    try {
      final result = await dataSource.getList(status);
      return Resource.success(result);
    } catch (ex) {
      return Resource.error("$ex");
    }
  }

}