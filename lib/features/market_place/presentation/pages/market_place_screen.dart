import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/features/market_place/presentation/widget/product_card_widget.dart';

class MarketPlaceScreen extends StatefulWidget {
  const MarketPlaceScreen({super.key});

  @override
  State<MarketPlaceScreen> createState() => _MarketPlaceScreenState();
}

class _MarketPlaceScreenState extends State<MarketPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discover'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: AppColors.grey1,
              child: IconButton(
                onPressed:(){
                  Navigator.pushNamed(context, 'ShoppingCartScreen');
                },
                icon: const Icon(Icons.shopping_bag_outlined, color: Colors.black,),
              ),
            ),
          ),
        ],
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * .02,),
              Center(
                child: SizedBox(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.07,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.green),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: AppColors.green),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "\tSearch...",
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                      suffixIcon: const Icon(
                        FontAwesomeIcons.magnifyingGlass,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * .04,),
              Container(
                width: screenWidth*0.9,
                height: screenHeight * 0.2,
                
                decoration: BoxDecoration(
                  color: AppColors.oliveGreen2,
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(image: AssetImage('assets/images/market_place/MarketFace.png'), fit: BoxFit.fill)
                ),
              ),
              SizedBox(height: screenHeight * .02,),
              Center(
                child: SizedBox(
                  width: screenWidth*0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Categories', style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500
                      ),),
                      TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, 'CategoriesScreen');
                        },
                        child: const Text('See All', style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.oliveGreen3
                        ),)
                      )
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  SizedBox(width: screenWidth*0.05,),
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          getTestButton(screenWidth, screenHeight, 'All'),
                          SizedBox(width: screenWidth * 0.03,),
                          getTestButton(screenWidth, screenHeight, 'Clothes'),
                          SizedBox(width: screenWidth * 0.03,),
                          getTestButton(screenWidth, screenHeight, 'Nutrition'),
                          SizedBox(width: screenWidth * 0.03,),
                          getTestButton(screenWidth, screenHeight, 'Home Appliances'),
                          SizedBox(width: screenWidth * 0.03,),
                          getTestButton(screenWidth, screenHeight, 'Accessories'),
                          SizedBox(width: screenWidth * 0.03,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * .04,),
              SizedBox(
                width: screenWidth * 0.9,
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductCard(),
                        ProductCard()
                      ],
                    ),
                    SizedBox(height: screenHeight*0.02,),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductCard(),
                        ProductCard()
                      ],
                    ),
                    SizedBox(height: screenHeight*0.02,),
                    TextButton(
                      onPressed: (){},
                      child: const Text('View More', style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: AppColors.oliveGreen3
                      ),)
                    ),
                    SizedBox(height: screenHeight*0.02,),
                  ],
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}

Widget getTestButton(screenWidth, screenHeight, textToDisplay){
  return GestureDetector(
    onTap: (){},
    child: Container(
      height: screenHeight*0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.oliveGreen3
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(child: Text(textToDisplay, style: const TextStyle(color: Colors.white, fontSize: 16))),
          ),
        ],
      ),
    ),
  );
}