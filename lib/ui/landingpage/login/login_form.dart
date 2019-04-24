import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secozy/bloc/login/login.dart';
import 'package:secozy/model/button_state.dart';
import 'package:secozy/resources/internationalization/translation.dart';
import 'package:secozy/resources/string_constant.dart';
import 'package:secozy/ui/global_widget/awarebutton.dart';
import 'package:secozy/ui/global_widget/default_textfield.dart';
import 'package:secozy/ui/global_widget/logo_section.dart';
import 'package:secozy/ui/builder/snackbar_builder.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  LoginBloc _loginBloc;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  StreamSubscription subscription;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _loginBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("Login Form");
    return BlocListener<LoginEvent, LoginState>(
      bloc: _loginBloc,
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(SnackbarBuilder.getSnackbar(
              '${state.error}', StringConstant.SNACKBAR_ACTION_POSITIVE_OK));
        }
      },
      child: BlocBuilder<LoginEvent, LoginState>(
        bloc: _loginBloc,
        builder: (BuildContext context, LoginState state,) {
          return new Form(
            key: _formKey,
            child: new SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20.0),
                  const LogoSection(),
                  const SizedBox(height: 24.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: DefaultTextfield(
                      fieldLabel: Translations.of(context)
                          .text('PHONE_OR_EMAIL_ALREADY_REGISTERED'),
                      textController: _usernameController,
                      key: Key(StringConstant.KEY_LOGIN_TEXTFIELD_USERNAME),
                      validationMessage: "Tidak Boleh Kosong",
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DefaultTextfield(
                      key: Key(StringConstant.KEY_LOGIN_TEXTFIELD_PASSWORD),
                      fieldLabel: Translations.of(context).text('PASSWORD'),
                      textController: _passwordController,
                      obsecureValue:
                          state is LoginPasswordObsecure ? state.toggle : true,
                      hasSuffixIcon: true,
                      suffixIconFunc: () {
                        _togglePassword();
                      },
                      customSuffixIcon: state is LoginPasswordObsecure
                          ? state.toggle == false
                              ? new Icon(Icons.visibility)
                              : new Icon(Icons.visibility_off)
                          : new Icon(Icons.visibility_off),
                      validationMessage: "Tidak Boleh Kosong",
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  loginButton(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget loginButton() {
    return BlocBuilder<LoginEvent, LoginState>(
        bloc: _loginBloc,
        builder: (
          BuildContext context,
          LoginState state,
        ) {
          return new AwareButton(
            child: new RaisedButton(
              key: Key(StringConstant.KEY_LOGIN_BUTTON_LOGIN),
              child: AwareButton.setUpButtonChild(
                  Translations.of(context).text('BUTTON_LOGIN'),
                  state is LoginLoading
                      ? ButtonState.LOADING
                      : ButtonState.IDLE),
              onPressed: state is LoginLoading
                  ? null
                  : () {
                      if (_formKey.currentState.validate()) {
                        _onLoginButtonPressed();
                      }
                    },
            ),
          );
        });
  }

  void _onLoginButtonPressed() {
    _loginBloc.dispatch(LoginButtonPressed(
      username: _usernameController.text,
      password: _passwordController.text,
    ));
  }

  void _togglePassword() {
    _loginBloc.dispatch(LoginTogglePassword());
  }
}
