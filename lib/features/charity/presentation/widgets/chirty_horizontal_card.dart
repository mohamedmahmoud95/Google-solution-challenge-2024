import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../home/presentation/manager/cubit.dart';

class CharityHorizontalCard extends StatelessWidget {
  final String? title;
  final String? any;

  const CharityHorizontalCard({this.title, this.any, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const Image(
                image: AssetImage(AppImages.education),
                width: 140,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  width: 200,
                  child: Text(
                    "Helping Earthquake Victims Earthquake victims ",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      color: Color(0xf51c1c1c),
                    ),
                    maxLines: 2,
                  ),
                ),
                SizedBox(
                  height: HomeCubit.get(context).screenHeight(context) * .005,
                ),
                const Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          "4",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.green,
                          ),
                        ),
                        Text(
                          " Days Left | ",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black45,
                          ),
                          maxLines: 1,
                        ),
                      ],
                    ),
                    Text(
                      "800 ",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      "Good People",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black45,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
                SizedBox(
                  height: HomeCubit.get(context).screenHeight(context) * .01,
                ),
                const Row(
                  children: [
                    SizedBox(
                      width: 160,
                      height: 10,
                      child: LinearProgressIndicator(
                        value: 4259 / 8000,
                        color: Colors.green,
                        backgroundColor: AppColors.grey1,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "53%",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
