import 'package:dermaconnect/pages/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:dermaconnect/pages/login_page.dart';
import 'package:dermaconnect/pages/reset_page.dart';
import 'package:dermaconnect/pages/register_page.dart';
import 'package:dermaconnect/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/intropage':(context) => const IntroPage(),
        '/loginpage':(context) => const LoginPage(),
        '/homepage':(context) => const HomePage(),
        '/resetpage':(context) => const ResetPage(),
        '/registerpage':(context) => const RegisterPage(),
      },    );
  }
}
