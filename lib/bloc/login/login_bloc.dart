import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:secozy/bloc/authentication/authentication.dart';
import 'package:secozy/bloc/login/login.dart';
import 'package:secozy/model/response_secozy.dart';
import 'package:secozy/repository/user_repository.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;
  bool togglePassword = true;
  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  @override
  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final ResponseSecozy login = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );
        if(login.result == ResponseSecozy.REQUEST_SUCCESS) {
          authenticationBloc.dispatch(LoggedIn());
          yield LoginInitial();
        }
        else{
          yield LoginFailure(error: login.errorMessage);
        }
      } catch (e) {
        yield LoginFailure(error: e.toString());
      }
    }
    else  if (event is LoginTogglePassword) {
      togglePassword = !togglePassword;
      yield LoginPasswordObsecure(toggle: togglePassword);
    }
  }


}
