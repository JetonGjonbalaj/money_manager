
import 'package:money_manager/redux/upcoming_expense/actions/fetch_upcoming_expense_action.dart';
import 'package:money_manager/redux/upcoming_expense/upcoming_expense_state.dart';

UpcomingExpenseState fetchUpcomingExpenseReducer(UpcomingExpenseState state, FetchUpcomingExpenseAction action) =>
  state.copyWith(
    loading: true,
    status: "Fetching upcoming expenses"
  );