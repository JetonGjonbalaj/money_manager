import 'package:money_manager/redux/upcoming_expense/actions/fetch_upcoming_expense_action.dart';
import 'package:money_manager/redux/upcoming_expense/actions/fetch_upcoming_expense_fail_action.dart';
import 'package:money_manager/redux/upcoming_expense/actions/fetch_upcoming_expense_success_action.dart';
import 'package:money_manager/redux/upcoming_expense/reducers/fetch_upcoming_expense_fail_reducer.dart';
import 'package:money_manager/redux/upcoming_expense/reducers/fetch_upcoming_expense_reducer.dart';
import 'package:money_manager/redux/upcoming_expense/reducers/fetch_upcoming_expense_success_reducer.dart';
import 'package:money_manager/redux/upcoming_expense/upcoming_expense_state.dart';
import 'package:redux/redux.dart';

Reducer<UpcomingExpenseState> upcomingExpensesReducer = combineReducers<UpcomingExpenseState>([
  new TypedReducer<UpcomingExpenseState, FetchUpcomingExpenseAction>(fetchUpcomingExpenseReducer),
  new TypedReducer<UpcomingExpenseState, FetchUpcomingExpenseSuccessAction>(fetchUpcomingExpenseSuccessReducer),
  new TypedReducer<UpcomingExpenseState, FetchUpcomingExpenseFailAction>(fetchUpcomingExpenseFailReducer)
]);