class Balance {
  final double balanceAmount;

  Balance({this.balanceAmount});

  Balance.fromJson(Map<String, dynamic> json) :
    balanceAmount = json['balanceAmount'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['balanceAmount'] = this.balanceAmount;
    return data;
  }
}