import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/chart_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<ExpenseModel> expenses;
  final double totalSum;

  Chart({super.key, required this.expenses})
    : totalSum = expenses.fold(0, (p, e) => p + e.amount);

  double calculateFactorByCategory(Category category) {
    double sumCategory = expenses.fold(
      0,
      (p, e) => p + (e.category == category ? e.amount : 0),
    );

    return totalSum > 0 ? sumCategory / totalSum : 0;
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
