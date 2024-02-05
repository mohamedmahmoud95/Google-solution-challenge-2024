import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../widgets/lost_person_id_compact_view.dart';
import '../widgets/lost_person_id_expanded_view.dart';
import '../widgets/search_bar.dart';

class LostTab extends StatelessWidget {
  bool compactMode;
  LostTab({super.key, required this.compactMode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.center,
          spacing: 10,
          runSpacing: 10,
          children: [
            const CustomSearchBar(),
            ...lostPeople
                .map(
                  (person) => compactMode
                      ? LostPersonIdCompactView(
                          person: person,
                        )
                      : LostPersonIdExpandedView(
                          person: person,
                        ),
                )
                .toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColorDark,
      onPressed: () {},
        child: const Icon(
          Icons.add,
          color: AppColors.white,
        ),
      ),
    );
  }
}
