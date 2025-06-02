import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expense_list_tile.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  final List<ExpenseModel> expenses;
  final void Function(ExpenseModel expense) onRemoveExp;

  const ExpenseList({super.key, required this.expenses, required this.onRemoveExp});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(expenses[index]),
          onDismissed:(direction) {
            onRemoveExp(expenses[index]);
            
          },
          background: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.delete, color: Colors.red,),
            ],
          ),
          child: ExpenseListTile(
            expense: expenses[index],
            color: index % 2 == 0 ? Colors.amberAccent : Colors.deepOrangeAccent,
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 10);
      },
    );
  }
}