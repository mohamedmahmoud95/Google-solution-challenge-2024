import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/Sign%20Up/presentation/pages/sign_up_screen.dart';
import 'package:google_solution_challenge_2024/features/articles_details/presentation/pages/articles_details.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/pages/home_screen.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/presentation/pages/lost_and_found_screen.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/pages/mental_health_support_screen.dart';

import '../features/Sign In/presentation/pages/sign_in_screen.dart';

class Routes {
  static const String home = "/";
  static const String articlesDetails = "articlesDetails";
  static const String signIn = "signIn";
  static const String signUp = "signUp";
  static const String mentalHealthSupport = "mentalHealthSupport";
  static const String lostAndFound = "lostAndFound";

}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.articlesDetails:
        return MaterialPageRoute(builder: (context) => const ArticlesScreen());
      case Routes.signIn:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case Routes.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case Routes.mentalHealthSupport:
        return MaterialPageRoute(
            builder: (context) => const MentalHealthSupportScreen());
      case Routes.lostAndFound:
        return MaterialPageRoute(
            builder: (context) => const LostAndFoundScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => const Center(child: Text("")));
    }
  }
}
