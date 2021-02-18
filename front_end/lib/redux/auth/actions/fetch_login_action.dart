import 'package:flutter/material.dart';
import 'package:money_manager/models/login_request.dart';

class FetchLoginAction {
  final LoginRequest loginRequest;

  FetchLoginAction({
    @required this.loginRequest,
  });
}