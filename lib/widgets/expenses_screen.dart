import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expense_add.dart';
import 'package:expense_tracker/widgets/expense_list.dart';
//import 'package:expense_tracker/widgets/expenses_list.dart';
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
        title: "Курсы Flutter",
        amount: 50,
        date: DateTime.now(),
        category: Category.travel,
      ),
      ExpenseModel(
        title: "Кинотеатр",
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
        backgroundColor: Colors.indigoAccent,
        foregroundColor: Colors.white,
        title: Text("Трекер расходов"),
        centerTitle: true,

        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _buildModal,
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(Colors.white),
            ),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30),
              ),
              alignment: Alignment.center,
              child: Text("Инфографика", style: TextStyle(fontSize: 35)),
            ),
            Expanded(child: ExpenseList(expenses: _expenses)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _buildModal,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _buildModal() {
    setState(() {
      showModalBottomSheet(
        //isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return ExpenseAdd();
        },
      );
    });
  }
}
