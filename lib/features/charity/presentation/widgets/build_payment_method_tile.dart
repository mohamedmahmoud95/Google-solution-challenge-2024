import 'package:flutter/material.dart';

class BuildPaymentMethodTile extends StatelessWidget {
  final String title;
  final String value;

  final String groupValue;

  final void Function(String?) onChanged;
  final String image;

  const BuildPaymentMethodTile(
      {super.key,
      required this.title,
      required this.value,
      required this.groupValue,
      required this.onChanged,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: RadioListTile<String>(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            overflow: TextOverflow.ellipsis,
            color: Colors.black,
          ),
        ),
        value: value,
        activeColor: Colors.green,
        groupValue: groupValue,
        onChanged: onChanged,
        secondary: SizedBox(
          height: 50,
          width: 50,
          child: Image.asset(image),
        ),
      ),
    );
  }
}
