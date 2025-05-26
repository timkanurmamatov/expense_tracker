import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/add_expense_form.dart';
import 'package:expense_tracker/widgets/expense_list.dart';
import 'package:flutter/material.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({super.key});

  @override
  State<ExpensesScreen> createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  late List<ExpenseModel> _expenses;

  @override
  void initState() {
    _expenses = [
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
      ExpenseModel(
        title: "Turkey",
        amount: 15.55,
        date: DateTime.now(),
        category: Category.travel,
      ),
      ExpenseModel(
        title: "Burger",
        amount: 15.55,
        date: DateTime.now(),
        category: Category.food,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Трекер расходов"),
        actions: [
          IconButton(
            icon: Icon(Icons.add), 
            onPressed: (){
              showModalBottomSheet(
                isScrollControlled: true,
                context: context, 
                builder: (context) {
                  return AddExpenseForm();
                },
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              color: Colors.amber,
              child: Text(
                "Инфографика", 
                style: TextStyle(fontSize: 35,),
              ),
            ),
            Expanded(child: ExpenseList(expenses: _expenses)),
          ],
        ),
      ),
    );
  }
}
