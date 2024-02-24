import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';

import '../../dummy_categories_data.dart';
import '../widget/product_category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Categories'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: AppColors.grey1,
              child: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'ShoppingCartScreen');
                },
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
            width: screenWidth * 0.9,
            child:
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
            child: Wrap(
              children: [
                ...sampleProductCategories.map((category) => ProductCategoryCard(productCategory: category, routeName: 'CategorySearchScreen')),
              ],
            ),),
          ),
        ),
      ),
    );
  }

  Widget leftColumn(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return
      SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'CategorySearchScreen');
            },
            child: Container(
              width: screenWidth * 0.43,
              height: screenHeight * 0.3,
              decoration: BoxDecoration(
                  color: AppColors.oliveGreen1,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Container(
                    width: screenWidth * 0.37,
                    height: screenHeight * 0.2,
                    decoration: BoxDecoration(
                        color: AppColors.oliveGreen1,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const Text(
                    'Clothes',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Container(
            width: screenWidth * 0.43,
            height: screenHeight * 0.25,
            decoration: BoxDecoration(
                color: AppColors.oliveGreen1,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Container(
                  width: screenWidth * 0.37,
                  height: screenHeight * 0.15,
                  decoration: BoxDecoration(
                      color: AppColors.oliveGreen1,
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  'Home Appliances',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                )),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Container(
            width: screenWidth * 0.43,
            height: screenHeight * 0.3,
            decoration: BoxDecoration(
                color: AppColors.oliveGreen1,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Container(
                  width: screenWidth * 0.37,
                  height: screenHeight * 0.2,
                  decoration: BoxDecoration(
                      color: AppColors.oliveGreen1,
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Text(
                  'Handmade',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          const SizedBox(height: 40,),
        ],
      ),
    );
  }

  Widget rightColumn(BuildContext context){
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: screenWidth * 0.43,
            height: screenHeight * 0.25,
            decoration: BoxDecoration(
                color: AppColors.oliveGreen1,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Container(
                  width: screenWidth * 0.37,
                  height: screenHeight * 0.15,
                  decoration: BoxDecoration(
                      color: AppColors.oliveGreen1,
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Text(
                  'Nutrition',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Container(
            width: screenWidth * 0.43,
            height: screenHeight * 0.3,
            decoration: BoxDecoration(
                color: AppColors.oliveGreen1,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Container(
                  width: screenWidth * 0.37,
                  height: screenHeight * 0.2,
                  decoration: BoxDecoration(
                      color: AppColors.oliveGreen1,
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Text(
                  'Accessories',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Container(
            width: screenWidth * 0.43,
            height: screenHeight * 0.25,
            decoration: BoxDecoration(
                color: AppColors.oliveGreen1,
                borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Container(
                  width: screenWidth * 0.37,
                  height: screenHeight * 0.15,
                  decoration: BoxDecoration(
                      color: AppColors.oliveGreen1,
                      borderRadius: BorderRadius.circular(20)),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                const Text(
                  'Tools',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),

          const SizedBox(height: 40,),

        ],
      ),
    );
  }
}
