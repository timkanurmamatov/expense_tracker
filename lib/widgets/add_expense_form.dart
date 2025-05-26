import 'package:flutter/material.dart';

class AddExpenseForm extends StatefulWidget {
  const AddExpenseForm({super.key});

  @override
  State<AddExpenseForm> createState() => _AddExpenseFormState();
}

class _AddExpenseFormState extends State<AddExpenseForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          // Поле ввода названия
          TextField(),
      
          // Row -> Сумма, дата
          Row(
            children: [
              Expanded(child: TextField()),
              SizedBox(width: 20),
              // кнопка для выбора даты
      
            ],
          ),
      
          // Row -> Категория, отменить, Сохранить расходы
          Row(
            children: [
              // Category
      
              TextButton(
                onPressed: (){}, 
                child: Text("Отменить"),
              ),
              ElevatedButton(
                onPressed: (){}, 
                child: Text("Сохранить расходы"),
              )
            ],
          ),
        ],
      ),
    );
  }
}