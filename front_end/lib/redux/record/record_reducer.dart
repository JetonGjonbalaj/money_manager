import 'package:money_manager/redux/record/actions/expense_post_action.dart';
import 'package:money_manager/redux/record/actions/income_post_action.dart';
import 'package:money_manager/redux/record/actions/record_fail_action.dart';
import 'package:money_manager/redux/record/actions/record_success_action.dart';
import 'package:money_manager/redux/record/record_state.dart';
import 'package:money_manager/redux/record/reducers/expense_post_reducer.dart';
import 'package:money_manager/redux/record/reducers/income_post_reducer.dart';
import 'package:money_manager/redux/record/reducers/record_fail_reducer.dart';
import 'package:money_manager/redux/record/reducers/record_success_reducer.dart';
import 'package:redux/redux.dart';

Reducer<RecordState> recordStateReducer = combineReducers<RecordState>([
  new TypedReducer<RecordState, ExpensePostAction>(expensePostReducer),
  new TypedReducer<RecordState, IncomePostAction>(incomePostReducer),
  new TypedReducer<RecordState, RecordFailAction>(recordFailReducer),
  new TypedReducer<RecordState, RecordSuccessAction>(recordSuccessReducer)
]);