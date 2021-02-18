import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:money_manager/components/layout/layout.dart';
import 'package:money_manager/redux/app_state.dart';
import 'package:money_manager/screens/records/records_viewmodel.dart';
import 'package:redux/redux.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({Key key}) : super(key: key);

  Widget content(RecordsViewmodel vm, BuildContext context) => 
    Layout(
      child: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text('Income'),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
              onTap: () => vm.addIncomePage(context),
            ),
          ),
          Card(
            child: ListTile(
              title: Text('Expense'),
              trailing: Icon(Icons.keyboard_arrow_right_outlined),
              onTap: () => vm.addExpensePage(context),
            ),
          ),
        ],
      ),
    );

  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (Store<AppState> store) => RecordsViewmodel.fromStore(store),
      builder: (context, vm) => content(vm, context), 
    );
  }
}