import 'package:flutter/material.dart';
import 'package:money_manager/screens/expense/expense_screen.dart';
import 'package:money_manager/screens/homepage/homepage_screen.dart';
import 'package:money_manager/screens/income/income_screen.dart';
import 'package:money_manager/screens/records/records_screen.dart';
import 'package:money_manager/screens/settings/settings_screen.dart';

class DashboardScreen extends StatelessWidget {
  static String routeName = '/dashboard';
  final List<Widget> tabViews = [
    HomeScreen(),
    // IncomeScreen(),
    RecordScreen(),
    // Icon(Icons.calendar_today),
    SettingsScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(
            children: tabViews, 
          ),
          bottomNavigationBar: BottomAppBar(
            child: TabBar(
              indicatorColor: Colors.transparent,
              tabs: [
                Tab(
                  icon: Icon(Icons.home)
                ),
                Tab(
                  icon: Icon(Icons.add),
                ),
                Tab(
                  icon: Icon(Icons.settings),
                )
              ]
            ),
          ),
        ),
    );
  }
}