import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ExpenseModel {
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  final String id;

  ExpenseModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}

enum Category { food, travel, leisure, work }

extension CategoryExtension on Category {
  IconData get icon {
    switch (this) {
      case Category.food:
        return Icons.restaurant;
      case Category.travel:
        return Icons.airplanemode_active;
      case Category.leisure:
        return Icons.movie;
      case Category.work:
        return Icons.work;
    }
  }
  String get title {
    switch (this) {
      case Category.food:
        return 'Food';
      case Category.travel:
        return 'Travel';
      case Category.leisure:
        return 'Leisure';
      case Category.work:
        return 'Work';
    }
  }
}
