import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/presentation/widgets/subscreens_navigation_bar.dart';

import '../widgets/subscreen_card.dart';

class LostAndFoundScreen extends StatelessWidget {
  LostAndFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text("Get back together"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SubScreensNavigationBar(listOfCards: navigationCards),
          ],
        ),
      ),

    );
  }

  List <subScreenCard> navigationCards = [
    subScreenCard(title: "Lost", onPressed: () {}),
    subScreenCard(title: "Found", onPressed: () {}),
  ];

 
}

