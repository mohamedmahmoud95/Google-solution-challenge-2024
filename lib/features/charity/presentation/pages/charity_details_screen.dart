import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/config/routes.dart';
import 'package:google_solution_challenge_2024/features/charity/data/models/charity_model.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../home/presentation/manager/cubit.dart';

class CharityDetailsScreen extends StatelessWidget {
  final CharityModel charityModel;

  const CharityDetailsScreen({required this.charityModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                width: double.maxFinite,
                decoration: const BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: const Center(
                  child: Divider(
                    thickness: 3,
                    color: Colors.white60,
                    indent: 140,
                    endIndent: 140,
                  ),
                ),
              ),
            ),
            expandedHeight: 300,
            elevation: 0,
            pinned: true,
            floating: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                charityModel.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.black87,
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                bottom: 20,
                top: 10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
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
                                  width: HomeCubit.get(context)
                                          .screenWidth(context) -
                                      50,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 250,
                                        child: Text(
                                          charityModel.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 22,
                                            overflow: TextOverflow.ellipsis,
                                            color: Colors.white,
                                          ),
                                          maxLines: 2,
                                        ),
                                      ),
                                      Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          SizedBox(
                                            width: 45,
                                            height: 42,
                                            child: CircularProgressIndicator(
                                              value: charityModel.funCollected /
                                                  charityModel.fund,
                                              color: Colors.green,
                                              backgroundColor:
                                                  AppColors.lightGrey,
                                            ),
                                          ),
                                          Text(
                                            "${((charityModel.funCollected / charityModel.fund) * 100).toStringAsFixed(0)}%",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              overflow: TextOverflow.ellipsis,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
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
                                    Text(
                                      " Fund Collected from \$${charityModel.fund} ",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                        overflow: TextOverflow.ellipsis,
                                        color: Colors.white70,
                                      ),
                                      maxLines: 1,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      height: 35,
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.person_outlined,
                              color: Colors.white60,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "By",
                              style: TextStyle(
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              charityModel.organizationName,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.green,
                              ),
                              maxLines: 2,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                          child: VerticalDivider(
                            color: Colors.white,
                            thickness: 1,
                            width: 20,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.timer_outlined,
                              color: Colors.white60,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "${charityModel.dayLeft} days left",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white70,
                              ),
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      height: 35,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 100,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              child: Image(
                                image: AssetImage(
                                  charityModel.listImagesUrl[index],
                                ),
                                fit: BoxFit.fill,
                                width: 100,
                                height: 100,
                              ),
                            ),
                            itemCount: charityModel.listImagesUrl.length,
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const SizedBox(width: 10),
                          ),
                        ),
                        const Divider(
                          height: 35,
                        ),
                      ],
                    ),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ReadMoreText(
                      charityModel.description,
                      trimLines: 2,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      moreStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      lessStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70),
                    ),
                    const Divider(
                      height: 35,
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Icon(
                            Icons.verified_user_sharp,
                            size: 30,
                            color: Colors.white60,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "The Winchesters",
                              style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 18,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                            ),
                            Text(
                              "Verified foundation",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white70,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.donateScreen);
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 18.0, horizontal: 10),
                          child: Text(
                            "Donate Now",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
