import 'package:flutter/cupertino.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/app_images.dart';
import 'package:google_solution_challenge_2024/core/utils/constants.dart';

class AppLogo extends StatelessWidget {
  final bool? showName;
  final bool? showIcon;
  final bool? horizontalView;
  final double? height;
  final double? width;
  const AppLogo(
      {super.key,
      this.showName = false,
      this.showIcon = true,
      this.horizontalView = false,
      this.height = 250,
      this.width = 2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        width: width,
        child: showName == false
            ? SizedBox(
                height: (height! / 4), child: Image.asset(AppImages.logo))
            : horizontalView == true
                ? appIconAndNameInHorizontalView()
                : appIconAndNameInVerticalView());
  }

  Widget appIconAndNameInHorizontalView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: (height! / 3), child: Image.asset(AppImages.logo)),
        const SizedBox(
          width: 10,
        ),
        const Text(
          Constants.appName,
          style: TextStyle(
            color: AppColors.darkGreen2,
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget appIconAndNameInVerticalView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: (height! / 1.5), child: Image.asset(AppImages.logo)),
        const Text(
          Constants.appName,
          style: TextStyle(
              color: AppColors.darkGreen2,
              fontSize: 30,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
