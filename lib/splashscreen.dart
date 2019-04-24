import 'package:flutter/material.dart';
import 'package:secozy/resources/colors.dart';
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.red,
      body: new Center(
//        child: new Image.asset('images/secozy.png'),
        child: Text('Splash Screen'),
      ),
    );
  }
}
