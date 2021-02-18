import 'package:money_manager/redux/balance/actions/fetch_balance_action.dart';
import 'package:money_manager/redux/balance/actions/fetch_balance_success_action.dart';
import 'package:money_manager/redux/balance/balance_state.dart';

BalanceState fetchBalanceSuccessReducer(BalanceState state, FetchBalanceSuccessAction action) =>
  state.copyWith(
    loading: false,
    status: "",
    balanceAmount: action.amount
  );