import 'package:flutter/cupertino.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/app_measures.dart';
import 'package:google_solution_challenge_2024/core/utils/image_utilities.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';
import 'package:google_solution_challenge_2024/features/market_place/domain/product_category.dart';

class ProductCategoryCard extends StatelessWidget {
  final ProductCategory productCategory;
  const ProductCategoryCard({super.key, required this.productCategory});

  @override 
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, 'CategorySearchScreen', arguments: productCategory.name);
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(AppMeasures.defaultCircularRadius),
            color: AppColors.offWhite,
          ),
          child: 
              Padding(
                padding: const EdgeInsets.all(8),
                
          child: Column(
            children: [
              Container(
                height: ScreenUtils.getScreenHeight(context) / 5 - 20,
                width: ScreenUtils.getScreenWidth(context) / 2 - 60,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppMeasures.defaultCircularRadius),
                  color: AppColors.offWhite,
                  image: DecorationImage(
      
                  image: ImageUtils.getImage(productCategory.imageUrl,)!, fit: BoxFit.cover,
                ),),
              ),
              const SizedBox(height: 10,),
              Text(
                productCategory.name!,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 20,
                ),
              )
            ],
          ),
        ),
        ),
      ),
    );
  }
}
