import 'package:flutter/material.dart';

import '../widgets/lost_person_id.dart';
import '../widgets/search_bar.dart';

class FoundTab extends StatelessWidget {
  const FoundTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        CustomSearchBar(),
        SingleChildScrollView(
          child: Column(
            children: [
              LostPersonId(
                person: raslan,
              ),
              LostPersonId(
                person: raslan,
              ),
              LostPersonId(
                person: raslan,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
