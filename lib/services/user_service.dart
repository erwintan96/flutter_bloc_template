import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:secozy/model/response_secozy.dart';
import 'package:secozy/services/http_status.dart';
import 'package:secozy/util/shared_preferences_util.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService extends HttpStatus {

  ///Server production
  static const String SERVER__OAUTH_URL = "https://gitlab.com/oauth/token";
  static const String SERVER_URL = "cantique.app1.conecworld.com";

  final Dio dio;
  final SharedPreferences prefs;
  String token = "";

  UserService({@required this.dio,@required this.prefs});

  Future<ResponseSecozy>
  authenticate(String username, String password) async {
    try {
      Map data = {
        "grant_type": "password",
        "username": username,
        "password": password,
      };
      final response = await dio
          .post(
        SERVER__OAUTH_URL,
        data: json.encode(data),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
           responseType :  ResponseType.json,
        ),)
          .timeout(new Duration(seconds: 60));
      if (response.statusCode == HttpStatus.ok) {
        print(response.data);
        final Map<String, dynamic> jsonDecodeResult = response.data;

        if (jsonDecodeResult.isEmpty) {
          return ResponseSecozy.createEmptyResponse(
            httpStatusCode: response.statusCode,
          );
        } else {

          await prefs.setString(SharedPreferencesUtil.KEY_USER_TOKEN, jsonDecodeResult['access_token']);
          await prefs.setString("token_type", jsonDecodeResult['token_type']);
          await prefs.setString("refresh_token", jsonDecodeResult['refresh_token']);
          await prefs.setString("scope", jsonDecodeResult['scope']);
          await prefs.setInt("created_at", jsonDecodeResult['created_at']);

          return ResponseSecozy(
              httpStatusCode: response.statusCode,
              result: ResponseSecozy.REQUEST_SUCCESS);
        }
      } else {
        if (response.statusCode == HttpStatus.unauthorized) {
          print("unauthorized");
        }
        else {
          print("ERROR_SHOULD_RETRY");
          return ResponseSecozy(
              httpStatusCode: response.statusCode,
              result: ResponseSecozy.ERROR_SHOULD_RETRY);
        }
      }
    } on SocketException catch (e) {
      return ResponseSecozy.createShouldRetryResponseWithErrorMessage(
          e.message);
    } on TimeoutException catch (e) {
      return ResponseSecozy.createShouldRetryResponseWithErrorMessage(
          e.message);
    } catch (e) {
      return ResponseSecozy.createShouldRetryResponseWithErrorMessage(
          e.message);
    }
  }

  Future<bool> checkAuthenticated() async {
    final token = await prefs.getString(SharedPreferencesUtil.KEY_USER_TOKEN);
    return token != null;
  }

  Future<bool> logOut() async {
    final bool status = await prefs.clear();
    return status;
  }
}

