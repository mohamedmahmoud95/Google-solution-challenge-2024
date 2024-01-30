import 'package:flutter/cupertino.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/presentation/widgets/subscreen_card.dart';

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
