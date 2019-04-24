import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
class SharedPreferencesUtil {
  static const String KEY_USER_TOKEN = "oauth_user_token";

  static const String KEY_LOGIN_PHONE_NUMBER = "login_phone_number";
  static const String KEY_ID_OF_CONECTIZEN_ENTITY = "login_id_of_pojo_conectizen";

  static const String KEY_FCM_TOKEN_LOCAL = "fcm_token_local";

  //fcm token server yang disimpan dalam shared preferences
  static const String KEY_FCM_TOKEN_SERVER = "fcm_token_server";

  static const String KEY_CONECTIZEN_ID_OF_CONECTIZEN_ENTITY = "key_conectizen_id";
  static const String KEY_NAME_OF_CONECTIZEN_ENTITY = "key_conectizen_name";

}
