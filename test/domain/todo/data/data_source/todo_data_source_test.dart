import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/domain/todo/data/data_source/todo_data_source.dart';
import 'package:todo_app/domain/todo/data/service/todo_service.dart';

import '../models/todo_data_test.dart';

class MockTodoService extends Mock implements TodoService {}

void main() {
  late TodoDataSource dataSource;
  final service = MockTodoService();
  final todo = MockTodoData();

  setUpAll(() {
    dataSource = TodoDataSourceImpl(service);
  });

  group('TodoDataSource test', () {
    /// Mocking data
    when(() => todo.status).thenReturn(false);
    when(() => todo.description).thenReturn('desc');

    /// Mocking getList
    when(() => service.getList()).thenAnswer((_) async => [todo]);

    /// Test TodoDataSource
    test('When getList() called, then it should return correct list', () async {
      final result = await dataSource.getList();
      expect(result, [todo]);
      expect(result.first, todo);
      expect(result.first.status, todo.status);
      expect(result.first.description, todo.description);
    });
  });
}