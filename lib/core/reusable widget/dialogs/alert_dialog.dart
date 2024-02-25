import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';

class AlertDialogWidget extends StatelessWidget {
  final String? title;
  final String contentText;
  final Widget? actionWidget;
  final VoidCallback? onPressed;
  const AlertDialogWidget(
      {super.key,
      this.title,
      required this.contentText,
      this.actionWidget,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.oliveGreen3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: Text(
        title ?? '',
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: AppColors.appleWhite, fontSize: 20),
      ),
      content: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.sp),
        child: Text(
          contentText,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: AppColors.appleWhite,
                fontSize: 15,
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
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.black0000,
                        )),
              ),
            ),
      ],
    );
  }
}

showLoadingDialog(context, loadingText){
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;
      return PopScope(
        canPop: false,
        child: Center(
          child: Container(
            width: screenWidth*0.85,
            height: screenHeight*0.5,
            decoration: const BoxDecoration(
              color: AppColors.grey1,
              borderRadius: BorderRadius.all(Radius.circular(50))
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(loadingText, style: TextStyle(color: Colors.black, fontSize: 32, fontFamily: GoogleFonts.openSans().fontFamily, fontWeight: FontWeight.bold, decoration: TextDecoration.none)),
                  Text('', style: TextStyle(color: Colors.black, fontSize: 32, fontFamily: GoogleFonts.openSans().fontFamily, fontWeight: FontWeight.bold, decoration: TextDecoration.none)),
                  SizedBox(height: screenHeight*0.04,),
                  SizedBox(
                    height: screenHeight*0.1,
                    width: screenHeight*0.1,
                    child: CircularProgressIndicator(
                      strokeWidth: screenWidth * 0.02,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  );
}

showErrorDialog(context, errorText, fontSize){
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      double screenWidth = MediaQuery.of(context).size.width;
      double screenHeight = MediaQuery.of(context).size.height;
      return Center(
        child: Container(
          width: screenWidth*0.85,
          height: screenHeight*0.4,
          decoration: const BoxDecoration(
            color: AppColors.grey1,
            image: DecorationImage(
              image: AssetImage('Assets/Images/BackGroundPattern.png'),
              repeat: ImageRepeat.repeat
            ),
            borderRadius: BorderRadius.all(Radius.circular(50))
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(errorText, textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontSize: fontSize, fontFamily: GoogleFonts.openSans().fontFamily, fontWeight: FontWeight.bold, decoration: TextDecoration.none)),
                Text('', style: TextStyle(color: Colors.black, fontSize: 32, fontFamily: GoogleFonts.openSans().fontFamily, fontWeight: FontWeight.bold, decoration: TextDecoration.none)),
                SizedBox(height: screenHeight*0.01,),
                SizedBox(
                  height: screenHeight*0.1,
                  width: screenHeight*0.1,
                  child: Icon(
                    Icons.error_rounded,
                    size: screenWidth * 0.2,
                    color: Colors.red.shade700,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  );
}