import 'package:money_manager/redux/record/actions/expense_post_action.dart';
import 'package:money_manager/redux/record/record_state.dart';

RecordState expensePostReducer(RecordState state, ExpensePostAction action) =>
  state.copyWith(
    loading: true,
    stateStatus: "Adding expense",
    message: "",
    errorList: []
  );