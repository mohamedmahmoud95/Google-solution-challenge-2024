import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';

import '../manager/cubit.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String text;
  final Function()? onTap;

  const CategoryCard(
      {required this.text, required this.image, super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: 4,
        child: Container(
          width: HomeCubit.get(context).screenWidth(context) * .4,
          height: HomeCubit.get(context).screenHeight(context) * .18,
          padding: EdgeInsets.symmetric(
              horizontal: HomeCubit.get(context).screenWidth(context) * .01,
              vertical: HomeCubit.get(context).screenHeight(context) * .009),
          decoration: const BoxDecoration(
              color: AppColors.oliveGreen1,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage(image),
                width: HomeCubit.get(context).screenWidth(context) * 0.3,
                height: HomeCubit.get(context).screenHeight(context) * 0.1,
              ),
              SizedBox(
                width: HomeCubit.get(context).screenWidth(context) * .25,
                child: Text(
                  text,
                  style: const TextStyle(fontWeight: FontWeight.w900),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
