import 'package:flutter/material.dart';
import 'package:money_manager/models/category_expense.dart';

class FetchCategoryExpenseSuccessAction {
  final List<CategoryExpense> categoryExpenses;

  FetchCategoryExpenseSuccessAction({
    @required this.categoryExpenses
  });
}