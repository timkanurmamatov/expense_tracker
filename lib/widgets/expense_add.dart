import 'package:flutter/material.dart';

class ExpenseAdd extends StatefulWidget {
  const ExpenseAdd({super.key});

  @override
  State<ExpenseAdd> createState() => _ExpenseAddState();
}

class _ExpenseAddState extends State<ExpenseAdd> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerSumary = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
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
                width: 150,
                child: TextField(
                  controller: _controllerSumary,
                  decoration: InputDecoration(labelText: 'Сумма'),
                ),
              ),
              Spacer(),
              Text('Дата не выбрана'),
              IconButton(icon: Icon(Icons.calendar_today), onPressed: () {}),
            ],
          ),
          //Category and Save
          Row(
            spacing: 20,
            children: [
              DropdownButton(items: null, onChanged: null),
              Spacer(),
              ElevatedButton(onPressed: () {}, child: Text('Save')),
              ElevatedButton(onPressed: () {}, child: Text('Save')),
            ],
          ),
        ],
      ),
    );
  }
}
