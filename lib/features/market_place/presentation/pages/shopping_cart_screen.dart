import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/features/market_place/domain/product.dart';
import 'package:google_solution_challenge_2024/features/market_place/dummy_product_data.dart';
import 'package:google_solution_challenge_2024/features/market_place/presentation/widget/cart_item_card_widget.dart';

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

    List<Product> showList = sampleProducts;
    showList.shuffle();

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.54,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: screenHeight * .04,
                        ),
                        ShoppingCartItem(
                          product: showList[0],
                        ),
                        SizedBox(
                          height: screenHeight * .02,
                        ),
                        ShoppingCartItem(
                          product: showList[1],
                        ),
                        SizedBox(
                          height: screenHeight * .02,
                        ),
                        ShoppingCartItem(
                          product: showList[2],
                        ),
                        SizedBox(
                          height: screenHeight * .02,
                        ),
                        ShoppingCartItem(
                          product: showList[3],
                        ),
                        SizedBox(
                          height: screenHeight * .02,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                  color: AppColors.offWhite,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.20,
                      decoration: BoxDecoration(
                          color: AppColors.offWhite,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Subtotal:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  '\$570',
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * .01,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Delivery:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  '\$30',
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * .01,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Tax:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  '\$20',
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                            SizedBox(
                              height: screenHeight * .01,
                            ),
                            SizedBox(
                                width: screenWidth * 0.9,
                                child: const Divider()),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total:',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  '\$620',
                                  style: TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * .01,
                  ),
                  Container(
                    height: screenHeight * 0.05,
                    width: screenWidth * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.oliveGreen3),
                    child: const Center(
                        child: Text('Checkout',
                            style: TextStyle(color: Colors.white, fontSize: 24))),
                  ),
                  // SizedBox(
                  //   height: screenHeight * .05,
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}