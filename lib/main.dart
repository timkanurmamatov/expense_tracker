import 'package:expense_tracker/widgets/expenses_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: ExpensesScreen(),
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(255, 165, 200, 216),
        ),
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: Colors.blueAccent,
          foregroundColor: Colors.black,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            foregroundColor: Colors.black,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: Colors.black),
        ),
        cardTheme: CardTheme().copyWith(
          color: Color.fromARGB(255, 165, 200, 216),
          elevation: 8,
          shadowColor: Colors.amberAccent,
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blueGrey,
        cardTheme: CardTheme().copyWith(
          elevation: 15,
          shadowColor: Colors.amberAccent,
        ),
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: const Color.fromARGB(255, 30, 62, 117),
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData().copyWith(
          backgroundColor: const Color.fromARGB(255, 30, 62, 117),
        ),
      ),
    ),
  );
}
