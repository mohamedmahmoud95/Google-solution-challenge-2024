import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';

import '../../utils/screen_utils.dart';

class RectangularButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String? text;
  final TextStyle? textStyle;
  final Widget? childWidget;
  final Function onTap;
  final double? width;
  const RectangularButton(
      {super.key,
      this.backgroundColor ,
      this.foregroundColor = AppColors.white,
      this.text,
      this.childWidget,
        this.width,
      required this.onTap,
        this.textStyle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: EdgeInsets.all(8),
      child: Container(
        height: 50,
        width: width??ScreenUtils.getScreenWidth(context) / 1.35,
        decoration: BoxDecoration(
          color: backgroundColor??Theme.of(context).primaryColorLight,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Center(
          child: text != null? Text(
            text!,
            style: textStyle??TextStyle(
                fontSize: 20,
                color: foregroundColor,
                fontWeight: FontWeight.w500),
          ): const SizedBox(),
        ),
      ),
      ),
    );
  }
}
