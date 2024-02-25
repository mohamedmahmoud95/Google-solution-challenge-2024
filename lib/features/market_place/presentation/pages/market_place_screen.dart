import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/features/market_place/domain/product.dart';
import 'package:google_solution_challenge_2024/features/market_place/dummy_product_data.dart';
import 'package:google_solution_challenge_2024/features/market_place/presentation/widget/filter_button.dart';
import 'package:google_solution_challenge_2024/features/market_place/presentation/widget/product_card_widget.dart';

class MarketPlaceScreen extends StatefulWidget {
  const MarketPlaceScreen({super.key});

  @override
  State<MarketPlaceScreen> createState() => _MarketPlaceScreenState();
}

class _MarketPlaceScreenState extends State<MarketPlaceScreen> {
  List<Product> currentProductList = sampleProducts;

  void updateProductList(category) {
    if (category == 'Clothes') {
      currentProductList = sampleClothesProducts;
    } else if (category == 'Handmade') {
      currentProductList = sampleHandmadeProducts;
    } else if (category == 'Home Appliances') {
      currentProductList = sampleHomeProducts;
    } else if (category == 'Tools') {
      currentProductList = sampleToolProducts;
    } else if (category == 'Authentic Food') {
      currentProductList = sampleAuthenticFoodProducts;
    } else {
      currentProductList = sampleProducts;
    }
    setState(() {
      currentProductList.shuffle();
    });
  }

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
      body: Expanded(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * .02,
            ),
            Center(
              child: SizedBox(
                width: screenWidth * 0.9,
                height: screenHeight * 0.07,
                child: TextFormField(
                  autofocus: false,
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
                    hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                    suffixIcon: const Icon(
                      FontAwesomeIcons.magnifyingGlass,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * .04,
            ),
            Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.2,
              decoration: BoxDecoration(
                  color: AppColors.oliveGreen2,
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                      image: AssetImage(
                          'assets/images/market_place/MarketFace.png'),
                      fit: BoxFit.fill)),
            ),
            SizedBox(
              height: screenHeight * .02,
            ),
            Center(
              child: SizedBox(
                width: screenWidth * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Categories',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'CategoriesScreen');
                        },
                        child: const Text(
                          'See All',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColors.oliveGreen3),
                        ))
                  ],
                ),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: screenWidth * 0.05,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        generateFilterButton(screenWidth, screenHeight,
                            AppColors.oliveGreen3, 'All', updateProductList, true),
                        SizedBox(
                          width: screenWidth * 0.03,
                        ),
                        generateFilterButton(screenWidth, screenHeight,
                            AppColors.oliveGreen3, 'Clothes', updateProductList, true),
                        SizedBox(
                          width: screenWidth * 0.03,
                        ),
                        generateFilterButton(screenWidth, screenHeight,
                            AppColors.oliveGreen3, 'Authentic Food', updateProductList, true),
                        SizedBox(
                          width: screenWidth * 0.03,
                        ),
                        generateFilterButton(screenWidth, screenHeight,
                            AppColors.oliveGreen3, 'Home Appliances', updateProductList, true),
                        SizedBox(
                          width: screenWidth * 0.03,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * .04,
            ),
            SizedBox(
              width: screenWidth * 0.9,
              child: Column(
                children: [
                  SizedBox(
                    width: screenWidth * 0.9,
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      runSpacing: screenHeight * 0.02,
                      children: [
                        ...currentProductList.sublist(0, 4).map((product) {
                          return ProductCard(product: product);
                        })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'CategorySearchScreen',
                            arguments: 'All');
                      },
                      child: const Text(
                        'View More',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: AppColors.oliveGreen3),
                      )),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}