import 'package:secozy/resources/colors.dart';
import 'package:flutter/material.dart';

class SnackbarBuilder {
  static Widget getSnackbar(String content, String actionLabel,
      {int duration = 3}) {
    return SnackBar(
      backgroundColor: colorAccent,
      content: new Text(content, style: TextStyle(color: colorWhite),),
      action: new SnackBarAction(
        label: actionLabel,
        textColor: colorWhite,
        onPressed: () {},
      ),
      duration: new Duration(seconds: duration),
    );
  }
}
