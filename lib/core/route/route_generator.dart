import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/blocs/todo/todo_bloc.dart';
import 'package:todo_app/blocs/todo/todo_event.dart';
import 'package:todo_app/di/app_locator.dart';
import 'package:todo_app/presentation/splash/splash_screen.dart';
import 'package:todo_app/presentation/todo/page/todo_screen.dart';

class RouteGenerator {
  static Route generate(RouteSettings settings) {
    final route = settings.name;
    late Widget child;

    switch (route) {
      case TodoScreen.routeName: {
        child = BlocProvider(
          create: (_) => TodoBloc(sl(), sl(), sl())..add(GetListTodo()),
          child: const TodoScreen(),
        );
      }
      default: {
        child = const SplashScreen();
      }
    }

    return MaterialPageRoute(builder: (_) => child);
  }
}