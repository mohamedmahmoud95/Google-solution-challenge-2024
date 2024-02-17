import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/domain/entities/lost_or_found_person.dart';

import '../../../../core/utils/app_colors.dart';


class LostPersonIdExpandedView extends StatelessWidget {
  final LostOrFoundPerson person;
  const LostPersonIdExpandedView({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 0,
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
                          person.imageUrl!,
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
                          "${person.firstName}",
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
                                "${person.firstName} ${person.lastName}",
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
                                " Last Seen at: ${person.lastSeenLocation}",
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
                                " Age: ${person.age}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.insert_drive_file_outlined,
                              color: AppColors.grey6,
                              size: 20,
                            ),
                            SizedBox(
                              width: ScreenUtils.getScreenWidth(context) / 2,
                              //height: 40,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                " Id: ${person.nationalId}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.maps_home_work_outlined,
                              color: AppColors.grey6,
                              size: 20,
                            ),
                            SizedBox(
                              width: ScreenUtils.getScreenWidth(context) / 2,
                              height: 30,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                " Registered Address: ${person.address}",
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
