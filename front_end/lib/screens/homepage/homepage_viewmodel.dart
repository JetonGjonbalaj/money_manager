import 'package:money_manager/models/category_expense.dart';
import 'package:money_manager/models/upcoming_expense.dart';
import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/services/jwt_service.dart';
import 'package:redux/redux.dart';

class HomeScreenViewmodel {
  final String userName;
  final bool loadingBalance;
  final String balanceStatus;
  final double balanceAmount;
  final bool loadingUpcomingExpenses;
  final String upcomingExpensesStatus;
  final double upcomingExpensesAmount;
  final List<UpcomingExpense> upcomingExpenses;
  final bool loadingExpensesByCategory;
  final String expensesByCategoryStatus;
  final List<CategoryExpense> expensesByCategory;

  HomeScreenViewmodel({
    this.userName,
    this.loadingBalance,
    this.balanceStatus,
    this.balanceAmount,
    this.loadingUpcomingExpenses,
    this.upcomingExpensesStatus,
    this.upcomingExpensesAmount,
    this.upcomingExpenses,
    this.loadingExpensesByCategory,
    this.expensesByCategoryStatus,
    this.expensesByCategory
  });

  static HomeScreenViewmodel fromStore(Store<AppState> store) {
    return HomeScreenViewmodel(
      userName: JWTService.getUserName(store.state.authState.loginData.token),
      loadingBalance: store.state.balanceState.loading,
      balanceStatus: store.state.balanceState.status,
      balanceAmount: store.state.balanceState.balanceAmount.balanceAmount,
      loadingUpcomingExpenses: store.state.upcomingExpenseState.loading,
      upcomingExpensesStatus: store.state.upcomingExpenseState.status,
      upcomingExpensesAmount: store.state.upcomingExpenseState.upcomingExpenses.upcomingExpensesAmount,
      upcomingExpenses: store.state.upcomingExpenseState.upcomingExpenses.upcomingExpenses,
      loadingExpensesByCategory: store.state.categoryExpensesState.loading,
      expensesByCategory: store.state.categoryExpensesState.categoryExpenses,
      expensesByCategoryStatus: store.state.categoryExpensesState.status
    );
  }
}