
import 'package:money_manager/redux/upcoming_expense/actions/fetch_upcoming_expense_success_action.dart';
import 'package:money_manager/redux/upcoming_expense/upcoming_expense_state.dart';

UpcomingExpenseState fetchUpcomingExpenseSuccessReducer(UpcomingExpenseState state, FetchUpcomingExpenseSuccessAction action) =>
  state.copyWith(
    loading: false,
    status: "",
    upcomingExpenses: action.upcomingExpenses
  );