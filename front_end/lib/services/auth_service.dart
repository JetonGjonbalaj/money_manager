import 'package:money_manager/models/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AuthService {
  static final String _key = "user";
  static final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<LoginResponse> getUser() async {
    final prefs = await _prefs;
    var user = prefs.getString(_key);

    if (user != null) {
      var userDecoded = LoginResponse.fromJson(jsonDecode(user));
      return userDecoded;
    }

    return Future.error("User is null!");
  }

  static Future<bool> setUser(LoginResponse user) async {
    final prefs = await _prefs;
    return prefs.setString(_key, jsonEncode(user.toJson()));
  }

  static Future<bool> removeUser() async {
    final prefs = await _prefs;
    return prefs.remove(_key);
  }
}