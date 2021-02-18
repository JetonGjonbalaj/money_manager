import 'package:money_manager/redux/category_expenses/actions/fetch_category_expense_fail_action.dart';
import '../category_expenses_state.dart';

CategoryExpensesState fetchCategoryExpenseFailReducer(CategoryExpensesState state, FetchCategoryExpenseFailAction action) =>
  state.copyWith(
    loading: false,
    status: "Fetching failed"
  );