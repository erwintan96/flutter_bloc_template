import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:secozy/bloc/authentication/authentication.dart';
import 'package:secozy/repository/user_repository.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository;

  AuthenticationBloc({@required this.userRepository})
      : assert(userRepository != null);

  @override
  AuthenticationState get initialState => AuthenticationUninitialized();

  @override
  Stream<AuthenticationState> mapEventToState( AuthenticationEvent event,)
  async* {
    if (event is AppStarted) yield* _mapAppStartedToState();
    if (event is LoggedIn) yield AuthenticationAuthenticated();
    if (event is LoggedOut) {
      final bool status = await userRepository.logOut();
      if(status) yield AuthenticationUnauthenticated();
      else yield AuthenticationAuthenticated();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final bool hasToken = await userRepository.checkAuthenticated();
      if (hasToken) yield AuthenticationAuthenticated();
      else yield AuthenticationUnauthenticated();
    } catch (_) {
      yield AuthenticationUnauthenticated();
    }
  }

  @override
  void dispose() {
  }


}
