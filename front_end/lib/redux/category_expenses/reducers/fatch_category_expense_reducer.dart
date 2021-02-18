import 'package:money_manager/redux/category_expenses/actions/fetch_category_expense_action.dart';
import '../category_expenses_state.dart';

CategoryExpensesState fetchCategoryExpenseReducer(CategoryExpensesState state, FetchCategoryExpenseAction action) =>
  state.copyWith(
    loading: true,
    status: "Fetching expenses by category"
  );