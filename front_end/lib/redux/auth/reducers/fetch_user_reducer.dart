import 'package:money_manager/redux/auth/actions/fetch_user_action.dart';
import 'package:money_manager/redux/auth/auth_state.dart';

AuthState fetchUserReducer(AuthState state, FetchUserAction action) =>
  state.copyWith(
    stateStatus: "Fetching data",
    loading: true,
  );