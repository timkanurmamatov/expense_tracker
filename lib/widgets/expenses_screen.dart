import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/expense_add.dart';
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
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
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
              width: double.infinity,
              color: Colors.amber,
              child: Text("Инфографика", style: TextStyle(fontSize: 35)),
            ),
            ExpenseList(expenses: _expenses),
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
        context: context,
        builder: (BuildContext context) {
          return ExpenseAdd();
        },
      );
    });
  }
}