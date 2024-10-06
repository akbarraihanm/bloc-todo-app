import 'package:todo_app/core/util/resource.dart';
import 'package:todo_app/core/util/use_case.dart';
import 'package:todo_app/domain/todo/data/models/todo_data.dart';
import 'package:todo_app/domain/todo/domain/repository/todo_repository.dart';

class GetListTodoUseCase extends UseCase<List<TodoData>, bool?> {
  final TodoRepository repository;

  GetListTodoUseCase(this.repository);

  @override
  Future<Resource<List<TodoData>>> call(bool? param) {
    return repository.getList(param);
  }

}