import 'package:expense_tracker/models/expense_model.dart';
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
  String testDown = 'food';
  List<String> testDrop = ['food', 'travel', 'leisure', 'work'];
  // List<ExpenseModel> expenseAdd = [];

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

  // @override
  // void initState() {
  //   String test = _controllerSumary.text;
  //   double testParse = double.parse(test);
  //   expenseAdd = [
  //     ExpenseModel(
  //       title: _controllerName.text,
  //       amount: testParse,
  //       category: _testCategory()!,
  //       date: date!,
  //     ),
  //   ];
  //   super.initState();
  // }

  // Category? _testCategory() {
  //   switch (testDown) {
  //     case 'food':
  //       return Category.food;
  //     case 'travel':
  //       return Category.travel;
  //     case 'leisure':
  //       return Category.leisure;
  //     case 'work':
  //       return Category.work;
  //   }
  // }

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
              //////////////////////////
              // DropdownButton(
              //   value: testIcon,
              //   icon: Icon(Icons.arrow_drop_down),
              //   items:
              //       testIcon.map((list) {
              //         return DropdownMenuItem(value: list, child: Icon(list));
              //       }).toList(),
              //   onChanged: (listCategory) {
              //     setState(() {
              //       testIcon = listCategory!;
              //     });
              //   },
              // ),
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
