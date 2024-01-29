import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/presentation/pages/found_tab.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/presentation/pages/lost_tab.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/presentation/widgets/subscreens_navigation_bar.dart';

import '../widgets/subscreen_card.dart';

class LostAndFoundScreen extends StatelessWidget {
  LostAndFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return

      DefaultTabController(
        length: 2,
    child:
    Scaffold(
      backgroundColor: Colors.green.shade50,
      appBar: AppBar(
        leading: const BackButton(color: AppColors.white,),
        backgroundColor: AppColors.green,
        automaticallyImplyLeading: true,
        title: const Text("Get back together", style: TextStyle(fontSize: 25, color: AppColors.white, fontWeight: FontWeight.w600),),
        bottom: const TabBar(
          indicatorColor: AppColors.white,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: [
            Text("Lost", style: TextStyle(fontSize: 20, color: AppColors.white),),
            Text("Found", style: TextStyle(fontSize: 20, color: AppColors.white),),
        ],

        ),
      ),
      body: const TabBarView(
        children: [
          LostTab(),
          FoundTab(),
        ],

      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.green,
        onPressed: (){},
        child: const Icon(Icons.add, color: AppColors.white,),
      ),
    ),
    );
  }

  List <subScreenCard> navigationCards = [
    subScreenCard(title: "Lost", onPressed: () {}),
    subScreenCard(title: "Found", onPressed: () {}),
  ];

 
}

