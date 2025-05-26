import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expense_list_tile.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  final List<ExpenseModel> expenses;

  const ExpenseList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      itemCount: expenses.length,
      separatorBuilder: (context, index) {
        return SizedBox(height: 12);
      },
      itemBuilder: (context, index) {
        return ExpenseListTile(
          expense: expenses[index],
          color: index % 2 == 0
          ? const Color.fromARGB(255, 165, 200, 216)
          : const Color.fromARGB(255, 198, 165, 216),
        );
      },
    );
  }
}