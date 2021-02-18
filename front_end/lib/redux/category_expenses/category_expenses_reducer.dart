import 'package:money_manager/redux/category_expenses/actions/fetch_category_expense_action.dart';
import 'package:money_manager/redux/category_expenses/actions/fetch_category_expense_fail_action.dart';
import 'package:money_manager/redux/category_expenses/actions/fetch_category_expense_success_action.dart';
import 'package:money_manager/redux/category_expenses/category_expenses_state.dart';
import 'package:money_manager/redux/category_expenses/reducers/fatch_category_expense_fail_reducer.dart';
import 'package:money_manager/redux/category_expenses/reducers/fatch_category_expense_reducer.dart';
import 'package:money_manager/redux/category_expenses/reducers/fatch_category_expense_success_reducer.dart';
import 'package:redux/redux.dart';

Reducer<CategoryExpensesState> categoryExpensesReducer = combineReducers<CategoryExpensesState>([
  new TypedReducer<CategoryExpensesState, FetchCategoryExpenseAction>(fetchCategoryExpenseReducer),
  new TypedReducer<CategoryExpensesState, FetchCategoryExpenseSuccessAction>(fetchCategoryExpenseSuccessReducer),
  new TypedReducer<CategoryExpensesState, FetchCategoryExpenseFailAction>(fetchCategoryExpenseFailReducer)
]);