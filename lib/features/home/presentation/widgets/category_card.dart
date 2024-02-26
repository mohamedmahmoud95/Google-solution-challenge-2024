import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/image_utilities.dart';

import '../manager/cubit.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String text;
  final Function()? onTap;

  const CategoryCard(
      {required this.text, required this.image, super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
       // color: AppColors.oliveGreen2.withOpacity(0.0),//Theme.of(context).cardColor,
        child: Container(
          width: HomeCubit.get(context).screenWidth(context) * .4,
          height: HomeCubit.get(context).screenHeight(context) * .16,
          padding: EdgeInsets.symmetric(
              horizontal: HomeCubit.get(context).screenWidth(context) * .01,
              vertical: HomeCubit.get(context).screenHeight(context) * .009),
          decoration:  BoxDecoration(
              color: AppColors.oliveGreen0,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: ImageUtils.getImage(image),fit: BoxFit.contain,
                width: HomeCubit.get(context).screenWidth(context) * 0.3,
                height: HomeCubit.get(context).screenHeight(context) * 0.11,
              ),
              SizedBox(
                // width: HomeCubit.get(context).screenWidth(context) * .2,
                child: Text(
                  text,
                  style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }
}
