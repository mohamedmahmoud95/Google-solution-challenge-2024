import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    double? screenWidth = MediaQuery.of(context).size.width;
    double? screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: screenWidth*0.43,
          height: screenHeight * 0.2,
          decoration: BoxDecoration(
            color: AppColors.oliveGreen2,
            borderRadius: BorderRadius.circular(20)
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: screenWidth*0.1,
            height: screenHeight * 0.05,
            decoration: BoxDecoration(
              color: AppColors.offWhite,
              borderRadius: BorderRadius.circular(20)
            ),
            child: const Icon(Icons.add, size: 24,)
          ),
        )
      ],
    );
  }
}