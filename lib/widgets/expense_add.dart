//import 'package:expense_tracker/models/expense_model.dart';
import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseAdd extends StatefulWidget {
  final void Function(ExpenseModel model) onSubmit;
  const ExpenseAdd({super.key, required this.onSubmit});

  @override
  State<ExpenseAdd> createState() => _ExpenseAddState();
}

class _ExpenseAddState extends State<ExpenseAdd> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSumary = TextEditingController();
  DateTime? date;
  String dateUser = 'Дата не выбрана';
  Category? selectCat = Category.values.first;

  Future<void> _dateTime() async {
    final DateTime now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date ?? now,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: now,
    );
    setState(() {
      date = picked ?? date;
      if (date != null) {
        dateUser = DateFormat.yMd().format(date!);
      } else {
        dateUser = 'Дата не выбрана';
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      width: double.infinity,
      child: Column(
        spacing: 20,
        children: [
          // Name Expense
          TextField(
            controller: _controllerName,
            decoration: InputDecoration(labelText: 'Название'),
            maxLength: 40,
          ),
          //Expense sumary and date
          Row(
            children: [
              SizedBox(
                width: 100,
                child: TextField(
                  controller: _controllerSumary,
                  decoration: InputDecoration(
                    labelText: 'Сумма',
                    prefixText: '\$',
                  ),
                ),
              ),
              Spacer(),
              Text(dateUser),
              IconButton(
                icon: Icon(Icons.calendar_month),
                onPressed: () {
                  _dateTime();
                  //print(expenseAdd);
                },
              ),
            ],
          ),
          //Category and Save
          Row(
            spacing: 20,
            children: [
              DropdownButton(
                value: selectCat,
                elevation: 15,
                onChanged: (listCategory) {
                  setState(() {
                    selectCat = listCategory;
                  });
                },
                items:
                    Category.values.map((list) {
                      return DropdownMenuItem(
                        value: list,
                        child: Text(list.title),
                      );
                    }).toList(),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Отмена'),
              ),
              ElevatedButton(
                onPressed: () {
                  bool isCorrect =
                      _controllerName.text.isEmpty ||
                      _controllerSumary.text.isEmpty ||
                      date == null ||
                      selectCat == null;
                  if (isCorrect) {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Неверный ввод'),
                          content: Text(
                            "Пожалуйста, убедитесь, что введены корректные название, сумма, дата и категория.",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Хорошо'),
                            ),
                          ],
                        );
                      },
                    );
                    return;
                  }
                  widget.onSubmit(
                    ExpenseModel(
                      title: _controllerName.text,
                      amount: double.parse(_controllerSumary.text),
                      date: date!,
                      category: selectCat!,
                    ),
                  );
                  Navigator.pop(context);
                },
                child: Text('Сохранить'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
