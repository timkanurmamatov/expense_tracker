class ExpenseModel {
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  final String id;

  ExpenseModel({
    required this.title, 
    required this.amount, 
    required this.date, 
    required this.category,
  }) : id = "";
}

enum Category {
  food,
  travel,
  leisure,
  work,
}