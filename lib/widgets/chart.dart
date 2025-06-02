import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<ExpenseModel> expenses;

  const Chart({super.key, required this.expenses});

  double calculateFactorByCategory(Category category) {
    double sum = 0;
    for(ExpenseModel expense in expenses){
      sum+=expense.amount;
    }

    double sumCategory = 0;
    for(ExpenseModel expense in expenses){
      if(expense.category == category){
        sumCategory+=expense.amount;
      }
    }

    return sumCategory / sum;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          spacing: 12,
          children: List.generate(Category.values.length, (index) {
            return Expanded(
              child: ChartBar(
                heightFactor: calculateFactorByCategory(Category.values[index]), 
                icon: Category.values[index].icon,
                      ),
            );
          }),
        ),
      ),
    );
  }
}
