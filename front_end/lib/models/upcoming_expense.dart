class UpcomingExpenses {
  double upcomingExpensesAmount;
  List<UpcomingExpense> upcomingExpenses;

  UpcomingExpenses({this.upcomingExpensesAmount, this.upcomingExpenses});

  UpcomingExpenses.fromJson(Map<String, dynamic> json) {
    upcomingExpensesAmount = json['upcomingExpensesAmount'];
    if (json['upcomingExpenses'] != null) {
      upcomingExpenses = new List<UpcomingExpense>();
      json['upcomingExpenses'].forEach((v) {
        upcomingExpenses.add(new UpcomingExpense.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['upcomingExpensesAmount'] = this.upcomingExpensesAmount;
    if (this.upcomingExpenses != null) {
      data['upcomingExpenses'] =
          this.upcomingExpenses.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UpcomingExpense {
  final double amount;
  final String description;
  final DateTime dateTime;

  UpcomingExpense({this.amount, this.description, this.dateTime});

  UpcomingExpense.fromJson(Map<String, dynamic> json) :
    amount = json['amount'],
    description = json['description'],
    dateTime = DateTime.parse(json['dateTime']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['description'] = this.description;
    data['dateTime'] = this.dateTime;
    return data;
  }


  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
      other is UpcomingExpense &&
      amount == other.amount &&
      description == other.description &&
      dateTime == other.dateTime;

  @override
  int get hashCode =>
    amount.hashCode ^
    description.hashCode ^
    dateTime.hashCode;
}