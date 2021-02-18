import 'package:money_manager/redux/upcoming_expense/actions/fetch_upcoming_expense_fail_action.dart';
import 'package:money_manager/redux/upcoming_expense/upcoming_expense_state.dart';

UpcomingExpenseState fetchUpcomingExpenseFailReducer(UpcomingExpenseState state, FetchUpcomingExpenseFailAction action) =>
  state.copyWith(
    loading: false,
    status: "Fetching failed"
  );