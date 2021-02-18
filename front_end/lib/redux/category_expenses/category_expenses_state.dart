import 'package:flutter/material.dart';
import 'package:money_manager/models/category_expense.dart';

class CategoryExpensesState {
  final bool loading;
  final String status;
  final List<CategoryExpense> categoryExpenses;

  CategoryExpensesState({
    @required this.loading,
    @required this.status,
    @required this.categoryExpenses
  });

  factory CategoryExpensesState.initial() {
    return CategoryExpensesState(
      loading: false,
      status: "",
      categoryExpenses: []
    );
  }

  CategoryExpensesState copyWith({
    bool loading,
    String status,
    List<CategoryExpense> categoryExpenses
  }) {
    return CategoryExpensesState(
      loading: loading ?? this.loading,
      status: status ?? this.status,
      categoryExpenses: categoryExpenses ?? this.categoryExpenses
    );
  }
}