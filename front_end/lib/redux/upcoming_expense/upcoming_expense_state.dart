import 'package:flutter/material.dart';
import 'package:money_manager/models/upcoming_expense.dart';

class UpcomingExpenseState {
  final bool loading;
  final String status;
  final UpcomingExpenses upcomingExpenses;

  UpcomingExpenseState({
    @required this.loading,
    @required this.status,
    @required this.upcomingExpenses
  });

  factory UpcomingExpenseState.initial() {
    return UpcomingExpenseState(
      loading: false,
      status: "",
      upcomingExpenses: UpcomingExpenses(upcomingExpensesAmount: 0, upcomingExpenses: [])
    );
  }

  UpcomingExpenseState copyWith({
    bool loading,
    String status,
    UpcomingExpenses upcomingExpenses
  }) {
    return UpcomingExpenseState(
      loading: loading ?? this.loading,
      status: status ?? this.status,
      upcomingExpenses: upcomingExpenses ?? this.upcomingExpenses
    );
  }
}