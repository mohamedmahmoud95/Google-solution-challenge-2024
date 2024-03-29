import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/features/market_place/domain/product.dart';
import 'package:google_solution_challenge_2024/features/market_place/dummy_product_data.dart';
import 'package:google_solution_challenge_2024/features/market_place/presentation/widget/filter_button.dart';
import 'package:google_solution_challenge_2024/features/market_place/presentation/widget/product_card_widget.dart';

class CategorySearchScreen extends StatefulWidget {
  final String category;
  const CategorySearchScreen({super.key, required this.category});

  @override
  State<CategorySearchScreen> createState() => _CategorySearchScreenState();
}

class _CategorySearchScreenState extends State<CategorySearchScreen> {
  bool showSort = false;

  List<Product> getProducts() {
    if (widget.category == 'Clothes') {
      return sampleClothesProducts;
    } else if (widget.category == 'Handmade') {
      return sampleHandmadeProducts;
    } else if (widget.category == 'Home') {
      return sampleHomeProducts;
    } else if (widget.category == 'Tools') {
      return sampleToolProducts;
    } else if (widget.category == 'Authentic food') {
      return sampleAuthenticFoodProducts;
    } else {
      return sampleProducts;
    }
  }

  void toggleShow() {
    setState(() {
      showSort = !showSort;
    });
  }

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    print(widget.category);

    return Scaffold(
      appBar: AppBar(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * .02,
            ),
            SizedBox(
              width: screenWidth * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth * 0.73,
                    height: screenHeight * 0.07,
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {});
                      },
                      controller: searchController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: AppColors.green),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        hintText: "\Search...",
                        hintStyle: const TextStyle(fontWeight: FontWeight.bold),
                        suffixIcon: const Icon(
                          FontAwesomeIcons.magnifyingGlass,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: toggleShow,
                    child: Container(
                        width: screenWidth * 0.13,
                        height: screenHeight * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1)),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              FontAwesomeIcons.sort,
                              size: 20,
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * .02,
            ),
            showSort
                ? Column(
                    children: [
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
                                  generateFilterButton(
                                      screenWidth,
                                      screenHeight,
                                      AppColors.oliveGreen2,
                                      'Price: Low to High',
                                      toggleShow,
                                      false),
                                  SizedBox(
                                    width: screenWidth * 0.03,
                                  ),
                                  generateFilterButton(
                                      screenWidth,
                                      screenHeight,
                                      AppColors.oliveGreen2,
                                      'Price: High to Low',
                                      toggleShow,
                                      false),
                                  SizedBox(
                                    width: screenWidth * 0.03,
                                  ),
                                  generateFilterButton(
                                      screenWidth,
                                      screenHeight,
                                      AppColors.oliveGreen2,
                                      'Avg Customer Review',
                                      toggleShow,
                                      false),
                                  SizedBox(
                                    width: screenWidth * 0.03,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * .02,
                      ),
                    ],
                  )
                : const SizedBox(),
            SizedBox(
              width: screenWidth * 0.9,
              child:
                  Text(widget.category, style: const TextStyle(fontSize: 24)),
            ),
            SizedBox(
              height: screenHeight * .02,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: screenWidth * 0.9,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    runSpacing: screenHeight * 0.02,
                    children: [
                      ...getProducts()
                          .where((product) => product.name!
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase()))
                          .map((product) => ProductCard(product: product))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}