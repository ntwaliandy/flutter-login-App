import 'package:seconds/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seconds Login/register Api Demo',
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xFF3A5998)),
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
    );
  }
}
