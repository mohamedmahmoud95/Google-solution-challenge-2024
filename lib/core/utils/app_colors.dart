import 'package:flutter/material.dart';


/*
Color naming system
- for each color, there might be a list of grades, ex: grey1, grey2, grey3, ... grey(n)
- grey1 is the lightest, grey(n) is the darkest
 */
class AppColors {

  //==========================================================================//
  //Shades of White
  static const Color white = Color.fromARGB(255, 245, 245, 247);
  static const Color appleWhite = Color(0xFFF4F2EC);

  //==========================================================================//



  //==========================================================================//
  //Shades of Black
  static const Color black1 = Color.fromARGB(255, 30, 30, 30);
  static const Color black1AppleBlack1 = Color.fromARGB(255, 22,22,24);
  static const Color black2 = Color(0xFF141414);
  static const Color black0000 = Color.fromARGB(255,0,0,0);
  static const Color navyBlue3 = Color.fromARGB(255,14,18,30);
  //==========================================================================//


  //==========================================================================//
  //Shades of Grey
  static const Color grey0 = Color(0xFFD1D1D1);
  static const Color grey1 = Color.fromARGB(255, 217, 217, 217);
  static const Color grey2 = Color(0xFFB3B3B3);
  static const Color grey2AppleGrey = Color.fromARGB(255, 151,151,151);
  static const Color grey2AppleGrey2 = Color.fromARGB(255, 129,129,129);
  static const Color grey3 = Color.fromARGB(255, 169, 169, 169);
  static const Color grey4 = Color.fromARGB(255, 88, 88, 88);
  static const Color grey5 = Color.fromARGB(255,64,73,80);
  static Color? grey6 = Colors.grey[850];
  static const Color grey7AppleDarkGrey = Color.fromARGB(255,33,33,36);
  static const Color grey8 = Color(0xFF1d1d1f);
  static const Color greyBlue = Color.fromARGB(255,35,45,54);
  //==========================================================================//


  //==========================================================================//
  //Blue to beige palette
  static const Color beige = Color(0xFFE0E1DD);
  static const Color blue1 = Color(0xFF778DA9);
  static const Color blue2 = Color(0xFF415A77);
  static const Color navyBlue1 = Color(0xFF1B263B);
  static const Color navyBlue2 = Color(0xFF0D1B2A);
  //==========================================================================//


  //==========================================================================//
  //Blue to Green palette
  static const Color green1 = Color(0xFFEFF6E0);
  static const Color green2 = Color(0xFFAEC3B0);
  static const Color cadetBlue1 = Color(0xFF598392);
  static const Color cadetBlue2 = Color(0xFF124559);
  static const Color darkBlue1 = Color(0xFF01161E);
  //==========================================================================//



  //==========================================================================//
  //Zaitoon palette
  static Color oliveGreen1 = const Color(0xFFCAD2C5).withOpacity(0.5);
  static const Color oliveGreen2 = Color(0xFF84A98C);
  static const Color oliveGreen3 = Color(0xFF52796F);
  static const Color darkGreen1 = Color(0xFF354F52);
  static const Color darkGreen2 = Color(0xFF2F3E46);
  //==========================================================================//

  //==========================================================================//
  //Apple palette
  static const Color blueApple = Color.fromARGB(255,81,176,215);
  static const Color greenApple = Color.fromARGB(255,78,212,179);
  //==========================================================================//


  //==========================================================================//
  static const Color red = Color.fromARGB(255,210,16,38);
  static const Color green = Color.fromARGB(255,6,120,60);
//==========================================================================//

}
