import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';

import '../../../../config/routes.dart';
import '../manager/cubit.dart';

class PostCard extends StatelessWidget {
  final int index;

  const PostCard({required this.index, super.key});

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
        animation: HomeCubit.get(context).postPageController,
        builder: (BuildContext context, Widget? child) => Hero(
          tag: "post$index",
          child: Card(
            color: AppColors.oliveGreen1,
            elevation: 1,
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.transparent)),
            child: Container(
              width: HomeCubit.get(context).screenWidth(context) * 0.82,
              decoration: BoxDecoration(
                color: AppColors.oliveGreen1,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right:
                            HomeCubit.get(context).screenWidth(context) * .04,
                        left: HomeCubit.get(context).screenWidth(context) * .04,
                        top:
                            HomeCubit.get(context).screenHeight(context) * .02),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(AppImages.mentalHealth),
                        ),
                        SizedBox(
                            width: HomeCubit.get(context).screenWidth(context) *
                                .03),
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
                                  color: AppColors.darkGreen2, fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    indent: HomeCubit.get(context).screenWidth(context) * .05,
                    endIndent:
                        HomeCubit.get(context).screenWidth(context) * .05,
                    height: HomeCubit.get(context).screenHeight(context) * .04,
                    color: const Color(0x67b7b7b7),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal:
                          HomeCubit.get(context).screenWidth(context) * .05,
                    ),
                    child: const Text(
                      "Don't Worry My Brother",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                          color: Colors.black87),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            HomeCubit.get(context).screenWidth(context) * .03,
                        vertical:
                            HomeCubit.get(context).screenHeight(context) * .02),
                    child: Image.asset(
                      AppImages.family,
                      height: HomeCubit.get(context).screenHeight(context) * .3,
                      width: double.infinity,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            HomeCubit.get(context).screenWidth(context) * .03,
                        vertical:
                            HomeCubit.get(context).screenHeight(context) * .02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                                icon: const Icon(
                                  Icons.thumb_up,
                                  color: Colors.black,
                                ),
                                onPressed: () {}),
                            SizedBox(
                                width: HomeCubit.get(context)
                                        .screenWidth(context) *
                                    .01),
                            const Text("5 like",
                                style: TextStyle(color: AppColors.darkGreen2)),
                          ],
                        ),
                        Row(
                          children: [
                            const WriteCommentWidget(numOfComments: 4),
                            SizedBox(
                                width: HomeCubit.get(context)
                                        .screenWidth(context) *
                                    .01),
                            const Text("0 comment",
                                style: TextStyle(color: AppColors.darkGreen2)),
                          ],
                        ),
                        Row(
                          children: [
                            const SharePostWidget(numOfShares: 0),
                            SizedBox(
                                width: HomeCubit.get(context)
                                        .screenWidth(context) *
                                    .01),
                            const Text("6 share",
                                style: TextStyle(color: AppColors.darkGreen2)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SharePostWidget extends StatefulWidget {
  final int numOfShares;

  const SharePostWidget({required this.numOfShares, super.key});

  @override
  State<SharePostWidget> createState() => _SharePostWidgetState();
}

class _SharePostWidgetState extends State<SharePostWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.all(8),
              color: Colors.red,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      minLines: 8,
                      maxLines: 15,
                      style: const TextStyle(
                        color: Colors.green,
                      ),
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        hintText: "You may add a caption here...",
                        hintStyle: TextStyle(
                          color: Colors.blue,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
//   ],
// ),
                    const SizedBox(
                      height: 8,
                    ),

                    const SizedBox(
                      width: 30,
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.red,
                        backgroundColor: Colors.blue,
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        'Share',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
// onFocusChange: ,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            );
//    );
          },
        );
      },
      icon: Icon(
        Icons.share,
        color: widget.numOfShares > 0 ? Colors.blue : Colors.black,
      ),
    );
  }
}

class WriteCommentWidget extends StatefulWidget {
  final int numOfComments;

  const WriteCommentWidget({required this.numOfComments, super.key});

  @override
  State<WriteCommentWidget> createState() => _WriteCommentWidgetState();
}

class _WriteCommentWidgetState extends State<WriteCommentWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          builder: (BuildContext context) {
            return Container(
              padding: const EdgeInsets.all(8),
              color: Colors.red,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      minLines: 8,
                      maxLines: 15,
                      style: const TextStyle(
                        color: Colors.red,
                      ),
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        hintText: "Write your comment here...",
                        hintStyle: TextStyle(
                          color: Colors.red,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                      ),
                    ),
//   ],
// ),
                    const SizedBox(
                      height: 8,
                    ),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.image_outlined,
                              color: Colors.red,
                            ),
                            SizedBox(width: 4),
                            Text(" Image",
                                style: TextStyle(color: Colors.green)),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.red,
                        backgroundColor: Colors.red,
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        'Comment',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
// onFocusChange: ,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            );
//    );
          },
        );
      },
      icon: const Icon(
        Icons.comment_rounded,
        color: Colors.black,
      ),
    );
  }
}
