import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';
import 'package:google_solution_challenge_2024/core/utils/app_measures.dart';
import 'package:google_solution_challenge_2024/core/utils/image_utilities.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/domain/entities/online_session.dart';

import '../../../../core/utils/app_colors.dart';

class SessionCard extends StatefulWidget {
  final OnlineSession onlineSession;
  final int index;
  const SessionCard({super.key, required this.onlineSession, required this.index});

  @override
  State<SessionCard> createState() => _SessionCardState();
}

class _SessionCardState extends State<SessionCard> {
 bool saved = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        // Navigator.pushNamed(context, Routes.articlesDetails);
      },
      child: Card(
        elevation: 0,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.transparent)),
        child: Container(
          width: ScreenUtils.getScreenWidth(context) - 10,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: AppColors.oliveGreen2.withOpacity(0.4),//Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(AppMeasures.defaultCircularRadius),
                child: Image(image: ImageUtils.getImage(widget.onlineSession.imageUrl)!,
                   height: ScreenUtils.getScreenHeight(context)/4.2,
                   fit: BoxFit.fitWidth,
                 ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.onlineSession.title}",
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                       SizedBox(
                         height: 20,
                        width: ScreenUtils.getScreenWidth(context) - 110,
                        child: Text(
                        "${widget.onlineSession.subTitle}",
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis,
                        ),
                        ),
                      ),
                    ],
                  ),

                  IconButton(onPressed: (){
                    setState(() {
                      saved = !saved;
                    });
                  }, icon: Icon(Icons.bookmark, color: saved?AppColors.oliveGreen2 : AppColors.grey3, size: 30,)),
                  // SizedBox(
                  //   height: 50,
                  //   width: 80,
                  //   child: ElevatedButton(
                  //       style: ElevatedButton.styleFrom(
                  //         elevation: 3,
                  //         backgroundColor: AppColors.oliveGreen1,//Colors.green.shade200,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(
                  //               10.0), // Adjust the radius as needed
                  //         ),
                  //       ),
                  //       onPressed: () {},
                  //       child: const Icon(
                  //         Icons.arrow_forward,
                  //         color: Colors.black,
                  //       )),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
