import 'package:flutter/material.dart';

class DonateCard extends StatelessWidget {
  final int number;

  const DonateCard({required this.number, super.key});

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              12,
            ),
          ),
        ),
      ),
      child: Center(
        child: Text(
          "\$$number",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
