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
      // ExpenseModel(
      //   title: "Курсы Flutter",
      //   amount: 50,
      //   date: DateTime.now(),
      //   category: Category.work,
      // ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.indigoAccent,
        // foregroundColor: Colors.white,
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
            Expanded( flex: 1, child: Chart(expense: _expenses,),),
            Expanded(
              flex: 3,
              child:
                  _expenses.isEmpty
                      ? Center(
                        child: Image.asset(
                          'assets/images/notepad.png',
                          height: 150,
                          width: 150,
                        ),
                      )
                      : ExpenseList(
                        expenses: _expenses,
                        onRemoveExp: _removeExp,
                      ),
            ),
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
    //ScaffoldMessenger.of(context).clearSnackBars(); //Для очистки предыдушего снекбара
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
