import 'package:flutter/material.dart';

class ShowModalBottomSheet extends StatelessWidget {
  const ShowModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(25.0),
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.bookmark_outline),
              SizedBox(width: 10),
              Text("Saved Items"),
            ],
          )
        ],
      ),
    );
  }
}
