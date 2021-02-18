import 'package:money_manager/redux/auth/actions/auth_failed_action.dart';
import 'package:money_manager/redux/auth/auth_state.dart';

AuthState authFailedReducer(AuthState state, AuthFailedAction action) =>
  state.copyWith(
    loading: false,
    stateStatus: "",
    message: action.errorResponse.message ?? "",
    errorList: action.errorResponse.errors ?? [],
  );