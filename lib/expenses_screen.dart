import 'package:expense_tracker/expense_model.dart';
import 'package:flutter/material.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  late List<ExpenseModel> expenses;

  @override
  void initState() {
    expenses = [
      ExpenseModel(
        title: "Курсы Flutter",
        amount: 50,
        date: DateTime.now(),
        category: Category.work,
      ),
      ExpenseModel(
        title: "Кинотеатр",
        amount: 15.55,
        date: DateTime.now(),
        category: Category.leisure,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Трекер расходов"),
        centerTitle: true,
        actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 300,
              //alignment: Alignment.center,
              color: Colors.amber,
              child: Text("Инфографика"),
            ),
            // todo: Заменить контейнер снизу списком расходов из [expenses] в виде виджетов Text
            Container(
              width: double.infinity,
              height: 300,
              color: Colors.blueAccent,
              child: Expanded(
              child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder:
                    (context, index) =>
                        ListTile(title: Text('hello'), leading: Text('wellcome')),
              ),
            ),
            ),
            
          ],
        ),
      ),
    );
  }
}
