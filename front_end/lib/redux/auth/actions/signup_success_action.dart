import 'package:flutter/material.dart';
import 'package:money_manager/models/signup_response.dart';

class SignupSuccessAction {
  final SignupResponse signupResponse;

  SignupSuccessAction({
    @required this.signupResponse
  });
}