import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/char_bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<ExpenseModel> expense;
  final double totalSum;

  Chart({super.key, required this.expense})
    : totalSum = expense.fold(0, (p, e) => p + e.amount);
  /*
0 — начальное значение (prev). Мы начинаем суммирование с нуля.
(prev, element) => prev + element — функция, 
которая на каждом шаге прибавляет текущий элемент (element) к накопленной сумме (prev).
Проход по элементам списка
Итерация	prev	element	(prev + element)
   1	     0	     1	       1
   2	     1	     2	       3
   3	     3	     3	       6
   4	     6	     4	       10
  */

  double calculateCat(Category category) {
    double sumCat = expense.fold(
      0,
      (p, e) => p + (e.category == category ? e.amount : 0),
    );
    return totalSum > 0 ? sumCat / totalSum : 0;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          children: List.generate(Category.values.length, (index) {
            return Expanded(
              child: CharBar(
                heightFactor: calculateCat(Category.values[index]),
                icon: Category.values[index].icon,
              ),
            );
          }),
        ),
      ),
    );
  }
}
