import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expense_list_tile.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  final List<ExpenseModel> expenses;

  const ExpenseList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Column(
       
        children: expenses.map(
          (e) { 
            return ExpenseListTile(expense: e);
          },
        ).toList(),
      );
  }
}


