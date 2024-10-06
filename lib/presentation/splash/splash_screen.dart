import 'package:flutter/material.dart';
import 'package:todo_app/core/config/app_color.dart';
import 'package:todo_app/core/const/asset_const.dart';
import 'package:todo_app/presentation/todo/page/todo_screen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, TodoScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.analogous,
      body: Center(
        child: Image.asset(
          AssetConst.icTodo,
          height: 72,
          width: 72,
          color: Colors.white,
        ),
      ),
    );
  }
}
