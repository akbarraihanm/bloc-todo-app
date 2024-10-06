import 'package:hive/hive.dart';
import 'package:todo_app/di/app_locator.dart';
import 'package:todo_app/domain/todo/data/data_source/todo_data_source.dart';
import 'package:todo_app/domain/todo/data/models/todo_data.dart';
import 'package:todo_app/domain/todo/data/repository_impl/todo_repository_impl.dart';
import 'package:todo_app/domain/todo/data/service/todo_service.dart';
import 'package:todo_app/domain/todo/domain/repository/todo_repository.dart';
import 'package:todo_app/domain/todo/domain/use_case/add_update_todo_use_case.dart';
import 'package:todo_app/domain/todo/domain/use_case/delete_todo_use_case.dart';
import 'package:todo_app/domain/todo/domain/use_case/get_list_todo_use_case.dart';

class TodoLocator {
  TodoLocator() {
    sl.registerLazySingleton(() => TodoService());
    sl.registerLazySingleton<TodoDataSource>(() => TodoDataSourceImpl(sl()));
    sl.registerLazySingleton<TodoRepository>(() => TodoRepositoryImpl(sl()));
    sl.registerLazySingleton(() => AddUpdateTodoUseCase(sl()));
    sl.registerLazySingleton(() => DeleteTodoUseCase(sl()));
    sl.registerLazySingleton(() => GetListTodoUseCase(sl()));
    Hive.registerAdapter(TodoDataAdapter());
  }

  static Future openBox() async {
    final box = await Hive.openBox<TodoData>('todoBox');
    sl.registerLazySingleton<Box<TodoData>>(() => box);
  }
}