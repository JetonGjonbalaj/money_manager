import 'package:money_manager/models/signup_request.dart';
import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/redux/auth/actions/clear_errors_action.dart';
import 'package:money_manager/redux/auth/actions/fetch_signup_action.dart';
import 'package:redux/redux.dart';

class SignupViewmodel {
  final bool loading;
  final String stateStatus;
  final String message;
  final List<String> errorList;

  final Function cleanErrors;
  final Function(SignupRequest signupRequest) signup;

  SignupViewmodel({
    this.loading,
    this.stateStatus,
    this.message,
    this.errorList,
    this.cleanErrors,
    this.signup
  });

  static SignupViewmodel fromStore(Store<AppState> store) {
    return SignupViewmodel(
      loading: store.state.authState.loading,
      stateStatus: store.state.authState.stateStatus,
      message: store.state.authState.message,
      errorList: store.state.authState.errorList,
      cleanErrors: () => store.dispatch(ClearErrorsAction()),
      signup: (SignupRequest signupRequest) => store.dispatch(
        FetchSignupAction(
          signupRequest: signupRequest
        )
      )
    );
  }
}