import 'package:money_manager/redux/balance/actions/fetch_balance_action.dart';
import 'package:money_manager/redux/balance/actions/fetch_balance_fail_action.dart';
import 'package:money_manager/redux/balance/balance_state.dart';

BalanceState fetchBalanceFailReducer(BalanceState state, FetchBalanceFailAction action) =>
  state.copyWith(
    loading: false,
    status: "Fetching failed"
  );