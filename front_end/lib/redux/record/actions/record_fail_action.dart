import 'package:flutter/material.dart';
import 'package:money_manager/models/error_response.dart';

class RecordFailAction {
  final ErrorResponse errorResponse;
  
  RecordFailAction({
    @required this.errorResponse
  });
}