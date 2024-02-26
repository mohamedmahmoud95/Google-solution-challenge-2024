import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';
import 'package:google_solution_challenge_2024/core/utils/app_measures.dart';
import 'package:google_solution_challenge_2024/core/utils/image_utilities.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';
import 'package:hive/hive.dart';

class FeatureCard extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final double? height;
  final double? width;
  final double? imageHeight;
  final double? imageWidth;
  final Function? onClicked;

  const FeatureCard({super.key, required this.title, this.imageUrl, this.height, this.width, this.imageHeight, this.imageWidth, this.onClicked});

  @override
  Widget build(BuildContext context) {
    return
      GestureDetector(
        onTap: (){
          if(onClicked != null) {
            onClicked!();
          }
        },
        child: Padding(padding: const EdgeInsets.all(3),
          child:SizedBox(
      height: height ?? ScreenUtils.getScreenHeight(context)/4.7,
      width :  width ?? ScreenUtils.getScreenWidth(context)/2 -20,
      child : Card(
        elevation: 0,
        color: AppColors.oliveGreen0,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: imageHeight ?? ScreenUtils.getScreenHeight(context)/5.5 - 50,
                width:  imageWidth  ?? ScreenUtils.getScreenWidth(context)/2  - 20,
                decoration: BoxDecoration(
                  image: DecorationImage(image: ImageUtils.getImage("$imageUrl")!, fit: BoxFit.cover, ),
                  borderRadius: BorderRadius.circular(AppMeasures.defaultCircularRadius)

                ),
        ),

              const SizedBox(
                height: 5,
              ),

               Center(
                 child: SizedBox(
                height:ScreenUtils.getScreenHeight(context)/20,
                width: ScreenUtils.getScreenWidth(context)/2,
             child:
              Text (title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis, maxLines: 2,
              textAlign: TextAlign.center,),
              ),),

            ],
          ),
        ),
      ),
    ),),
    );
  }
}
