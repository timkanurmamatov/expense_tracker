
import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class ExpenseListTile extends StatelessWidget {
  final ExpenseModel expense;

  const ExpenseListTile({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 165, 200, 216),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Text(
              expense.title, 
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 12),
            
         
            Row(
  children: [
    Image.network(
      'https://thumbs.dreamstime.com/b/kgs-letter-initial-logo-design-vector-illustration-236631128.jpg',
      width: 50,
      height: 50,
    
    ),

    SizedBox(width: 8),

    Text("${expense.amount}"),
    
    Spacer(),

    Icon(Icons.access_alarm),

    SizedBox(width: 12),

    Text(expense.date.toString()),
  ],
),
          ],
        ),
      ),
    );
  }
}
