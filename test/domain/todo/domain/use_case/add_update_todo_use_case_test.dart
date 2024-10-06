import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/core/util/resource.dart';
import 'package:todo_app/domain/todo/domain/repository/todo_repository.dart';
import 'package:todo_app/domain/todo/domain/use_case/add_update_todo_use_case.dart';

import '../../data/models/todo_data_test.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  late AddUpdateTodoUseCase useCase;
  final repository = MockTodoRepository();
  final todo = MockTodoData();

  setUpAll(() {
    useCase = AddUpdateTodoUseCase(repository);
  });

  group('AddUpdateTodoUseCase test', () {
    todo.description = 'desc';
    todo.status = false;

    when(() => repository.addOrUpdate(todo)).thenAnswer((_) async => Resource.success(1));

    test('When add/update, then it should return 1', () async {
      final result = await useCase(todo);
      expect(result.data, 1);
    });
  });
}