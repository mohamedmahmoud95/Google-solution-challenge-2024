import 'package:flutter/material.dart';
import '../../../../core/utils/app_images.dart';
import '../../../home/presentation/manager/cubit.dart';
import '../../../home/presentation/widgets/post_card.dart';

class PrayerCard extends StatelessWidget {
  const PrayerCard({super.key});

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
            Padding(
              padding: EdgeInsets.only(
                  right: HomeCubit.get(context).screenWidth(context) * .04,
                  left: HomeCubit.get(context).screenWidth(context) * .04,
                  top: HomeCubit.get(context).screenHeight(context) * .02),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: AssetImage(AppImages.mentalHealth),
                  ),
                  SizedBox(
                      width: HomeCubit.get(context).screenWidth(context) * .03),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Eman Pe-pars',
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 18),
                      ),
                      Text(
                        "3 second",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black26,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              indent: HomeCubit.get(context).screenWidth(context) * .05,
              endIndent: HomeCubit.get(context).screenWidth(context) * .05,
              height: HomeCubit.get(context).screenHeight(context) * .04,
              color: const Color(0x67b7b7b7),
            ),
            SizedBox(
              height: HomeCubit.get(context).screenHeight(context) * .082,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: HomeCubit.get(context).screenWidth(context) * .05,
                ),
                child: const Center(
                  child: Text(
                    "Hopefully Audrey can get surgery soon, recover from her illness, and play with her friends..",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      overflow: TextOverflow.ellipsis,
                      color: Color(0xf51c1c1c),
                    ),
                    maxLines: 4,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: HomeCubit.get(context).screenHeight(context) * .014,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: HomeCubit.get(context).screenWidth(context) * .05,
              ),
              child: const Text(
                "You and 48 others sent this prayer",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black26,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: HomeCubit.get(context).screenWidth(context) * .03,
                left: HomeCubit.get(context).screenWidth(context) * .03,
              ),
              child: Row(
                children: [
                  Row(
                    children: [
                      IconButton(
                          icon: const Icon(
                            Icons.favorite,
                            color: Colors.black,
                          ),
                          onPressed: () {}),
                      const Text(
                        "Aamiin",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                      width: HomeCubit.get(context).screenWidth(context) * .03),
                  const Row(
                    children: [
                      SharePostWidget(numOfShares: 0),
                      Text(
                        "Share",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.black45,
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
    );
  }
}
