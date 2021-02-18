import 'package:money_manager/models/login_request.dart';
import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/redux/auth/actions/clear_errors_action.dart';
import 'package:money_manager/redux/auth/actions/fetch_login_action.dart';
import 'package:redux/redux.dart';

class LoginViewmodel {
  final bool loading;
  final String stateStatus;
  final String message;
  final List<String> errorList;

  final Function cleanErrors;
  final Function(LoginRequest loginRequest) login;

  LoginViewmodel({
    this.loading,
    this.stateStatus,
    this.message,
    this.errorList,
    this.cleanErrors,
    this.login
  });

  static LoginViewmodel fromStore(Store<AppState> store) {
    return LoginViewmodel(
      loading: store.state.authState.loading,
      stateStatus: store.state.authState.stateStatus,
      message: store.state.authState.message,
      errorList: store.state.authState.errorList,
      cleanErrors: () => store.dispatch(ClearErrorsAction()),
      login: (loginRequest) => store.dispatch(FetchLoginAction(loginRequest: loginRequest))
    );
  }
}