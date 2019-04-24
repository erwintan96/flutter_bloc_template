import 'package:flutter/material.dart';
import 'package:secozy/resources/colors.dart';

ThemeData buildShrineTheme() {

  return ThemeData(
      primaryColor: Colors.black,
      cursorColor: Colors.black,
      /// label, hint, error
      hintColor: Colors.black38,

      primaryTextTheme: TextTheme(
        title: new TextStyle(
            fontSize: 24.0, fontFamily: 'nunitoSansRegular', color: colorBlack),
        subhead: new TextStyle(
            fontSize: 12.0, fontFamily: 'nunitoSansRegular', color: colorBlack),

      ),

      /// icon theme yang bukan di appbar
      iconTheme: IconThemeData(color: Colors.lightBlue),
      /// appbar theme
      appBarTheme: AppBarTheme(
          color : Colors.white,
          iconTheme: IconThemeData(
            color: Colors.black
          )),

      /// hanya berlaku pada raisedbutton
      buttonTheme: ButtonThemeData(buttonColor: Colors.amberAccent),
      /// semua button font size
      textTheme: new TextTheme(
        button: new TextStyle(
            fontSize: 18.0, fontFamily: 'nunitoSansRegular', color: Colors.white ),
      ),



  );
}

