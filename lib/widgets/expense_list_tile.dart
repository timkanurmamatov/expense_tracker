// tile - плитка
import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseListTile extends StatelessWidget {
  final ExpenseModel expense;

  const ExpenseListTile({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    final date = expense.date;
    final formattedDate = DateFormat('dd.MM.yyyy').format(date);
    return Card(
      color: const Color.fromARGB(255, 161, 248, 217),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            Text(expense.title, style: TextStyle(fontSize: 20)),
            SizedBox(height: 12),
            // Row
            // [amount, *spacer, category, date]
            Row(
              children: [
                // amount
                // todo: Заменить KGS на иконку из интернета (Image.asset - .png)
                Image.asset(
                  'assets/images/Kyrgyzstan.png',
                  height: 25,
                  width: 25,
                ),
                SizedBox(width: 5),
                Text('KGS ${expense.amount}'),
                

                // spacer
                Spacer(),

                // icon -> category
                Icon(Icons.date_range),

                SizedBox(width: 12),

                // date
                Text(formattedDate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
