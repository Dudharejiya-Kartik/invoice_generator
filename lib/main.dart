import 'package:flutter/material.dart';
import 'package:invoice_generator/view/screen/homescreen.dart';
import 'package:invoice_generator/view/screen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        '/splash': (context) => SplashScreen(),
        'home': (context) => homescreen(),
      },
    );
  }
}
