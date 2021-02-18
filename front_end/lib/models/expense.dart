import 'package:intl/intl.dart';

class Expense {
  double amount;
  String description;
  DateTime expendedAt;
  String categoryId;

  Expense({this.amount, this.description, this.expendedAt, this.categoryId});

  Expense.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    description = json['description'];
    expendedAt = DateTime.parse(json['expendedAt']);
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['description'] = this.description;
    data['expendedAt'] = DateFormat('yyyy-MM-dd HH:mm:ss').format(this.expendedAt).split(" ").join("T") + 'Z';
    data['categoryId'] = this.categoryId;
    return data;
  }
}