import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/features/market_place/domain/product.dart';

class ProductInfoScreen extends StatelessWidget {
  final Product product;
  const ProductInfoScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.oliveGreen2,
      extendBodyBehindAppBar: true,
      appBar: AppBar(forceMaterialTransparency: true,),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * 0.57,
              decoration: BoxDecoration(
                color: AppColors.oliveGreen2,
                image: DecorationImage(image: AssetImage(product.thumbnail as  String), fit: BoxFit.fill)
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: screenHeight * 0.45,
              width: screenWidth,
              decoration: const BoxDecoration(
                color: AppColors.beige,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight*0.01,),
                    Text(product.name as String, style: const TextStyle(fontSize: 34),),
                    SizedBox(height: screenHeight*0.01,),
                    Row(
                      children: [
                        ratingIndicator(product.rating.toString()),
                        SizedBox(width: screenWidth*0.03,),
                        Text('${Random().nextInt(200)} Reviews', style: const TextStyle(fontSize: 16),)
                      ],
                    ),
                    SizedBox(height: screenHeight*0.02,),
                    Text(product.description as String, style: const TextStyle(fontSize: 18),),
                    SizedBox(height: screenHeight*0.01,),
                    SizedBox(
                      height: screenHeight * 0.23,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Divider(),
                            SizedBox(height: screenHeight*0.01,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text('\$${product.price}', style: const TextStyle(fontSize: 32),),
                                Container(
                                  height: screenHeight*0.07,
                                  width: screenWidth*0.55,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.oliveGreen3
                                  ),
                                  child: const Center(child: Text('Add to Cart', style: TextStyle(color: Colors.white, fontSize: 24))),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget ratingIndicator(rating) {
    return Container(
      width: 75,
      height: 32.5,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.oliveGreen1.withOpacity(1),
        borderRadius: const BorderRadius.all(
            Radius.circular(25)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.star,
            color: AppColors.black0000,
            size: 17,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            rating,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              fontSize: 17,
              color: AppColors.black0000,
            ),
          ),
        ],
      ),
    );
  }