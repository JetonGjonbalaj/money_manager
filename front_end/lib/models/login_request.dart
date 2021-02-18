import 'package:flutter/material.dart';

class LoginRequest {
  final String email;
  final String password;

  LoginRequest({
    @required this.email, 
    @required this.password
  });

  LoginRequest.fromJson(Map<String, dynamic> json) :
    email = json['email'],
    password = json['password'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}