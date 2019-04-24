import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  LoginEvent([List props = const []]) : super(props);
}

class LoginButtonPressed extends LoginEvent {
  String username;
  final String password;

  LoginButtonPressed({
    @required this.username,
    @required this.password,
  }) : super([username, password]){
    this.username = username.trim();
  }

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password }';
}

class LoginTogglePassword extends LoginEvent {
  @override
  String toString() => 'LoginTogglePassword';
}
