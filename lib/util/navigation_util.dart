import 'package:flutter/material.dart';
import 'package:secozy/repository/repository_provider.dart';
import 'package:secozy/repository/user_repository.dart';
import 'package:secozy/ui/landingpage/landingpage.dart';
import 'package:secozy/ui/landingpage/login/login_form.dart';

class NavigationUtil {
  static void navigateToAnyWhere(BuildContext context, Widget destination) {
    Navigator.of(context).push(
      PageRouteBuilder<Null>(
          pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return AnimatedBuilder(
              animation: animation,
              builder: (BuildContext context, Widget child) {
                return Opacity(
                  opacity: animation.value,
                  child: destination,
                );
              },
            );
          },
          transitionDuration: Duration(milliseconds: 450)),
    );
  }

}
