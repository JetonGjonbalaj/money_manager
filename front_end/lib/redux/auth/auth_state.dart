import 'package:flutter/material.dart';
import 'package:money_manager/models/login_response.dart';

@immutable
class AuthState {
  final bool loading;
  final String stateStatus;
  final String message;
  final List<String> errorList;
  final LoginResponse loginData;

  AuthState({
    @required this.loading,
    this.message,
    this.stateStatus,
    this.errorList,
    this.loginData,
  });

  AuthState copyWith({
    bool loading,
    String message,
    String stateStatus,
    List<String> errorList,
    LoginResponse loginData
  }) {
    return AuthState(
      loading: loading ?? this.loading,
      message: message ?? this.message,
      stateStatus: stateStatus ?? this.stateStatus,
      errorList: errorList ?? this.errorList,
      loginData: loginData ?? this.loginData
    );
  }

  factory AuthState.initial() {
    return AuthState(
      loading: false,
      message: null,
      stateStatus: null,
      errorList: null,
      loginData: null
    );
  }

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
      other is AuthState &&
        runtimeType == other.runtimeType &&
        loading == other.loading &&
        message == other.message &&
        stateStatus == other.stateStatus &&
        errorList == other.errorList &&
        loginData == other.loginData;

  @override
  int get hashCode =>
    loading.hashCode ^
    message.hashCode ^
    stateStatus.hashCode ^
    errorList.hashCode ^
    loginData.hashCode;
}