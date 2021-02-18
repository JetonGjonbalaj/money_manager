class CategoryExpense {
  final String categoryId;
  final String categoryImg;
  final String categoryName;
  final double amount;

  CategoryExpense({
    this.categoryId, 
    this.categoryImg, 
    this.categoryName, 
    this.amount
  });

  CategoryExpense.fromJson(Map<String, dynamic> json) :
    categoryId = json['categoryId'],
    categoryImg = json['categoryImg'],
    categoryName = json['categoryName'],
    amount = json['amount'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoryId'] = this.categoryId;
    data['categoryImg'] = this.categoryImg;
    data['categoryName'] = this.categoryName;
    data['amount'] = this.amount;
    return data;
  }
}

// class ExpensesByCategory {
//   List<CategoryExpense> expensesByCategory;

  
// }