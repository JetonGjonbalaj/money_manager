class UpcomingExpense {
  double expense;
  String daysLeft;

  UpcomingExpense({this.expense, this.daysLeft});

  String get expenseFixed => expense.toStringAsFixed(2);
}

List<UpcomingExpense> upcomingExpensesList = [
  UpcomingExpense(expense: 30, daysLeft: "2 days"),
  UpcomingExpense(expense: 30, daysLeft: "2 days"),
  UpcomingExpense(expense: 30, daysLeft: "2 days"),
];