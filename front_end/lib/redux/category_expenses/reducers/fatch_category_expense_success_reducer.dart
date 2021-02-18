import 'package:money_manager/redux/category_expenses/actions/fetch_category_expense_success_action.dart';
import '../category_expenses_state.dart';

CategoryExpensesState fetchCategoryExpenseSuccessReducer(CategoryExpensesState state, FetchCategoryExpenseSuccessAction action) =>
  state.copyWith(
    loading: false,
    status: "",
    categoryExpenses: action.categoryExpenses
  );