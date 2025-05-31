import 'package:expense_tracker/models/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpenseForm extends StatefulWidget {
  final void Function(ExpenseModel model) onSubmit;

  const AddExpenseForm({super.key, required this.onSubmit});

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
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).unfocus(); // Убираем фокус с полей ввода
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
                      Navigator.of(context).pop(); // Закрыть bottom sheet
                    },
                    child: Text("Отменить"),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      bool isDataIncorrect = titleController.text.isEmpty ||
                          amountController.text.isEmpty ||
                          selectedDate == null ||
                          selectedCategory == null;
                      if (isDataIncorrect) {
                        showDialog(
                          context: context, 
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Неверный ввод"),
                              content: Text("Пожалуйста, убедитесь, что введены корректные название, сумма, дата и категория."),
                              actions: [
                                TextButton(
                                  onPressed: (){
                                    Navigator.of(context).pop(); // закрыть диалоговое окошко
                                  }, 
                                  child: Text("Хорошо"),
                                )
                              ],
                            );
                          },
                        );
                        return;
                      }

                      widget.onSubmit(
                        ExpenseModel(
                          title: titleController.text,
                          amount: double.parse(amountController.text),
                          date: selectedDate!,
                          category: selectedCategory!,
                        ),
                      );
                      Navigator.of(context).pop(); // Закрыть bottom sheet
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
