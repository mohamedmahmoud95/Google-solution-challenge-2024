import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/features/market_place/domain/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double? screenWidth = MediaQuery.of(context).size.width;
    double? screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth*0.43,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: screenHeight*0.01,),
          Container(
            width: screenWidth*0.43,
            height: screenHeight * 0.2,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, 'ProductInfoScreen', arguments:  product);
                  },
                  child: Image.asset(product.thumbnail!, fit: BoxFit.fill,)
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: screenWidth*0.1,
                    height: screenHeight * 0.05,
                    decoration: BoxDecoration(
                      color: AppColors.grey1,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: const Icon(Icons.add, size: 24,)
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: screenHeight *0.01,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: screenWidth * 0.23,
                child: Text(product.name!, style: const TextStyle(fontSize: 16), maxLines: 2, overflow: TextOverflow.ellipsis,)
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 17,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    product.rating!.toString(),
                    style: const TextStyle(
                      fontSize: 17,
                      color: AppColors.black0000,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: screenHeight *0.005,),
          Text('\$${product.price}', style: const TextStyle(fontSize: 24),)
        ],
      ),
    );
  }
}