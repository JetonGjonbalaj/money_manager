import 'package:flutter/material.dart';
import 'package:money_manager/models/error_response.dart';

class AuthFailedAction {
  final ErrorResponse errorResponse;

  AuthFailedAction({
    @required this.errorResponse
  });
}