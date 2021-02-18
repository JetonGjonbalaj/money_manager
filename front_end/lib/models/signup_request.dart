import 'package:flutter/material.dart';

class SignupRequest {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;

  SignupRequest({
    @required this.username, 
    @required this.email, 
    @required this.password, 
    @required this.confirmPassword
  });

  SignupRequest.fromJson(Map<String, dynamic> json) :
    username = json['username'],
    email = json['email'],
    password = json['password'],
    confirmPassword = json['confirmPassword'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['confirmPassword'] = this.confirmPassword;
    return data;
  }
}
