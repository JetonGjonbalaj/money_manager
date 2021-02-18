import 'package:flutter/material.dart';
import 'package:money_manager/models/upcoming_expense.dart';

class FetchUpcomingExpenseSuccessAction {
  final UpcomingExpenses upcomingExpenses;

  FetchUpcomingExpenseSuccessAction({
    @required this.upcomingExpenses
  });
}