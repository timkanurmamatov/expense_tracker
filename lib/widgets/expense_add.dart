import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseAdd extends StatefulWidget {
  const ExpenseAdd({super.key});

  @override
  State<ExpenseAdd> createState() => _ExpenseAddState();
}

class _ExpenseAddState extends State<ExpenseAdd> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSumary = TextEditingController();
  DateTime? date;
  String dateUser = 'Дата не выбрана';
  bool test = true;
  String testDown = 'test 1';
  List<String> testDrop = ['test 1', 'test 2', 'test 3'];

  Future<void> _dateTime() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2026),
    );
    setState(() {
      date = picked;
      if (date != null) {
        dateUser = DateFormat.yMd().format(date!);
      } else {
        dateUser = 'Дата не выбрана';
      }
    });
  }

  // void _saveExpense() {
  //   if (test == true) {
  //     //save data
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      width: double.infinity,
      child: Column(
        spacing: 20,
        children: [
          // Name Expense
          TextField(
            controller: _controllerName,
            decoration: InputDecoration(labelText: 'Название'),
          ),
          //Expense sumary and date
          Row(
            children: [
              SizedBox(
                width: 100,
                child: TextField(
                  controller: _controllerSumary,
                  decoration: InputDecoration(labelText: 'Сумма'),
                ),
              ),
              Spacer(),
              Text(dateUser),
              IconButton(
                icon: Icon(Icons.calendar_month),
                onPressed: () {
                  _dateTime();
                },
              ),
            ],
          ),
          //Category and Save
          Row(
            spacing: 20,
            children: [
              DropdownButton(
                value: testDown,
                icon: Icon(Icons.arrow_drop_down),
                items:
                    testDrop.map((list) {
                      return DropdownMenuItem(value: list, child: Text(list));
                    }).toList(),
                onChanged: (listCategory) {
                  setState(() {
                    testDown = listCategory!;
                  });
                },
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
