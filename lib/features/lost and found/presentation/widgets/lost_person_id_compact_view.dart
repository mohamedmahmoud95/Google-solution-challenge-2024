import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/domain/entities/lost_or_found_person.dart';

import '../../../../core/utils/app_colors.dart';

class LostPersonIdCompactView extends StatelessWidget {
  final LostOrFoundPerson person;
  const LostPersonIdCompactView({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 0.5,
          color: AppColors.oliveGreen2,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child:
                  Column(
                    children: [

                      Container(
                        height:  ScreenUtils.getScreenWidth(context)/2.65,
                        width: ScreenUtils.getScreenWidth(context)/2.65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.network(
                          person.imageUrl!,
                          fit: BoxFit.cover,
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
