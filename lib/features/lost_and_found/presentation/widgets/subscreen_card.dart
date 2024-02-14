
import 'package:flutter/material.dart';

class subScreenCard extends StatelessWidget {
  final String title;
  final Function onPressed;
  const subScreenCard({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: (){
          onPressed();
        },
        child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              child: Text(title),
            )
        ) );

  }
}

