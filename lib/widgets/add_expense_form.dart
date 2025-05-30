import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpenseForm extends StatefulWidget {
  // callback функцию onSubmit(ExpenseModel model);

  const AddExpenseForm({super.key});

  @override
  State<AddExpenseForm> createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  late TextEditingController titleController;
  late TextEditingController amountController;
  DateTime? selectedDate;
  Category? selectedCategory;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    amountController = TextEditingController();
  }

  Future<void> _selectDate() async {
    final DateTime now = DateTime.now();

    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(now.year - 1, now.month, now.day),
      lastDate: now,
    );

    setState(() {
      selectedDate = pickedDate ?? selectedDate;
    });
  }

  String getFormattedDate(DateTime date) {
    var format = DateFormat('dd.MM.yyyy');
    return format.format(date);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Поле ввода названия
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "Название"),
              maxLength: 50,
            ),

            // Row -> Сумма, дата
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: amountController,
                    decoration: InputDecoration(
                      labelText: "Сумма",
                      prefixText: "\$",
                    ),
                    keyboardType: TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                // кнопка для выбора даты
                Text(
                  selectedDate == null
                      ? "Дата не выбрана"
                      : getFormattedDate(selectedDate!),
                ),
                IconButton(
                  onPressed: _selectDate,
                  icon: Icon(Icons.calendar_month),
                ),
              ],
            ),

            SizedBox(height: 12),

            // Row -> Категория, отменить, Сохранить расходы
            DropdownButton<Category>(
              value: selectedCategory,
              onChanged: (Category? value) {
                setState(() {
                  selectedCategory = value!;
                });
              },
              items:
                  Category.values.map<DropdownMenuItem<Category>>((
                    Category value,
                  ) {
                    return DropdownMenuItem<Category>(
                      value: value,
                      child: Text(value.title),
                    );
                  }).toList(),
            ),

            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    }, 
                    child: Text("Отменить")
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      // widget.onSubmit(
                      //  ExpenseModel(
                      //     title: "Курсы Flutter",
                      //     amount: 50,
                      //     date: DateTime.now(),
                      //     category: Category.work,
                      //  ),
                      // );
                      Navigator.of(context).pop();
                    },
                    child: Text("Сохранить расходы"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
