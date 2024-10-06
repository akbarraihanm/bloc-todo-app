import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/core/util/resource.dart';
import 'package:todo_app/domain/todo/data/data_source/todo_data_source.dart';
import 'package:todo_app/domain/todo/data/repository_impl/todo_repository_impl.dart';
import 'package:todo_app/domain/todo/domain/repository/todo_repository.dart';

import '../models/todo_data_test.dart';

class MockTodoDataSource extends Mock implements TodoDataSource {}

void main() {
  late TodoRepository repository;
  final dataSource = MockTodoDataSource();
  final todo = MockTodoData();

  setUpAll(() {
    repository = TodoRepositoryImpl(dataSource);
  });

  group('TodoRepositoryImpl test', () {
    /// Mocking data
    when(() => todo.description).thenReturn('desc');
    when(() => todo.status).thenReturn(false);

    /// Mock get data
    when(() => dataSource.getList()).thenAnswer((_) async => [todo]);

    /// Test TodoRepository
    test('When getList() called, then it should return correct list', () async {
      final result = await repository.getList();
      expect(result.data, [todo]);
    });
  });
}