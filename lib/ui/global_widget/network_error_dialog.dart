//import 'package:flutter/widgets.dart';

import 'package:flutter/material.dart';

class NetworkErrorDialog extends StatelessWidget {
  final String dialogTitle;
  final String message;
  final String buttonLabel;
  final VoidCallback callback;
  NetworkErrorDialog({this.dialogTitle = 'Network Error',
  this.message = 'Tolong ganti koneksi internet Anda dengan yang lebih stabil dan cepat',
  this.buttonLabel = 'Retry', this.callback});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: const EdgeInsets.only(top: 12.0),
      title: Text(dialogTitle),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: new Text(
            message,
            textAlign: TextAlign.center,
          ),
        ),
        new RaisedButton(
          onPressed: () {
            //callback();
            Navigator.pop(context);
          },
          child: Text(buttonLabel),
        ),
      ]
    );
  }
}
