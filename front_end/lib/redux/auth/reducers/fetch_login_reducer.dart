import 'package:money_manager/redux/auth/actions/fetch_login_action.dart';
import 'package:money_manager/redux/auth/auth_state.dart';

AuthState fetchLoginReduer(AuthState state, FetchLoginAction action) =>
  state.copyWith(
    stateStatus: "Fetching data",
    loading: true,
  );