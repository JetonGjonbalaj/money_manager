import 'package:intl/intl.dart';

class Income {
  final double amount;
  final String description;
  final DateTime incomeAt;

  Income({this.amount, this.description, this.incomeAt});

  Income.fromJson(Map<String, dynamic> json) :
    amount = json['amount'],
    description = json['description'],
    incomeAt = DateTime.parse(json['incomeAt']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['description'] = this.description;
    data['incomeAt'] = DateFormat('yyyy-MM-dd HH:mm:ss').format(this.incomeAt).split(" ").join("T") + 'Z';
    return data;
  }
}