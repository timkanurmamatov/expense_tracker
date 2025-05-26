// tile - плитка
import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseListTile extends StatelessWidget {
  final ExpenseModel expense;
  final Color color;

  const ExpenseListTile({super.key, required this.expense, required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // title
            Text(
              expense.title, 
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 12),
            // Row
            // [amount, *spacer, category, date]
            Row(
              children: [
                // amount
                // todo: Заменить KGS на иконку из интернета (Image.asset - .png)
                Text("KGS ${expense.amount}"),

                // spacer
                Spacer(),

                // icon -> category
                Icon(expense.category.icon),

                SizedBox(width: 12),
                
                // date
                Text(getFormattedDate(expense.date)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String getFormattedDate(DateTime date){
    var format = DateFormat('dd.MM.yyyy');
   return format.format(date);
  }
}
