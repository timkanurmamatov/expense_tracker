import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<ExpenseModel> expense;
  final double totalSum;
  
  const Chart({super.key, required this.expense}) : totalSum = expense.fold(0);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(padding: EdgeInsets.all(20), child: Row(children: [])),
    );
  }
}
