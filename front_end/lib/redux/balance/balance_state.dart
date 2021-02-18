import 'package:money_manager/models/balance.dart';

class BalanceState {
  final bool loading;
  final String status;
  final Balance balanceAmount;

  BalanceState({
    this.loading,
    this.status,
    this.balanceAmount
  });

  BalanceState copyWith({
    bool loading,
    String status,
    Balance balanceAmount
  }) =>
    BalanceState(
      loading: loading ?? this.loading,
      status: status ?? this.status,
      balanceAmount: balanceAmount ?? this.balanceAmount
    );

  factory BalanceState.initial() =>
    BalanceState(
      loading: false,
      status: "",
      balanceAmount: Balance(balanceAmount: 0)
    );

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
      other is BalanceState &&
        runtimeType == other.runtimeType &&
        balanceAmount == other.balanceAmount &&
        status == other.status &&
        loading == other.loading;

  @override
  int get hashCode =>
    balanceAmount.hashCode ^
    status.hashCode ^
    loading.hashCode;
}