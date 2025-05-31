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
    ];
    super.initState();
  }

  void _addExpense(ExpenseModel expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  void _removeExpense(ExpenseModel expense) {
    // Записывает индекс с которого удалим расход, чтобы если что отменить это действие
    final int expenseIndex = _expenses.indexOf(expense);

    // Удаляем расход
    setState(() {
      _expenses.remove(expense);
    });

    // ScaffoldMessenger.of(context).clearSnackBars(); // если нужно очистить предыдущие снек бары
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Расходы удалены."),
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: "Отменить", 
          onPressed: (){
            setState(() {
              // При нажатии на 'Отменить', возвращаем удаленный расход в ту же позицию (ранее записанную)
              _expenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
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
                  return AddExpenseForm(
                    onSubmit: _addExpense,
                  );
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
                style: TextStyle(fontSize: 35),
              ),
            ),
            Expanded(
              child: _expenses.isEmpty 
                ? Center(child: Text("Расходы не найдены. Начните добавлять")) 
                : ExpenseList(
                  expenses: _expenses,
                  onRemoveExpense: _removeExpense,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
