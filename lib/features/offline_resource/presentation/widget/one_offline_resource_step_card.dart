import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/image_utilities.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/step.dart';

class OneOfflineResourceStepCard extends StatelessWidget {
  final OfflineResourceStep step;
  const OneOfflineResourceStepCard(this.step, {super.key});

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object>? imageProvider = ImageUtils.getImage(step.imageLink);
    return
      Card(
      color: AppColors.appleWhite,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(step.title.toString()),
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
