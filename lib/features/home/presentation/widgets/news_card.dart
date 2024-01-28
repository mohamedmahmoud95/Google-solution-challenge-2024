import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/manager/cubit.dart';

import '../../../../config/routes.dart';

class NewsCard extends StatelessWidget {
  final int index;

  const NewsCard(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.pushNamed(context, Routes.articlesDetails);
      },
      child: AnimatedBuilder(
        animation: HomeCubit.get(context).pageController,
        builder: (context, child) {
          return Transform.rotate(
            angle: pi * 180,
            child: Hero(
              tag: "news_tag",
              child: Card(
                elevation: 5,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.transparent)),
                child: Container(
                  padding: const EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                        child: Image.asset(
                          AppImages.family,
                          height: 200,
                          fit: BoxFit.fill,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Palestine",
                        style: Theme.of(context).textTheme.titleLarge,
                        maxLines: 2,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "don't worry my brother",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Text(
                        "eman pepars",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      Text(
                        "10/12/2023 ",
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.end,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}