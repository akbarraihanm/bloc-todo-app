import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app/domain/todo/data/models/todo_data.dart';

class MockTodoData extends Mock implements TodoData {}

void main() {
  final todo = MockTodoData();

  group('TodoData test', () {
    /// Mocking data
    when(() => todo.description).thenReturn('desc');
    when(() => todo.status).thenReturn(false);

    /// Test TodoData
    test('When TodoData init, then it should return correct data', () {
      expect(todo.status, false);
      expect(todo.description, 'desc');
    });
  });
}