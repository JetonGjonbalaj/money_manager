import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/screens/expense/expense_screen.dart';
import 'package:money_manager/screens/income/income_screen.dart';
import 'package:redux/redux.dart';

class RecordsViewmodel {
  final Function(BuildContext context) addIncomePage;
  final Function(BuildContext context) addExpensePage;

  RecordsViewmodel({
    this.addIncomePage,
    this.addExpensePage
  });

  static RecordsViewmodel fromStore(Store<AppState> store) =>
    RecordsViewmodel(
      addIncomePage: (BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => IncomeScreen())
      ),
      addExpensePage: (BuildContext context) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ExpenseScreen())
      ),
    );
}