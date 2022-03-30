import 'package:flutter/material.dart';
import 'function.dart';
import 'login_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashView()
    );
  }
}

class SplashView extends StatefulWidget {
  @override
  State<SplashView> createState() => _SplashView();
}

class _SplashView extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), pushLoginView);
  }

  void pushLoginView() async {
    navigatorPush(context: context, widget: LoginView(), replacement: true, all: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('splash')
    );
  }
}