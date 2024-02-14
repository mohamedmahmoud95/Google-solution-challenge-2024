import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';

import '../../../../core/utils/app_images.dart';
import '../../../home/presentation/manager/cubit.dart';

class CharityCard extends StatelessWidget {
  const CharityCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.transparent)),
      child: Container(
        width: HomeCubit.get(context).screenWidth(context) * 0.75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Image.asset(
                    AppImages.education,
                    height: HomeCubit.get(context).screenHeight(context) * 0.26,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal:
                          HomeCubit.get(context).screenWidth(context) * 0.02,
                      vertical:
                          HomeCubit.get(context).screenHeight(context) * 0.01),
                  child: IconButton(
                    onPressed: () {},
                    icon: Container(
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal:
                            HomeCubit.get(context).screenWidth(context) * 0.026,
                        vertical: HomeCubit.get(context).screenHeight(context) *
                            0.012,
                      ),
                      child: const Icon(
                        Icons.bookmark_border,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: HomeCubit.get(context).screenHeight(context) * .014,
                horizontal: HomeCubit.get(context).screenHeight(context) * .014,
              ),
              child: Column(
                children: [
                  const Text(
                    "Helping Earthquake Victims Helping Earthquake Victims ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      overflow: TextOverflow.ellipsis,
                      color: Color(0xf51c1c1c),
                    ),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: HomeCubit.get(context).screenHeight(context) * .01,
                  ),
                  const Row(
                    children: [
                      Text(
                        "\$4,259",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.green,
                        ),
                      ),
                      Text(
                        " fund raised from \$8,000",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black45,
                        ),
                        maxLines: 1,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: HomeCubit.get(context).screenHeight(context) * .015,
                  ),
                  const LinearProgressIndicator(
                    value: 4259 / 8000,
                    color: Colors.green,
                    backgroundColor: AppColors.lightGrey,
                  ),
                  SizedBox(
                    height: HomeCubit.get(context).screenHeight(context) * .015,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "2,367",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            " Donators",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black45,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "4",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            " days left",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              overflow: TextOverflow.ellipsis,
                              color: Colors.black45,
                            ),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
