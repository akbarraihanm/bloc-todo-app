import 'package:get_it/get_it.dart';
import 'package:todo_app/domain/todo/di/todo_locator.dart';

final sl = GetIt.instance;

class AppLocator {
  AppLocator() {
    TodoLocator();
  }

  static Future openBox() async => await TodoLocator.openBox();
}