import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/app_measures.dart';
import 'package:google_solution_challenge_2024/core/utils/image_utilities.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/offline_resource_step.dart';

class OneOfflineResourceStepCard extends StatelessWidget {
  final OfflineResourceStep step;
  const OneOfflineResourceStepCard(this.step, {super.key});

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object>? imageProvider = ImageUtils.getImage(step.imageLink);
    return
      Card(
        elevation: 0,
      color: AppColors.appleWhite,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
              color: AppColors.white,
                borderRadius: BorderRadius.circular(AppMeasures.defaultCircularRadius),
        ),
            child: Padding(
              padding: EdgeInsets.all(8),
            child: Align(
              alignment: Alignment.centerLeft,
            child: Text("[${step.index}] ${step.title.toString()}", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),),
            ),),
            const SizedBox(height: 10,),
            Text(step.bodyText.toString()),
            const SizedBox(height: 10,),
            step.imageLink == null? const SizedBox() :
            Image(image: imageProvider!,),

          ],
        ),
      ),
    );
  }
}
