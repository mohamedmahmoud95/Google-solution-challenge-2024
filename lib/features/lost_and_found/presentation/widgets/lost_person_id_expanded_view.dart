import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';

import '../../../../core/utils/app_colors.dart';

class LostPerson {
  String? firstName;
  String? lastName;

  String? age;
  String? imageUrl;
  String? nationalId;
  String? address; //registered address on the found national id card (if found)
  String? lastSeenLocation;
  String? careGiverPhoneNumber;

  LostPerson({
    this.firstName,
    this.lastName,
    this.age,
    this.imageUrl,
    this.nationalId,
    this.address,
    this.lastSeenLocation,
    this.careGiverPhoneNumber,
  });
}

//sample data:
LostPerson raslan = LostPerson(
  firstName: "Mohamed",
  lastName: "Raslan",
  age: "28",
  imageUrl: "assets/images/Mohamed Raslan.png",
  nationalId: "2950309999999999",
  address: "5 Sarayat st.",
  lastSeenLocation: "Eng ASU",
);

List<LostPerson> lostPeople = [raslan,raslan,raslan,raslan,raslan,raslan,raslan];

class LostPersonIdExpandedView extends StatelessWidget {
  final LostPerson person;
  const LostPersonIdExpandedView({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 0.5,
          color:  AppColors.oliveGreen2,
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
                        width: 100,
                      child:

                      Text(
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
                      width: ScreenUtils.getScreenWidth(context)/5.5,
                      child:

                      Text(
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                              " Full Name: ",
                              style: TextStyle(fontWeight: FontWeight.w500,
                                   fontSize: 12),
                            ),),

                    SizedBox(
                      width: ScreenUtils.getScreenWidth(context)/3,
                      child:

                      Text(
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.start,
                        maxLines: 2,
                              "${person.firstName} ${person.lastName}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12),
                            ),),
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
                              width: ScreenUtils.getScreenWidth(context)/2,
                              child:

                              Text(
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
                              width: ScreenUtils.getScreenWidth(context)/2,
                              height: 20,
                              child:

                              Text(
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                maxLines: 2,
                              " Age: ${person.age}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 12),
                            ),),
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
                              width: ScreenUtils.getScreenWidth(context)/2,
                              //height: 40,
                              child:

                              Text(
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
                              width: ScreenUtils.getScreenWidth(context)/2,
                              height: 30,

                              child:

                              Text(
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