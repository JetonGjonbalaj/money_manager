import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Constants
import '../constants.dart';

// Models
import '../models/upcoming_expense.dart';

// Components
import '../components/upcoming_expense/upcoming_expense_list.dart';
import '../components/layout/layout.dart';
import '../components/box_shadow/custom_box_shadow.dart';

class HomePage extends StatelessWidget{
  final List<String> expenseName = ["Auto", "Beauty", "Clothes", "Entertainment", "Groceries", "Home", "Medical"];
  final List<double> expenseValue = [135.00, 321.32, 87.32, 24.12, 93.98, 85.38, 124.98];
  final List<IconData> expenseIcon = [FontAwesomeIcons.car, FontAwesomeIcons.female, FontAwesomeIcons.tshirt, FontAwesomeIcons.ticketAlt, FontAwesomeIcons.apple, FontAwesomeIcons.home, FontAwesomeIcons.medkit];

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          children: <Widget>[
            Container(
              clipBehavior: Clip.none,
              child: CustomBoxShadow(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline:  TextBaseline.alphabetic,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      children: <Widget>[
                        Container(
                          width: 64.0,
                          height: 64.0,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.all(Radius.circular(32.0)),
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/profile.jpg'
                              )
                            )
                          ),
                        ),
                        SizedBox(width: 10.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text("Fitim Cakolli", style: Theme.of(context).textTheme.headline5),
                            Text("Free user", style: Theme.of(context).textTheme.bodyText2)
                          ],
                        )
                      ],
                    ),

                    SizedBox(height: 20.0,),

                    Text("Total balance to spend", style: Theme.of(context).textTheme.bodyText1),
                    Text("\$ 5000.00", style: Theme.of(context).textTheme.headline3,),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              clipBehavior: Clip.none,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Planning ahead", style: Theme.of(context).textTheme.headline5),
                      Row(
                        children: [
                          Text("-\$ 340.00"),
                          SizedBox(width: 5),
                          Icon(
                            FontAwesomeIcons.angleRight,
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                          )
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 10.0),

                  SizedBox(
                    height: 84.0,
                    child: UpcomingExpensesList(upcomingExpenses: [
                      UpcomingExpense(expense: 140.36, daysLeft: "in 2 days"),
                      UpcomingExpense(expense: 30.32, daysLeft: "in 3 days"),
                      UpcomingExpense(expense: 40.56, daysLeft: "in 4 days"),
                      UpcomingExpense(expense: 80.56, daysLeft: "in 5 days"),
                    ]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Expenses this month", style: Theme.of(context).textTheme.headline5),
                      Row(
                        children: [
                          Text("-\$ 320.00"),
                          SizedBox(width: 5),
                          Icon(
                            FontAwesomeIcons.angleRight,
                            color: Color.fromRGBO(0, 0, 0, 0.4),
                          )
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 10.0),

                  Container(
                    height: (74.0 * expenseName.length),
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: expenseName.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 54,
                          child: CustomBoxShadow(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  children: [
                                    Icon(
                                      expenseIcon[index],
                                      size: 24
                                    ),
                                    SizedBox(width: 10),
                                    Text("${expenseName[index]}", style: Theme.of(context).textTheme.bodyText1,),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("-\$ ${expenseValue[index]}"),
                                    SizedBox(width: 5),
                                    Icon(
                                      FontAwesomeIcons.angleRight,
                                      color: Color.fromRGBO(0, 0, 0, 0.4),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => SizedBox(height: 20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}