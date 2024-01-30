import 'package:flutter/cupertino.dart';

class ScreenUtils {
  static double getScreenWidth(BuildContext context)
  {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context)
  {
    return MediaQuery.of(context).size.height;
  }

  static const double iPadScreenWidth =
  500; //To be used for responsive design (i.e: when to use large font sizes)

  static bool isUsingIpad(BuildContext context){
    return getScreenWidth(context) >= iPadScreenWidth;
  }

}