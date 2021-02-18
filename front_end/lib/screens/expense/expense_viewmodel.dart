import 'package:money_manager/models/category.dart';
import 'package:money_manager/models/expense.dart';
import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/redux/record/actions/expense_post_action.dart';
import 'package:redux/redux.dart';

class ExpenseViewmodel {
  final bool loading;
  final bool categoriesLoading;
  final String stateStatus;
  final String categoriesStatus;
  final String message;
  final List<String> errorList;
  final List<Category> categories;

  final Function(Expense expenseRequest) addExpense;

  ExpenseViewmodel({
    this.loading,
    this.categoriesLoading,
    this.stateStatus,
    this.categoriesStatus,
    this.message,
    this.errorList,
    this.categories,
    this.addExpense
  });

  static ExpenseViewmodel fromStore(Store<AppState> store) {
    return ExpenseViewmodel(
      loading: store.state.recordState.loading,
      categoriesLoading: store.state.categoriesState.loading,
      stateStatus: store.state.recordState.stateStatus,
      categoriesStatus: store.state.categoriesState.status,
      message: store.state.recordState.message,
      errorList: store.state.recordState.errorList,
      categories: store.state.categoriesState.categories,
      addExpense: (Expense expenseRequest) => store.dispatch(ExpensePostAction(expense: expenseRequest))
    );
  }
}