import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_measures.dart';
import 'package:google_solution_challenge_2024/core/utils/image_utilities.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/professional.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/screen_utils.dart';

class TherapistCard extends StatelessWidget {
  final Professional professionalTherapist;
  const TherapistCard({super.key, required this.professionalTherapist});

  @override
  Widget build(BuildContext context) {
   
    return GestureDetector(
      onTap: (){
        Navigator.of(context).pushNamed('bookOneToOneSessionScreen', arguments: professionalTherapist);
        
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Card(
          elevation: 0,
          color: Colors.grey.shade200,
          // color: Colors.green.shade100,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Row(
                children: [

                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Image( image: ImageUtils.getImage(professionalTherapist.photoUrl)!, fit: BoxFit.cover,),
                      ),

                  const SizedBox(
                    width: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(
                          width: 200,
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            maxLines: 2,
                            professionalTherapist.name,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        Row(
                          children: [
                            Icon(
                              Icons.cases_outlined,
                              color: AppColors.grey6,
                              size: 20,
                            ),


                            SizedBox(
                              width: ScreenUtils.getScreenWidth(context) / 2,
                              child: Text(
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.start,
                                maxLines: 2,
                                " ${professionalTherapist.jobTitle}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 12),
                              ),
                            ),
                          ],
                        ),

                        // Row(
                        //   children: [
                        //     Icon(
                        //       Icons.star,
                        //       color: AppColors.grey6,
                        //       size: 20,
                        //     ),
                        //     SizedBox(
                        //       width: ScreenUtils.getScreenWidth(context) / 2,
                        //       height: 20,
                        //       child:
                        //       Text(
                        //         overflow: TextOverflow.ellipsis,
                        //         textAlign: TextAlign.start,
                        //         maxLines: 2,
                        //         " Rating: ${professionalTherapist.rating}",
                        //         style: const TextStyle(
                        //             fontWeight: FontWeight.w500, fontSize: 12),
                        //       ),
                        //     ),
                        //   ],
                        // ),

                        const SizedBox(
                          height: 10,
                        ),

                        ratingIndicator(),
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

  Widget ratingIndicator(){
    return Container(
      width: 75,
      height: 32.5,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.oliveGreen1.withOpacity(0.3),
        border: Border.all(width: 0.5, color: AppColors.oliveGreen1),
        borderRadius:
        const BorderRadius.all(Radius.circular(AppMeasures.defaultCircularRadius)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.star,
            color: AppColors.black0000,
            size: 17,
          ),
          const SizedBox(width: 5,),
          Text(
            "${professionalTherapist.rating}",
            style: const TextStyle(
              fontSize: 17,
              color: AppColors.black0000,
            ),
          ),
        ],
      ),
    );


  }
}
