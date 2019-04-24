import 'package:flutter/material.dart';
import 'package:secozy/model/button_state.dart';
import 'package:secozy/resources/colors.dart';

class AwareButton extends StatelessWidget {
  final Widget child;
  AwareButton({this.child});

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: ButtonTheme(
        buttonColor: colorAccentButtonLogin,
        height: 48.0,
        child: child,
      ),
    );
  }

  static Widget setUpButtonChild(String textButton, ButtonState state) {
    if (state == ButtonState.IDLE) {
      return new Text(
        textButton,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      );
    } else if (state == ButtonState.LOADING) {
      return const CircularProgressIndicator(
        valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
      );
    } else {
      return const Icon(Icons.check, color: Colors.white);
    }
  }
}
