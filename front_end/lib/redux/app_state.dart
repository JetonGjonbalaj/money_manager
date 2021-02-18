import 'package:flutter/material.dart';
import 'package:money_manager/redux/auth/auth_state.dart';
import 'package:money_manager/redux/balance/balance_state.dart';
import 'package:money_manager/redux/categories/categories_state.dart';
import 'package:money_manager/redux/category_expenses/category_expenses_state.dart';
import 'package:money_manager/redux/record/record_state.dart';
import 'package:money_manager/redux/upcoming_expense/upcoming_expense_state.dart';

import 'theme/theme_state.dart';

@immutable
class AppState {
  final ThemeState themeState;
  final AuthState authState;
  final BalanceState balanceState;
  final UpcomingExpenseState upcomingExpenseState;
  final CategoriesState categoriesState;
  final CategoryExpensesState categoryExpensesState;
  final RecordState recordState;

  AppState({
    @required this.themeState,
    @required this.authState,
    @required this.balanceState,
    @required this.upcomingExpenseState,
    @required this.categoriesState,
    @required this.categoryExpensesState,
    @required this.recordState,
  });

  factory AppState.initial() {
    return AppState(
      themeState: ThemeState.initial(),
      authState: AuthState.initial(),
      balanceState: BalanceState.initial(),
      upcomingExpenseState: UpcomingExpenseState.initial(),
      categoriesState: CategoriesState.initial(),
      categoryExpensesState: CategoryExpensesState.initial(),
      recordState: RecordState.initial(),
    );
  }

  AppState copyWith({
    ThemeState themeState,
    AuthState logInState,
    BalanceState balanceState,
    UpcomingExpenseState upcomingExpenseState,
    CategoriesState categoriesState,
    CategoryExpensesState categoryExpensesState,
    RecordState recordState,
  }) {
    return AppState(
      themeState: themeState ?? this.themeState,
      authState: logInState ?? this.authState,
      balanceState: balanceState ?? this.balanceState,
      upcomingExpenseState: upcomingExpenseState ?? this.upcomingExpenseState,
      categoriesState: categoriesState ?? this.categoriesState,
      categoryExpensesState: categoryExpensesState ?? this.categoryExpensesState,
      recordState: recordState ?? this.recordState
    );
  }
}