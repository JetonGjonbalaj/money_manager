import 'package:flutter/material.dart';

// Constants
import './constants.dart';

// Models
import './models/upcoming_expense.dart';

// Components
import './components/upcoming_expense/upcoming_expense_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        primaryColor: Colors.black,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: textColor),
      ),
      home: Scaffold(
        body: UpcomingExpensesList(upcomingExpenses:  [
          UpcomingExpense(expense: 30, daysLeft: "2 days"),
          UpcomingExpense(expense: 30, daysLeft: "2 days"),
          UpcomingExpense(expense: 30, daysLeft: "2 days"),
          UpcomingExpense(expense: 30, daysLeft: "2 days"),
          UpcomingExpense(expense: 30, daysLeft: "2 days"),
          UpcomingExpense(expense: 30, daysLeft: "2 days"),
          UpcomingExpense(expense: 30, daysLeft: "2 days"),
          UpcomingExpense(expense: 30, daysLeft: "2 days"),
          UpcomingExpense(expense: 30, daysLeft: "2 days"),
        ])
      ),
    );
  }
}