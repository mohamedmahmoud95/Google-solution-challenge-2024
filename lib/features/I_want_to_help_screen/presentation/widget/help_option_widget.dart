import 'package:flutter/cupertino.dart';
import 'package:google_solution_challenge_2024/features/I_want_to_help_screen/domain/entity/helping_option.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_measures.dart';
import '../../../../core/utils/image_utilities.dart';
import '../../../../core/utils/screen_utils.dart';

class HelpingOptionWidget extends StatefulWidget {
  final HelpingOption helpingOption;
  const HelpingOptionWidget({super.key, required this.helpingOption});

  @override
  State<HelpingOptionWidget> createState() => _HelpingOptionWidgetState();
}

class _HelpingOptionWidgetState extends State<HelpingOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.helpingOption.nextPageName != null) {
          Navigator.of(context).pushNamed(widget.helpingOption.nextPageName!);
        }
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: ScreenUtils.getScreenHeight(context) / 6,
                  width: ScreenUtils.getScreenWidth(context) / 2 - 30,
                  decoration: BoxDecoration(
                    color: AppColors.offWhite,
                    image: DecorationImage(
                        image:
                            ImageUtils.getImage(widget.helpingOption.imageUrl),
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
                  widget.helpingOption.title!,
                  style:
                      const TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
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
