import 'package:flutter/material.dart';

class CharBar extends StatelessWidget {
  final double heightFactor;
  final IconData icon;
  const CharBar({super.key, required this.heightFactor, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FractionallySizedBox(
            heightFactor: heightFactor,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent,
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Icon(icon, color: Theme.of(context).cardColor),
      ],
    );
  }
}
