import 'package:todo_app/core/util/resource.dart';
import 'package:todo_app/core/util/use_case.dart';
import 'package:todo_app/domain/todo/data/models/todo_data.dart';
import 'package:todo_app/domain/todo/domain/repository/todo_repository.dart';

class DeleteTodoUseCase extends UseCase<int, TodoData> {
  final TodoRepository repository;

  DeleteTodoUseCase(this.repository);

  @override
  Future<Resource<int>> call(TodoData param) {
    return repository.delete(param);
  }

}