import 'package:intl/intl.dart';

class NumberFormatService {
  static String currency = "\$";
  static NumberFormat currencyFormat = NumberFormat.currency(symbol: currency);

  static String formatToPrice(double number) => currencyFormat.format(number);
}