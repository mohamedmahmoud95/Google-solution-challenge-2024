import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/lost_person_id_compact_view.dart';
import '../widgets/lost_person_id_expanded_view.dart';
import '../widgets/search_bar.dart';

class FoundTab extends StatefulWidget {
  bool compactMode;
   FoundTab({super.key, required this.compactMode});

  @override
  State<FoundTab> createState() => _FoundTabState();
}

class _FoundTabState extends State<FoundTab> {

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body:
         SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child:
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            spacing: 10,
            runSpacing: 10,

            children: [

              const CustomSearchBar(),

              ...lostPeople.map((person) => widget.compactMode?
              LostPersonIdCompactView(
                person: person,
              ):

              LostPersonIdExpandedView(
                person: person,
              ),
              ).toList(),
            ],
          ),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
        onPressed: () {

        },
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
        );

  }
}
