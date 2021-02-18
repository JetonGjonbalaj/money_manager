import 'package:flutter/material.dart';
import 'package:money_manager/models/balance.dart';

class FetchBalanceSuccessAction {
  final Balance amount;

  FetchBalanceSuccessAction({
    @required this.amount
  });
}