import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expense_list_tile.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel expense) onRemoveExpense;

  const ExpenseList({super.key, required this.expenses, required this.onRemoveExpense});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      itemCount: expenses.length,
      separatorBuilder: (context, index) {
        return SizedBox(height: 12);
      },
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed: (direction) {
            onRemoveExpense(expenses[index]);
          },
          background: Container(
            color: Colors.redAccent,
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(Icons.delete, color: Colors.white),
            ),
          ),
          child: ExpenseListTile(
            expense: expenses[index],
            color: index % 2 == 0
            ? const Color.fromARGB(255, 165, 200, 216)
            : const Color.fromARGB(255, 198, 165, 216),
          ),
        );
      },
    );
  }
}