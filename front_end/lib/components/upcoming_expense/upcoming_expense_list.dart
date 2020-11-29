import 'package:flutter/material.dart';

// Models
import '../../models/upcoming_expense.dart';

// Components
import '../upcoming_expense/upcoming_expense_widget.dart';

class UpcomingExpensesList extends StatelessWidget {
  final List<UpcomingExpense> upcomingExpenses;

  UpcomingExpensesList({this.upcomingExpenses});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      itemCount: upcomingExpenses.length,
      itemBuilder: (BuildContext context, int index) => 
        UpcomingExpenseWidget(upcomingExpense: upcomingExpenses[index]),
      separatorBuilder: (BuildContext context, int index) => SizedBox(width: 10),
    );
  }
}