import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';

class AlertDialogWidget extends StatelessWidget {
  final String? title;
  final String contentText;
  final Widget? actionWidget;
  final VoidCallback? onPressed;
  const AlertDialogWidget({super.key, this.title, required this.contentText, this.actionWidget, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.oliveGreen2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        title ?? '',
      ),
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.sp),
        child: Text(
          contentText,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: AppColors.appleWhite,
            height: 1.5,
          ),
        ),
      ),
      actions: [
        actionWidget ??
            Padding(
              padding: EdgeInsets.all(8.0.sp),
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.green1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: onPressed ?? () => Navigator.of(context).pop(),
                child: Text("OK",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(color: AppColors.black0000,)),

              ),
            ),
      ],
    );
  }
}
