import 'package:money_manager/redux/record/actions/income_post_action.dart';
import 'package:money_manager/redux/record/record_state.dart';

RecordState incomePostReducer(RecordState state, IncomePostAction action) =>
  state.copyWith(
    loading: true,
    stateStatus: "Adding income",
    message: "",
    errorList: []
  );