import 'package:money_manager/models/income.dart';
import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/redux/record/actions/income_post_action.dart';
import 'package:redux/redux.dart';

class IncomeViewmodel {
  final bool loading;
  final String stateStatus;
  final String message;
  final List<String> errorList;

  final Function(Income incomeRequest) addIncome;

  IncomeViewmodel({
    this.loading,
    this.stateStatus,
    this.message,
    this.errorList,
    this.addIncome
  });

  static IncomeViewmodel fromStore(Store<AppState> store) {
    return IncomeViewmodel(
      loading: store.state.recordState.loading,
      stateStatus: store.state.recordState.stateStatus,
      message: store.state.recordState.message,
      errorList: store.state.recordState.errorList,
      addIncome: (Income incomeRequest) => store.dispatch(IncomePostAction(income: incomeRequest))
    );
  }
}