import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';
import 'package:secozy/bloc/authentication/authentication.dart';
import 'package:secozy/bloc/authentication/authentication_bloc.dart';
import 'package:secozy/bloc/login/login.dart';
import 'package:secozy/bloc/tabs/tab.dart';
import 'package:secozy/repository/repository_provider.dart';
import 'package:secozy/repository/user_repository.dart';
import 'package:secozy/resources/internationalization/application.dart';
import 'package:secozy/resources/internationalization/translation.dart';
import 'package:secozy/resources/themes.dart';
import 'package:secozy/services/user_service.dart';
import 'package:secozy/splashscreen.dart';
import 'package:secozy/ui/builder/progress_indicator_builder.dart';
import 'package:secozy/ui/homepage/homepage.dart';
import 'package:secozy/ui/landingpage/landingpage.dart';
import 'package:secozy/ui/landingpage/login/login_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Transition transition) {
    super.onTransition(transition);
    print(transition);
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    super.onError(error, stacktrace);
    print(error);
  }
}

void main() async {
  final Dio _dio = new Dio();
  final SharedPreferences _prefs = await SharedPreferences.getInstance();

  final UserService _userService = new UserService(
      dio: _dio, prefs: _prefs);
  final UserRepository _userRepository = new UserRepository(_userService);

  BlocSupervisor().delegate = SimpleBlocDelegate();
  runApp(RepositoryProvider(
    userRepository: _userRepository,
    child: TranslationsWidget(userRepository: _userRepository,)
  ));
//  runApp(MyApp());
}

class TranslationsWidget extends StatefulWidget {
  final NavigatorObserver navigatorObserver;
  final UserRepository userRepository;
  TranslationsWidget({this.userRepository, this.navigatorObserver});

  @override
  State createState() {
    return TranslationsWidgetState();
  }
}

class TranslationsWidgetState extends State<TranslationsWidget> {
  SpecificLocalizationDelegate _localeOverrideDelegate;
  AuthenticationBloc _authenticationBloc;

  @override
  void initState() {
    super.initState();
    _authenticationBloc = AuthenticationBloc(userRepository: widget.userRepository);
    _authenticationBloc.dispatch(AppStarted());
    _localeOverrideDelegate = new SpecificLocalizationDelegate(null);
    applic.onLocaleChanged = onLocaleChange;

  }

  @override
  void dispose() {
    _authenticationBloc?.dispose();
    super.dispose();
  }

  onLocaleChange(Locale locale) {
    setState(() {
      _localeOverrideDelegate = new SpecificLocalizationDelegate(locale);
    });
  }

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarManager.setStyle(StatusBarStyle.LIGHT_CONTENT);

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        _localeOverrideDelegate,
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: buildShrineTheme(),
      supportedLocales: applic.supportedLocales(),
      navigatorObservers: [
        widget.navigatorObserver == null
            ? NavigatorObserver()
            : widget.navigatorObserver,
      ],
      home: BlocBuilder<AuthenticationEvent, AuthenticationState>(
        bloc: _authenticationBloc,
        builder: (BuildContext context, AuthenticationState state) {
          if (state is AuthenticationUninitialized) {
            print("masuk sini 1");
            return SplashScreen();
          }
          if (state is AuthenticationAuthenticated) {
            print("masuk sini 2");
            return BlocProvider<TabBloc>(
                bloc: TabBloc(),
                child:Homepage(_authenticationBloc));
          }
          if (state is AuthenticationUnauthenticated) {
            print("masuk sini 3");
            final _userRepository = RepositoryProvider
                .of(context)
                .userRepository;
            return BlocProvider<LoginBloc>(
                bloc: LoginBloc(userRepository: _userRepository,
                    authenticationBloc: _authenticationBloc),
                child: LandingPage(child: LoginForm(),));
          }
          if (state is AuthenticationLoading) {
            return ProgressIndicatorBuilder
                .getCenterCircularProgressIndicator();
          }
        },
      ),
    );
  }
}
