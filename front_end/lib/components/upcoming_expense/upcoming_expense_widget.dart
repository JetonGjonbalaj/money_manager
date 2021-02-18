import 'package:flutter/material.dart';
import 'package:money_manager/services/number_format_service.dart';

// Models
import '../../models/upcoming_expense.dart';

// Components
import '../../components/box_shadow/custom_box_shadow.dart';

class UpcomingExpenseWidget extends StatelessWidget {
  final UpcomingExpense upcomingExpense;

  UpcomingExpenseWidget({this.upcomingExpense});
  
  @override
  Widget build(BuildContext context) {
    return CustomBoxShadow(
      width: 100,
      child: Column(
        children: <Widget>[
          Text(
            upcomingExpense.description, //${/*upcomingExpense.daysLeft*/}
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10),
          Text(
            NumberFormatService.formatToPrice(upcomingExpense.amount), //${/*upcomingExpense.expense*/}
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          )
        ],
      )
    );
  }
}