import 'package:flutter/material.dart';

class LostPersonId extends StatelessWidget {
  const LostPersonId({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Row(
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 100,
                  foregroundImage: AssetImage("assets/images/Mohamed Raslan.jpeg"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
