import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expense_list_tile.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  final List<ExpenseModel> expenses;

  const ExpenseList({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    return Column(
        // for(ExpenseModel e in expenses){
        //   e
        // }
        children: expenses.map(
          (e) { // e -> expenses[i]
            return ExpenseListTile(expense: e);
          },
        ).toList(),
      );
  }
}


// Text(expenses[index].title, style: TextStyle(fontSize: 35))