import 'package:money_manager/redux/auth/actions/signup_success_action.dart';
import 'package:money_manager/redux/auth/auth_state.dart';

AuthState signupSuccessReducer(AuthState state, SignupSuccessAction action) =>
  state.copyWith(
    loading: false,
    stateStatus: null,
    errorList: null,
    message: action.signupResponse.message,
  );