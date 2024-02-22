import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: screenHeight*0.55,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: screenHeight * .04,),
                  getTestItem(screenWidth, screenHeight, 'Xbox Series X', '1 TB', '\$250', '3'),
                  SizedBox(height: screenHeight * .02,),
                  getTestItem(screenWidth, screenHeight, 'Playstation 5', '2 TB', '\$350', '2'),
                  SizedBox(height: screenHeight * .02,),
                  getTestItem(screenWidth, screenHeight, '7amada Station', '20 TB', '\$12250', '1'),
                  SizedBox(height: screenHeight * .02,),
                  getTestItem(screenWidth, screenHeight, 'Mahmoud Station', '1 MB', '\$23', '1'),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * .05,),
          Center(
            child: Container(
              width: screenWidth*0.9,
              height: screenHeight * 0.17,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Subtotal:', style: TextStyle(fontSize: 18),),
                      Text('\$570', style: TextStyle(fontSize: 18),)
                    ],
                  ),
                  SizedBox(height: screenHeight * .01,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery:', style: TextStyle(fontSize: 18),),
                      Text('\$30', style: TextStyle(fontSize: 18),)
                    ],
                  ),
                  SizedBox(height: screenHeight * .01,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tax:', style: TextStyle(fontSize: 18),),
                      Text('\$20', style: TextStyle(fontSize: 18),)
                    ],
                  ),
                  SizedBox(height: screenHeight * .01,),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total:', style: TextStyle(fontSize: 18),),
                      Text('\$620', style: TextStyle(fontSize: 18),)
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: screenHeight * .01,),
          SizedBox(width: screenWidth*0.9, child: Divider()),
          SizedBox(height: screenHeight * .01,),
          getTestButton(screenWidth, screenHeight, 'Checkout'),
          SizedBox(height: screenHeight * .01,),
        ],
      ),
    );
  }
}

Widget getTestButton(screenWidth, screenHeight, textToDisplay){
  return GestureDetector(
    onTap: (){},
    child: Container(
      height: screenHeight*0.07,
      width: screenWidth*0.9,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.oliveGreen3
      ),
      child: Center(child: Text(textToDisplay, style: const TextStyle(color: Colors.white, fontSize: 24))),
    ),
  );
}

Widget getTestItem(screenWidth, screenHeight, itemTitle, extraText, price, quantity){
  return SizedBox(
    width: screenWidth * 0.9,
    height: screenHeight * 0.15,
    child: Row(
      children: [
        Container(
          width: screenWidth * 0.3,
          height: screenHeight * 0.15,
          decoration: BoxDecoration(
            color: AppColors.beige,
            borderRadius: BorderRadius.circular(20)
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
                  Text(itemTitle, style: const TextStyle(fontSize: 20),),
                  IconButton(onPressed: (){}, icon: const Icon(Icons.close))
                ],
              ),
              Text(extraText, style: const TextStyle(fontSize: 12),),
              SizedBox(height: screenHeight * 0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(price, style: const TextStyle(fontSize: 24),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: screenWidth * 0.1,
                        height: screenHeight * 0.04,
                        decoration: BoxDecoration(
                          color: AppColors.oliveGreen2,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Center(child: Text('-', style: TextStyle(fontSize: 20),),),
                      ),
                      SizedBox(width: screenWidth * 0.03,),
                      Text(quantity, style: const TextStyle(fontSize: 20),),
                      SizedBox(width: screenWidth * 0.03,),
                      Container(
                        width: screenWidth * 0.1,
                        height: screenHeight * 0.04,
                        decoration: BoxDecoration(
                          color: AppColors.oliveGreen2,
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