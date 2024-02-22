import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';

class ProductInfoScreen extends StatefulWidget {
  const ProductInfoScreen({super.key});

  @override
  State<ProductInfoScreen> createState() => _ProductInfoScreenState();
}

class _ProductInfoScreenState extends State<ProductInfoScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.oliveGreen2,
      extendBodyBehindAppBar: true,
      appBar: AppBar(forceMaterialTransparency: true,),
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight * 0.55,
            decoration: const BoxDecoration(
              color: AppColors.oliveGreen2
            ),
          ),
          Expanded(
            child: Container(
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
                    const Text('Xbox Series X', style: TextStyle(fontSize: 34),),
                    SizedBox(height: screenHeight*0.01,),
                    Row(
                      children: [
                        ratingIndicator('4.8'),
                        SizedBox(width: screenWidth*0.03,),
                        const Text('117 Reviews', style: TextStyle(fontSize: 16),)
                      ],
                    ),
                    SizedBox(height: screenHeight*0.02,),
                    const Text('''Lorem ipsum dolor sit amet consectetur adipisicing elit. Sit nesciunt vel natus placeat expedita, ullam illo, itaque consequatur numquam consectetur quaerat velit ad laboriosam. Aspernatur velit quibusdam placeat deserunt commodi.''', style: TextStyle(fontSize: 18),),
                    SizedBox(height: screenHeight*0.01,),
                    const Divider(),
                    SizedBox(height: screenHeight*0.01,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('\$560', style: TextStyle(fontSize: 32),),
                        getTestButton(screenWidth, screenHeight, 'Add to Cart')
                      ],
                    )
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

Widget ratingIndicator(rating) {
    return Container(
      width: 75,
      height: 32.5,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.oliveGreen1.withOpacity(1),
        border: Border.all(width: 0.5, color: AppColors.oliveGreen1),
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

  Widget getTestButton(screenWidth, screenHeight, textToDisplay){
  return GestureDetector(
    onTap: (){},
    child: Container(
      height: screenHeight*0.07,
      width: screenWidth*0.55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.oliveGreen3
      ),
      child: Center(child: Text(textToDisplay, style: const TextStyle(color: Colors.white, fontSize: 24))),
    ),
  );
}