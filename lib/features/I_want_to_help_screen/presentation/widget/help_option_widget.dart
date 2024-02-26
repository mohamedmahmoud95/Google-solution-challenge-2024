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
        padding: const EdgeInsets.all(8),
        child: Container(
          height: ScreenUtils.getScreenHeight(context) /  5.5,
          width: ScreenUtils.getScreenWidth(context) - 20,
          decoration: BoxDecoration(
            color: AppColors.offWhite,
            borderRadius:
                BorderRadius.circular(AppMeasures.defaultCircularRadius),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: ScreenUtils.getScreenHeight(context) / 4.5,
                  width: ScreenUtils.getScreenWidth(context) / 2 - 40,
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
                  width: 10,
                ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
                SizedBox(
                    width: ScreenUtils.getScreenWidth(context)/2.2,
                    child: Text(
                  widget.helpingOption.title!,
                  style:
                      const TextStyle(fontSize: 18, overflow: TextOverflow.ellipsis),
                  textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                )),
              const SizedBox(
                height: 10,
              ),
                widget.helpingOption.subtitle == null? const SizedBox() :
                SizedBox(
                    width: ScreenUtils.getScreenWidth(context)/3,
                    height: 60,
                    child: Text(
                      widget.helpingOption.subtitle!,
                      style:
                      const TextStyle(fontSize: 14, overflow: TextOverflow.ellipsis),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    )),
              ],),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
