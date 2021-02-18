import 'package:money_manager/redux/auth/actions/clear_errors_action.dart';
import 'package:money_manager/redux/auth/actions/fetch_login_action.dart';
import 'package:money_manager/redux/auth/actions/fetch_signup_action.dart';
import 'package:money_manager/redux/auth/actions/auth_failed_action.dart';
import 'package:money_manager/redux/auth/actions/fetch_user_action.dart';
import 'package:money_manager/redux/auth/actions/login_success_action.dart';
import 'package:money_manager/redux/auth/actions/logout_action.dart';
import 'package:money_manager/redux/auth/actions/signup_success_action.dart';
import 'package:money_manager/redux/auth/actions/user_not_found_action.dart';
import 'package:money_manager/redux/auth/auth_state.dart';
import 'package:money_manager/redux/auth/reducers/clear_errors_reducer.dart';
import 'package:money_manager/redux/auth/reducers/fetch_login_reducer.dart';
import 'package:money_manager/redux/auth/reducers/fetch_signup_reducer.dart';
import 'package:money_manager/redux/auth/reducers/auth_failed_reducer.dart';
import 'package:money_manager/redux/auth/reducers/fetch_user_reducer.dart';
import 'package:money_manager/redux/auth/reducers/login_success_reducer.dart';
import 'package:money_manager/redux/auth/reducers/logout_reducer.dart';
import 'package:money_manager/redux/auth/reducers/signup_success_redecer.dart';
import 'package:money_manager/redux/auth/reducers/user_not_found_reducer.dart';
import 'package:redux/redux.dart';

Reducer<AuthState> authReducer = combineReducers<AuthState>([
  new TypedReducer<AuthState, ClearErrorsAction>(clearErrorsReducer),
  new TypedReducer<AuthState, AuthFailedAction>(authFailedReducer),
  new TypedReducer<AuthState, FetchLoginAction>(fetchLoginReduer),
  new TypedReducer<AuthState, FetchUserAction>(fetchUserReducer),
  new TypedReducer<AuthState, LoginSuccessAction>(loginSuccessReducer),
  new TypedReducer<AuthState, FetchSignupAction>(fetchSigninReducer),
  new TypedReducer<AuthState, SignupSuccessAction>(signupSuccessReducer),
  new TypedReducer<AuthState, UserNotFoundAction>(userNotFoundReducer),
  new TypedReducer<AuthState, LogoutAction>(logoutReducer)
]);