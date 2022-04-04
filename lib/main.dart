import 'package:delito/style.dart';
import 'package:flutter/material.dart';
import 'function.dart';
import 'login/login_view.dart';

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
    Future.delayed(const Duration(seconds: 2), pushLoginView);
  }

  void pushLoginView() async {
    navigatorPush(context: context, widget: LoginView(), replacement: true, all: true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => onWillPop(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('DeliTo', style: textStyle(weight: 700, size: 24.0),),
              SizedBox(height: 4),
              Text('Delivery Together', style: textStyle(color: Color(0xffc9c9c9), weight: 500, size: 18.0)),
              SizedBox(height: 12),
              Text('배달팁에 대처하는 현명한 방법', style: textStyle(color: Color(0xffd5d5d5), weight: 400, size: 14.0)),
              SizedBox(height: 30),
            ]
          )
        )
      )
    );
  }
}