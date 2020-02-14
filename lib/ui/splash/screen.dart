import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Image.asset('assets/images/ic_splash.png',
                width: 250.0, height: 250.0)));
  }
}
