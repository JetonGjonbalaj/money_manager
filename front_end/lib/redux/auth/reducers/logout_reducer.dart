import 'package:money_manager/redux/auth/actions/logout_action.dart';
import 'package:money_manager/redux/auth/auth_state.dart';

AuthState logoutReducer(AuthState state, LogoutAction action) =>
  AuthState.initial();