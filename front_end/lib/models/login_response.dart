import 'package:flutter/material.dart';

class LoginResponse {
  final String token;
  final DateTime expireDate;

  LoginResponse({
    @required this.token,
    @required this.expireDate
  });

  LoginResponse.fromJson(Map<String, dynamic> json) :
    token = json["token"],
    expireDate = DateTime.parse(json["expireDate"]);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['expireDate'] = this.expireDate.toString();
    return data;
  }

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
      other is LoginResponse &&
      token == other.token &&
      expireDate == other.expireDate;

  @override
  int get hashCode =>
    token.hashCode ^
    expireDate.hashCode;  
}