import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/professional.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/screen_utils.dart';

class TherapistCard extends StatelessWidget {
  final Professional professionalTherapist;
  const TherapistCard({super.key, required this.professionalTherapist});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 0.5,
          color: AppColors.oliveGreen1,
          // color: Colors.green.shade100,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image.network(
                          professionalTherapist.photoUrl!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 100,
                        child: Text(
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          "${professionalTherapist.name}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person_outline_sharp,
                              color: AppColors.grey6,
                              size: 20,
                            ),
                            SizedBox(
                              width: ScreenUtils.getScreenWidth(context) / 5.5,
                              child: const Text(
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                " Full Name: ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                            ),
                            SizedBox(
                              width: ScreenUtils.getScreenWidth(context) / 3,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                "${professionalTherapist.name}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: AppColors.grey6,
                              size: 20,
                            ),
                            SizedBox(
                              width: ScreenUtils.getScreenWidth(context) / 2,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                " Job title: ${professionalTherapist.jobTitle}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_alarms_sharp,
                              color: AppColors.grey6,
                              size: 20,
                            ),
                            SizedBox(
                              width: ScreenUtils.getScreenWidth(context) / 2,
                              height: 20,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                " Rating: ${professionalTherapist.rating}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                            ),
                          ],
                        ),


                      ],
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
