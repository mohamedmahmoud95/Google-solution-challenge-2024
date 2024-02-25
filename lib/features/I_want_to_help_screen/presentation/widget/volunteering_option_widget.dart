import 'package:flutter/cupertino.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/app_measures.dart';
import 'package:google_solution_challenge_2024/core/utils/image_utilities.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';
import 'package:google_solution_challenge_2024/features/I_want_to_help_screen/domain/entity/volunteering_option.dart';

class VolunteeringOptionWidget extends StatelessWidget {
  final VolunteeringOption volunteeringOption;
  const VolunteeringOptionWidget({super.key, required this.volunteeringOption});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('registerAsVolunteerScreen');
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Container(
          height: ScreenUtils.getScreenHeight(context) / 4,
          width: ScreenUtils.getScreenWidth(context) / 2 - 30,
          decoration: BoxDecoration(
            color: AppColors.offWhite,
            borderRadius:
                BorderRadius.circular(AppMeasures.defaultCircularRadius),
          ),
          child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: ScreenUtils.getScreenHeight(context) / 6,
                  width: ScreenUtils.getScreenWidth(context) / 2 - 30,
                  decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    image: DecorationImage(
                        image: ImageUtils.getImage(volunteeringOption.imageUrl),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(
                        AppMeasures.defaultCircularRadius),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                    child: Text(
                  volunteeringOption.title!,
                  style:
                      const TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                )),

                volunteeringOption.subtitle == null? const SizedBox() :
                SizedBox(
                    child: Text(
                      volunteeringOption.subtitle!,
                      style:
                      const TextStyle(fontSize: 12, overflow: TextOverflow.ellipsis),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
