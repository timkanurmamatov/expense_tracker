import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  final List<ExpenseModel> expenses;
  const ExpensesList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(expenses.length, (index) {
        return Text(expenses[index].title);
      }),
    );
  }
}
