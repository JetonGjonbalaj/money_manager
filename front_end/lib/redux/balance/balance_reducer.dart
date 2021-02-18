import 'package:money_manager/redux/balance/actions/fetch_balance_action.dart';
import 'package:money_manager/redux/balance/actions/fetch_balance_fail_action.dart';
import 'package:money_manager/redux/balance/actions/fetch_balance_success_action.dart';
import 'package:money_manager/redux/balance/balance_state.dart';
import 'package:money_manager/redux/balance/reducers/fetch_balance_fail_reducer.dart';
import 'package:money_manager/redux/balance/reducers/fetch_balance_reducer.dart';
import 'package:money_manager/redux/balance/reducers/fetch_balance_success_reducer.dart';
import 'package:redux/redux.dart';

Reducer<BalanceState> balanceReducer = combineReducers<BalanceState>([
  new TypedReducer<BalanceState, FetchBalanceAction>(fetchBalanceReducer),
  new TypedReducer<BalanceState, FetchBalanceSuccessAction>(fetchBalanceSuccessReducer),
  new TypedReducer<BalanceState, FetchBalanceFailAction>(fetchBalanceFailReducer)
]);