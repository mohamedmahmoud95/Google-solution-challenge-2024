import 'package:flutter/material.dart';

import '../manager/cubit.dart';

class CategoryCard extends StatelessWidget {
  final String image;
  final String text;
  final Function? onPressed;

  const CategoryCard(
      {required this.text,
      required this.image,
      super.key,
        this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onPressed!();
      },
      child: Card(
        elevation: 10,
        child: Container(
          width: HomeCubit.get(context).screenWidth(context) * .4,
          height: HomeCubit.get(context).screenHeight(context) * .18,
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
              color: Colors.white,
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
                height: HomeCubit.get(context).screenHeight(context) * .001,
              ),
              Text(
                text,
                style: const TextStyle(fontWeight: FontWeight.w900),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
