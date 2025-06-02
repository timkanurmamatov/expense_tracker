import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double heightFactor;
  final IconData icon;

  const ChartBar({super.key, required this.heightFactor, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // bar - Шкала
        Expanded(
          child: SizedBox.expand(
            child: FractionallySizedBox(
              heightFactor: heightFactor,
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 12),
        // icon - иконка категории
        Icon(icon, color: Theme.of(context).primaryColor),
      ],
    );
  }
}