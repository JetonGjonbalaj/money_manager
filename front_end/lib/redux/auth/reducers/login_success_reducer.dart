import 'package:money_manager/redux/auth/actions/login_success_action.dart';
import 'package:money_manager/redux/auth/auth_state.dart';

AuthState loginSuccessReducer(AuthState state, LoginSuccessAction action) =>
  state.copyWith(
    loading: false,
    stateStatus: null,
    message: null,
    errorList: null,
    loginData: action.loginResponse
  );