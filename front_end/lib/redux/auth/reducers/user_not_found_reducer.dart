import 'package:money_manager/redux/auth/actions/user_not_found_action.dart';
import 'package:money_manager/redux/auth/auth_state.dart';

AuthState userNotFoundReducer(AuthState state, UserNotFoundAction action) =>
  state.copyWith(
    stateStatus: "",
    loading: false,
  );