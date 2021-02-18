import 'package:money_manager/redux/auth/actions/clear_errors_action.dart';
import 'package:money_manager/redux/auth/auth_state.dart';

AuthState clearErrorsReducer(AuthState state, ClearErrorsAction action) =>
  state.copyWith(
    stateStatus: "",
    message: "",
    errorList: [],
  );