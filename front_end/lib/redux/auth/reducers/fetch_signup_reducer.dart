import 'package:money_manager/redux/auth/actions/fetch_signup_action.dart';
import 'package:money_manager/redux/auth/auth_state.dart';

AuthState fetchSigninReducer(AuthState state, FetchSignupAction action) =>
  state.copyWith(
    stateStatus: "Sending data",
    loading: true,
  );