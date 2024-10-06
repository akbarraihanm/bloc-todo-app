import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/core/util/resource.dart';
import 'package:todo_app/domain/todo/domain/use_case/delete_todo_use_case.dart';

import '../../data/models/todo_data_test.dart';
import 'add_update_todo_use_case_test.dart';

void main() {
  late DeleteTodoUseCase useCase;
  final repository = MockTodoRepository();
  final todo = MockTodoData();

  setUpAll(() {
    useCase = DeleteTodoUseCase(repository);
  });

  group('DeleteTodoUseCase test', () {
    todo.status = false;
    todo.description = 'desc';
    todo.id = 'id';

    when(() => repository.delete(todo)).thenAnswer((_) async => Resource.success(1));

    test('When delete() success, then it should return 1', () async {
      final result = await useCase(todo);
      expect(result.data, 1);
    });
  });
}