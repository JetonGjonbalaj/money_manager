import 'package:flutter/material.dart';

class SignupResponse {
  final bool succeeded;
  final String message;
  final List<String> errors;

  SignupResponse({
    @required this.succeeded, 
    @required this.message, 
    @required this.errors
  });

  SignupResponse.fromJson(Map<String, dynamic> json) :
    succeeded = json['succeeded'],
    message = json['message'],
    errors = json['errors']?.cast<String>();

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['succeeded'] = this.succeeded;
    data['message'] = this.message;
    data['errors'] = this.errors;
    return data;
  }
}
