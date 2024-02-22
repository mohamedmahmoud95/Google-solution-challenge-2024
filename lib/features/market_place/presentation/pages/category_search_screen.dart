import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';

class CategorySearchScreen extends StatefulWidget {
  const CategorySearchScreen({super.key});

  @override
  State<CategorySearchScreen> createState() => _CategorySearchScreenState();
}

class _CategorySearchScreenState extends State<CategorySearchScreen> {

  bool showSort = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
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
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * .02,),
            SizedBox(
              width: screenWidth * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: screenWidth * 0.73,
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
                        hintText: "\Search...",
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                        suffixIcon: const Icon(
                          FontAwesomeIcons.magnifyingGlass,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        showSort = true;
                      });
                    },
                    child: Container(
                      width: screenWidth * 0.13,
                      height: screenHeight * 0.07,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: 1)
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(FontAwesomeIcons.sort, size: 20,),
                        ],
                      )
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * .02,),
            showSort ? Column(
              children: [
                Row(
                  children: [
                    SizedBox(width: screenWidth*0.05,),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            getTestButton(screenWidth, screenHeight, 'Price: Low to High', (){setState(() {
                              showSort = false;
                            });}),
                            SizedBox(width: screenWidth * 0.03,),
                            getTestButton(screenWidth, screenHeight, 'Price: High to Low', (){setState(() {
                              showSort = false;
                            });}),
                            SizedBox(width: screenWidth * 0.03,),
                            getTestButton(screenWidth, screenHeight, 'Avg Customer Review', (){setState(() {
                              showSort = false;
                            });}),
                            SizedBox(width: screenWidth * 0.03,),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * .02,),
              ],
            ):const SizedBox(),
            SizedBox(
              width: screenWidth * 0.9,
              child: const Text('Clothes', style: TextStyle(fontSize: 24)),
            ),
            SizedBox(height: screenHeight * .02,),
            Expanded(
              child: SingleChildScrollView(
                child: SizedBox(
                  width: screenWidth * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            width: screenWidth*0.43,
                            height: screenHeight * 0.3,
                            decoration: BoxDecoration(
                              color: AppColors.oliveGreen1,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: screenHeight * 0.02,),
                                Container(
                                  width: screenWidth*0.37,
                                  height: screenHeight * 0.2,
                                  decoration: BoxDecoration(
                                    color: AppColors.oliveGreen1,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02,),
                                const Text('Mohammed', style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight*0.02,),
                          Container(
                            width: screenWidth*0.43,
                            height: screenHeight * 0.25,
                            decoration: BoxDecoration(
                              color: AppColors.oliveGreen1,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: screenHeight * 0.02,),
                                Container(
                                  width: screenWidth*0.37,
                                  height: screenHeight * 0.15,
                                  decoration: BoxDecoration(
                                    color: AppColors.oliveGreen1,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02,),
                                const Text('Ahmed', style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight*0.02,),
                          Container(
                            width: screenWidth*0.43,
                            height: screenHeight * 0.3,
                            decoration: BoxDecoration(
                              color: AppColors.oliveGreen1,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: screenHeight * 0.02,),
                                Container(
                                  width: screenWidth*0.37,
                                  height: screenHeight * 0.2,
                                  decoration: BoxDecoration(
                                    color: AppColors.oliveGreen1,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02,),
                                const Text('Essam', style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            width: screenWidth*0.43,
                            height: screenHeight * 0.25,
                            decoration: BoxDecoration(
                              color: AppColors.oliveGreen1,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: screenHeight * 0.02,),
                                Container(
                                  width: screenWidth*0.37,
                                  height: screenHeight * 0.15,
                                  decoration: BoxDecoration(
                                    color: AppColors.oliveGreen1,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02,),
                                const Text('Osama', style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight*0.02,),
                          Container(
                            width: screenWidth*0.43,
                            height: screenHeight * 0.3,
                            decoration: BoxDecoration(
                              color: AppColors.oliveGreen1,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: screenHeight * 0.02,),
                                Container(
                                  width: screenWidth*0.37,
                                  height: screenHeight * 0.2,
                                  decoration: BoxDecoration(
                                    color: AppColors.oliveGreen1,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02,),
                                const Text('Morcous', style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                          SizedBox(height: screenHeight*0.02,),
                          Container(
                            width: screenWidth*0.43,
                            height: screenHeight * 0.25,
                            decoration: BoxDecoration(
                              color: AppColors.oliveGreen1,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Column(
                              children: [
                                SizedBox(height: screenHeight * 0.02,),
                                Container(
                                  width: screenWidth*0.37,
                                  height: screenHeight * 0.15,
                                  decoration: BoxDecoration(
                                    color: AppColors.oliveGreen1,
                                    borderRadius: BorderRadius.circular(20)
                                  ),
                                ),
                                SizedBox(height: screenHeight * 0.02,),
                                const Text('Mina', style: TextStyle(fontSize: 20),)
                              ],
                            ),
                          ),
                        ],
                      ),
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

Widget getTestButton(screenWidth, screenHeight, textToDisplay, functionToCall){
  return GestureDetector(
    onTap: (){
      functionToCall();
    },
    child: Container(
      height: screenHeight*0.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.oliveGreen2
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(child: Text(textToDisplay, style: const TextStyle(color: Colors.black, fontSize: 16))),
          ),
        ],
      ),
    ),
  );
}