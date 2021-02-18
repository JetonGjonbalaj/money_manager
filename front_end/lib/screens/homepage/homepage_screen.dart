import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:money_manager/models/upcoming_expense.dart';
import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/redux/balance/actions/fetch_balance_action.dart';
import 'package:money_manager/redux/category_expenses/actions/fetch_category_expense_action.dart';
import 'package:money_manager/redux/upcoming_expense/actions/fetch_upcoming_expense_action.dart';
import 'package:money_manager/screens/homepage/homepage_viewmodel.dart';
import 'package:money_manager/services/number_format_service.dart';
import 'package:money_manager/utils/constants.dart';
import 'package:redux/redux.dart';
import '../../components/upcoming_expense/upcoming_expense_list.dart';
import '../../components/layout/layout.dart';
import '../../components/box_shadow/custom_box_shadow.dart';

class HomeScreen extends StatelessWidget{
  static String routeName = '/homescreen';

  Widget balanceAmount(BuildContext context, HomeScreenViewmodel vm) =>
    vm.loadingBalance
      ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(vm.balanceStatus, style: Theme.of(context).textTheme.subtitle1,)
        ],
      )
      : Text(NumberFormatService.formatToPrice(vm.balanceAmount), style: Theme.of(context).textTheme.headline3);

  Widget upcomingExpenses(BuildContext context, HomeScreenViewmodel vm) =>
    vm.loadingUpcomingExpenses
      ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(vm.upcomingExpensesStatus, style: Theme.of(context).textTheme.subtitle1,)
        ],
      )
      : vm.upcomingExpenses.length != 0
        ? Container(
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
                        Text(NumberFormatService.formatToPrice(vm.upcomingExpensesAmount)),
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
                  child: UpcomingExpensesList(upcomingExpenses: vm.upcomingExpenses),
                ),
              ],
            ),
          )
        : SizedBox();

  Widget categoryExpenses(BuildContext context, HomeScreenViewmodel vm) =>
  vm.loadingExpensesByCategory
    ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          Text(vm.expensesByCategoryStatus, style: Theme.of(context).textTheme.subtitle1,)
        ],
      )
    : vm.expensesByCategory.length != 0
      ? Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Expenses this month", style: Theme.of(context).textTheme.headline5),
                  // Row(
                  //   children: [
                  //     Text("-\$ 320.00"),
                  //     SizedBox(width: 5),
                  //     Icon(
                  //       FontAwesomeIcons.angleRight,
                  //       color: Color.fromRGBO(0, 0, 0, 0.4),
                  //     )
                  //   ],
                  // ),
                ],
              ),

              SizedBox(height: 10.0),

              Container(
                height: (74.0 * vm.expensesByCategory.length),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: vm.expensesByCategory.length,
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
                                Image.network(endPointURL + vm.expensesByCategory[index].categoryImg, width: 32, height: 32,),
                                SizedBox(width: 10),
                                Text(vm.expensesByCategory[index].categoryName, style: Theme.of(context).textTheme.bodyText1,),
                              ],
                            ),
                            Row(
                              children: [
                                Text(NumberFormatService.formatToPrice(vm.expensesByCategory[index].amount)),
                                SizedBox(width: 5),
                                // Icon(
                                //   FontAwesomeIcons.angleRight,
                                //   color: Color.fromRGBO(0, 0, 0, 0.4),
                                // )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => SizedBox(height: 20),
                ),
              )
            ],
          ),
        )
      : SizedBox();

  Widget content(BuildContext context, HomeScreenViewmodel vm) =>
    Layout(
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text("${vm.userName}", style: Theme.of(context).textTheme.headline5),
                            Text("Free user", style: Theme.of(context).textTheme.bodyText2)
                          ],
                        )
                      ],
                    ),

                    SizedBox(height: 20.0,),

                    Text("Total balance to spend", style: Theme.of(context).textTheme.bodyText1),
                    balanceAmount(context, vm)
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.0),
            upcomingExpenses(context, vm),
            SizedBox(height: 20.0),
            categoryExpenses(context, vm)
          ],
        ),
      ),
    );

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      onInit: (store) {
        store.dispatch(FetchBalanceAction());
        store.dispatch(FetchUpcomingExpenseAction());
        store.dispatch(FetchCategoryExpenseAction());
      },
      converter: (Store<AppState> store) => HomeScreenViewmodel.fromStore(store),
      builder: (context, vm) => content(context, vm),
    );
  }
}