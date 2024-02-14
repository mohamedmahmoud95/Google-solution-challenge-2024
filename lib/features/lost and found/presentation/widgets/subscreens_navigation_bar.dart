import 'package:flutter/cupertino.dart';

import 'subscreen_card.dart';

class SubScreensNavigationBar extends StatelessWidget {
   final List<subScreenCard> listOfCards;
   const SubScreensNavigationBar({super.key, required this.listOfCards});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ...listOfCards.toList(),
      ],
    );
  }
}
