import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed('home');
    });
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image(
              image: NetworkImage(
                  "https://images.crunchbase.com/image/upload/c_pad,f_auto,q_auto:eco,dpr_1/hsj02clrrolyuvtkdf52")),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome To Super Market',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff7B3F00),
                ),
              ),
            ],
          ),
          SizedBox(height: 170),
          LinearProgressIndicator(color: Color(0xff7B3F00)),
        ],
      ),
    );
  }
}
