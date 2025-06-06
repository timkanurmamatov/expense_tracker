import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/widgets/chart.dart';
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
        title: "Expense 1",
        amount: 100,
        date: DateTime.now(),
        category: Category.food,
      ),
      ExpenseModel(
        title: "Expense 2",
        amount: 123,
        date: DateTime.now(),
        category: Category.leisure,
      ),
      ExpenseModel(
        title: "Expense 3",
        amount: 234,
        date: DateTime.now(),
        category: Category.travel,
      ),
      ExpenseModel(
        title: "Expense 4",
        amount: 345,
        date: DateTime.now(),
        category: Category.work,
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //final test = MediaQuery.of(context).size.width; // Напиример чтобы узнать размеры экрана
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.indigoAccent,
        // foregroundColor: Colors.white,
        title: Text("Трекер расходов"),
        centerTitle: true,
    
        actions: [
          IconButton(icon: Icon(Icons.add), onPressed: _buildModal),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final chart = Chart(expense: _expenses);
            final listExp =
                _expenses.isEmpty
                    ? Center(
                      child: Image.asset(
                        'assets/images/notepad.png',
                        height: 150,
                        width: 150,
                      ),
                    )
                    : ExpenseList(expenses: _expenses, onRemoveExp: _removeExp);
            if (constraints.maxWidth > constraints.maxHeight) {
              return Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: [Expanded(flex: 1, child: chart), Expanded(flex: 1, child: listExp)],
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [Expanded(flex: 1, child: chart), Expanded(flex: 2,child: listExp)],
                ),
              );
            }
          },
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
        isScrollControlled: true,
        useSafeArea: true,
        constraints: BoxConstraints.expand(),
        context: context,
        builder: (BuildContext context) {
          return ExpenseAdd(
            onSubmit: (ExpenseModel model) {
              setState(() {
                _expenses.add(model);
              });
            },
          );
        },
      );
    });
  }

  void _removeExp(ExpenseModel removeExp) {
    final int expIndex = _expenses.indexOf(removeExp);
    setState(() {
      _expenses.remove(removeExp);
    });
    ScaffoldMessenger.of(context).clearSnackBars(); //Для очистки предыдушего снекбара
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Отменить удаление?'),
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: 'Да',
          onPressed: () {
            setState(() {
              _expenses.insert(expIndex, removeExp);
            });
          },
        ),
      ),
    );
  }
}
