
import 'package:flutter/material.dart';
import 'package:secozy/resources/colors.dart';
class LandingPage extends StatefulWidget {
  final Widget child;
  LandingPage({this.child});
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorPrimaryDark,
      body: new SafeArea(
        child: new Container(
          padding: const EdgeInsets.all(4.0),
          child: new Card(
            elevation: 0.0,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  new Expanded(
                    child: widget.child,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
