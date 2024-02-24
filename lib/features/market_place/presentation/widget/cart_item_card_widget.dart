import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/features/market_place/domain/product.dart';

class ShoppingCartItem extends StatelessWidget {
  final Product product;
  const ShoppingCartItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double? screenWidth = MediaQuery.of(context).size.width;
    double? screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: screenWidth * 0.9,
      child: Row(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, 'ProductInfoScreen', arguments:  product);
            },
            child: Container(
              width: screenWidth * 0.3,
              height: screenHeight * 0.15,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(product.thumbnail as String), fit: BoxFit.fill),
                color: AppColors.beige,
                borderRadius: BorderRadius.circular(20)
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.03,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.44,
                      child: Text(product.name as String, style: const TextStyle(fontSize: 20), maxLines: 2, overflow: TextOverflow.ellipsis,)
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.close))
                  ],
                ),
                const Text('Generic', style: TextStyle(fontSize: 12),),
                SizedBox(height: screenHeight * 0.03,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$${product.price!.toString()}", style: const TextStyle(fontSize: 24),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: screenWidth * 0.1,
                          height: screenHeight * 0.04,
                          decoration: BoxDecoration(
                            color: AppColors.grey1,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: const Center(child: Text('-', style: TextStyle(fontSize: 20),),),
                        ),
                        SizedBox(width: screenWidth * 0.03,),
                        Text("${Random().nextInt(10) + 1}", style: const TextStyle(fontSize: 20),),
                        SizedBox(width: screenWidth * 0.03,),
                        Container(
                          width: screenWidth * 0.1,
                          height: screenHeight * 0.04,
                          decoration: BoxDecoration(
                            color: AppColors.grey1,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: const Center(child: Text('+', style: TextStyle(fontSize: 20),),),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}