import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/redux/auth/auth_reducer.dart';
import 'package:money_manager/redux/balance/balance_reducer.dart';
import 'package:money_manager/redux/categories/categories_reducer.dart';
import 'package:money_manager/redux/category_expenses/category_expenses_reducer.dart';
import 'package:money_manager/redux/record/record_reducer.dart';
import 'package:money_manager/redux/theme/theme_reducer.dart';
import 'package:money_manager/redux/upcoming_expense/upcoming_expense_reducer.dart';
import 'package:redux/redux.dart';

Reducer<AppState> storeReducer = combineReducers<AppState>([
  new TypedReducer<AppState, dynamic>(appReducer),
]);

AppState appReducer(AppState state, dynamic action) =>
  AppState(
    themeState: themeReducer(state.themeState, action),
    authState: authReducer(state.authState, action),
    balanceState: balanceReducer(state.balanceState, action),
    upcomingExpenseState: upcomingExpensesReducer(state.upcomingExpenseState, action),
    categoriesState: categoryStateReducer(state.categoriesState, action),
    categoryExpensesState: categoryExpensesReducer(state.categoryExpensesState, action),
    recordState: recordStateReducer(state.recordState, action)
  );