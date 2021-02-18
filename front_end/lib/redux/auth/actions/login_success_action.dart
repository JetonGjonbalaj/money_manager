import 'package:flutter/material.dart';
import 'package:money_manager/models/login_response.dart';

class LoginSuccessAction {
  final LoginResponse loginResponse;

  LoginSuccessAction({
    @required this.loginResponse
  });
}