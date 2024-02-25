import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';

import '../../dummy_categories_data.dart';
import '../widget/product_category_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
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
                ...sampleProductCategories.map((category) => ProductCategoryCard(productCategory: category)),
              ],
            ),),
          ),
        ),
      ),
    );
  }
}