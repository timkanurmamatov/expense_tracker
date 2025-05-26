// tile - плитка
import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseListTile extends StatelessWidget {
  final ExpenseModel expense;
  final Color color;

  const ExpenseListTile({
    super.key,
    required this.expense,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    //final DateTime date = expense.date;
    final String formattedDate = DateFormat.yMd().format(expense.date);
    return Card(
      color: color,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(expense.title, style: TextStyle(fontSize: 20)),
            SizedBox(height: 12),
            Row(
              children: [
                Image.asset(
                  'assets/images/Kyrgyzstan.png',
                  height: 25,
                  width: 25,
                ),
                SizedBox(width: 5),
                Text('KGS ${expense.amount}'),
                Spacer(),
                Icon(expense.category.icon),
                SizedBox(width: 12),
                Text(formattedDate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
