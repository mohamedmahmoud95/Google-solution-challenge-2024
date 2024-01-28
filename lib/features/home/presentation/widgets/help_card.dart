import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';

class HelpCard extends StatelessWidget {
  final int index;

  const HelpCard(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        // Navigator.pushNamed(context, Routes.articlesDetails);
      },
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25)),
                child: Image.asset(
                  AppImages.family,
                  height: 180,
                  fit: BoxFit.fill,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "help .title ",
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 60,
                    width: 120,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {},
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.black,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
