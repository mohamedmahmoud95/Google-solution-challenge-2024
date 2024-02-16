import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'found_tab.dart';
import 'lost_tab.dart';

class LostAndFoundScreen extends StatefulWidget {
  const LostAndFoundScreen({super.key});

  @override
  State<LostAndFoundScreen> createState() => _LostAndFoundScreenState();
}

class _LostAndFoundScreenState extends State<LostAndFoundScreen> {
  bool compactMode = false;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          leading: const BackButton(
            color: AppColors.darkGreen2,
          ),
          backgroundColor:
          AppColors.white, //Theme.of(context).primaryColorLight,
          automaticallyImplyLeading: true,
          title: const Text(
            "Get back together",
            style: TextStyle(
                fontSize: 25,
                color: AppColors.darkGreen2,
                fontWeight: FontWeight.w600),
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  compactMode = !compactMode;
                });
              },
              icon: Icon(
                compactMode ? Icons.list_outlined : Icons.grid_view_outlined,
                color: AppColors.darkGreen2,
              ),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: AppColors.darkGreen2,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: [
              Text(
                "Lost",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.darkGreen2,
                ),
              ),
              Text(
                "Found",
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.darkGreen2,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            LostTab(
              compactMode: compactMode,
            ),
            FoundTab(
              compactMode: compactMode,
            ),
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: AppColors.green,
        //   onPressed: () {},
        //   child: const Icon(
        //     Icons.add,
        //     color: AppColors.white,
        //   ),
        // ),
      ),
    );
  }

}
