import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/core/util/resource.dart';
import 'package:todo_app/domain/todo/domain/use_case/get_list_todo_use_case.dart';

import '../../data/models/todo_data_test.dart';
import 'add_update_todo_use_case_test.dart';

void main() {
  late GetListTodoUseCase useCase;
  final repository = MockTodoRepository();
  final todo = MockTodoData();

  setUpAll(() {
    useCase = GetListTodoUseCase(repository);
  });

  group('GetListTodoUseCase test', () {
    todo.description = 'desc';
    todo.status = false;

    when(() => repository.getList(false)).thenAnswer((_) async => Resource.success([todo]));

    test('When getList() success, then it should return correct list', () async {
      final result = await useCase(false);
      expect(result.data, [todo]);
    });
  });
}