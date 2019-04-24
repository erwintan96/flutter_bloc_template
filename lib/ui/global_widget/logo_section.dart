import 'package:flutter/material.dart';

class LogoSection extends StatelessWidget{
  final double height = 80.0;
  const LogoSection();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        new Container(
          margin: const EdgeInsets.all(20.0),
          child: Image.asset(
            'images/secozy.png',
            height: height,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}
