import 'package:todo_app/core/util/resource.dart';
import 'package:todo_app/core/util/use_case.dart';
import 'package:todo_app/domain/todo/data/models/todo_data.dart';
import 'package:todo_app/domain/todo/domain/repository/todo_repository.dart';

class AddUpdateTodoUseCase extends UseCase<int, TodoData> {
  final TodoRepository repository;

  AddUpdateTodoUseCase(this.repository);

  @override
  Future<Resource<int>> call(TodoData param) {
    return repository.addOrUpdate(param);
  }

}