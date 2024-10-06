import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/di/app_locator.dart';
import 'package:todo_app/domain/todo/data/models/todo_data.dart';

class TodoService {
  Future<int> addOrUpdate(TodoData data) async {
    try {
      final box = sl<Box<TodoData>>();
      data.status ??= false;
      await box.put(data.id, data);
      return 1;
    } catch (ex) {
      return 0;
    }
  }

  Future<int> delete(TodoData data) async {
    try {
      final box = sl<Box<TodoData>>();
      await box.delete(data.id);
      return 1;
    } catch (ex) {
      return 0;
    }
  }

  Future<List<TodoData>> getList([bool? status]) async {
    try {
      final box = sl<Box<TodoData>>().values;
      if (status == null) return List<TodoData>.from(box);
      return List<TodoData>.from(box
          .where((e) => e.status == status))
          .toList();
    } catch (ex) {
      return [];
    }
  }
}