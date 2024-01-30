import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';

import '../../../../core/utils/app_colors.dart';
import 'lost_person_id_expanded_view.dart';


class LostPersonIdCompactView extends StatelessWidget {
  final LostPerson person;
  const LostPersonIdCompactView({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 0.5,
          color: Colors.green.shade100,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child:
                  Column(
                    children: [

                      Container(
                        height: ScreenUtils.getScreenHeight(context)/6,
                        width: ScreenUtils.getScreenWidth(context)/2.65,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(("${person.imageUrl}")),
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      SizedBox(
                        height: 30,
                      child: Text(
                        "${person.firstName} ${person.lastName}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 15),
                        maxLines: 2,
                      ),
                      ),
                    ],
                  ),




            ),
          ),
        ),
      ),
    );
  }
}
