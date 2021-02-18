import 'package:money_manager/redux/balance/actions/fetch_balance_action.dart';
import 'package:money_manager/redux/balance/balance_state.dart';

BalanceState fetchBalanceReducer(BalanceState state, FetchBalanceAction action) =>
  state.copyWith(
    loading: true,
    status: "Fetching balance"
  );