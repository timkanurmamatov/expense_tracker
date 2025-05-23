import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  final List<ExpenseModel> expenses;

  const ExpenseList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(expenses.length, (index) {
        return Text(expenses[index].title, style: TextStyle(fontSize: 35));
      }),
    );
  }
}
