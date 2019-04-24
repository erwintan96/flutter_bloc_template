import 'dart:async';

import 'package:flutter/material.dart';
import 'package:secozy/model/response_secozy.dart';
import 'package:secozy/services/user_service.dart';

class UserRepository{

  final UserService userService;
  UserRepository(this.userService);

  Future<ResponseSecozy> authenticate({@required String username,@required String password}) async {
    return await userService.authenticate(username,password);
  }

  Future<bool> checkAuthenticated() async {
    return await userService.checkAuthenticated();
  }

  Future<bool> logOut() async {
    return await userService.logOut();
  }


}