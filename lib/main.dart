import 'package:expense_tracker/widgets/expenses_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: ExpensesScreen(),
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 165, 200, 216)),
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: Color.fromARGB(255, 43, 169, 227),
          foregroundColor: Colors.black,
        ),
        cardTheme: CardTheme().copyWith(
          color: Color.fromARGB(255, 165, 200, 216),
          elevation: 8,
          shadowColor: Colors.pink
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 43, 169, 227),
            foregroundColor: Colors.black,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        cardTheme: CardTheme().copyWith(
          elevation: 8,
          shadowColor: Colors.pink
        ),
      ),
    ),
  );
}
