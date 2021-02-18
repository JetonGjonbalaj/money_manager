import 'package:flutter/material.dart';
import 'package:money_manager/models/signup_request.dart';

class FetchSignupAction {
  final SignupRequest signupRequest;

  FetchSignupAction({
    @required this.signupRequest,
  });
}