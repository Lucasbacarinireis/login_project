import 'package:flutter/material.dart';
import 'package:login_project/pages/home_page.dart';
import 'package:login_project/pages/login_page.dart';
import 'package:login_project/pages/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(primaryColor: Colors.blue),
      initialRoute: "/splash",
      routes: {
        "/splash": (_) => const SplashScreen(),
        "/login": (_) => LoginPage(),
        "/home": (_) => const HomePage(),
      },
    );
  }
}
