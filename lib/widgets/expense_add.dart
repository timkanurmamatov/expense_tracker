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
  Category? selectCat = Category.values.last;

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

  void _onSave() {
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
  }

  @override
  Widget build(BuildContext context) {
    final double keyboardSpace =
        MediaQuery.of(context)
            .viewInsets
            .bottom; //Получение высоты, которую занимает клавиатура, если она открыта.
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 0 + keyboardSpace),
        child: GestureDetector(
          behavior:
              HitTestBehavior
                  .opaque, //Cделай весь контейнер нажимаемым, даже если он прозрачный и внутри нет видимых элементов
          onTap: () {
            FocusScope.of(context).unfocus(); //Убирает фокус со всех виджетов.
          },
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > constraints.maxHeight) {
                return Column(
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
                          width: 150,
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
                      spacing: 10,
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
                          onPressed: _onSave,
                          child: Text('Сохранить'),
                        ),
                      ],
                    ),
                  ],
                );
              } else {
                return Column(
                  spacing: 20,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextField(
                            // buildCounter:
                            //     (
                            //       context, {
                            //       required currentLength,
                            //       required isFocused,
                            //       required maxLength,
                            //     }) => null,
                            controller: _controllerName,
                            decoration: InputDecoration(
                              labelText: 'Название',
                              counterText: '', //чтобы скрыть счетчик 0/20
                            ),
                            maxLength: 20,
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          flex: 1,
                          child: TextField(
                            controller: _controllerSumary,
                            decoration: InputDecoration(
                              labelText: 'Сумма',
                              prefixText: '\$',
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        Text(dateUser),
                        IconButton(
                          icon: Icon(Icons.calendar_month),
                          onPressed: () {
                            _dateTime();
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Отмена'),
                        ),
                        SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: _onSave,
                          child: Text('Сохранить'),
                        ),
                        Spacer(),
                      ],
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
