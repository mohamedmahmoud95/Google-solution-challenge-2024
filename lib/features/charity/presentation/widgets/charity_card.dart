import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/features/charity/data/models/charity_model.dart';

import '../../../../core/utils/app_images.dart';
import '../../../home/presentation/manager/cubit.dart';

class CharityCard extends StatelessWidget {
  final CharityModel charityModel;

  const CharityCard({required this.charityModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 5,
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(color: Colors.transparent)),
      child: Container(
        width: HomeCubit.get(context).screenWidth(context) * 0.82,
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
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: HomeCubit.get(context).screenHeight(context) * .015,
                right: HomeCubit.get(context).screenHeight(context) * .014,
                left: HomeCubit.get(context).screenHeight(context) * .014,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: HomeCubit.get(context).screenWidth(context) -
                                100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    charityModel.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 19,
                                      overflow: TextOverflow.ellipsis,
                                      color: Color(0xf51c1c1c),
                                    ),
                                    maxLines: 2,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20.0),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      SizedBox(
                                        width: 45,
                                        height: 42,
                                        child: CircularProgressIndicator(
                                          value: charityModel.funCollected /
                                              charityModel.fund,
                                          color: Colors.green,
                                          backgroundColor: AppColors.grey1,
                                        ),
                                      ),
                                      Text(
                                        "${((charityModel.funCollected / charityModel.fund) * 100).toStringAsFixed(0)}%",
                                        style: const TextStyle(
                                          fontSize: 14,
                                          overflow: TextOverflow.ellipsis,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "\$${charityModel.funCollected}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.green,
                                ),
                              ),
                              const Text(
                                " Fund Collected | ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.black45,
                                ),
                                maxLines: 1,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${charityModel.dayLeft}",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                      overflow: TextOverflow.ellipsis,
                                      color: Colors.green,
                                    ),
                                  ),
                                  const Text(
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
