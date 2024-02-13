import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/articles_details/presentation/pages/articles_details.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/pages/home_screen.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/pages/mental_health_support_screen.dart';
import '../features/landing_screen/presentation/pages/landing_screen.dart';
import '../features/lost_and_found/presentation/pages/lost_and_found_screen.dart';
import '../features/settings/presentation/pages/setting_screen.dart';
import '../features/sign_in/presentation/pages/sign_in_screen.dart';
import '../features/sign_up/presentation/pages/sign_up_screen.dart';


class Routes {
  static const String landing = "/";
  static const String home = "home";
  static const String settings = "settings";
  static const String articlesDetails = "articlesDetails";
  static const String signIn = "signIn";
  static const String signUp = "signUp";
  static const String mentalHealthSupport = "mentalHealthSupport";
  static const String lostAndFound = "lostAndFound";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.landing:
        return MaterialPageRoute(builder: (context) => const LandingScreen());

      case Routes.signIn:
        return MaterialPageRoute(builder: (context) => const SignInScreen());

      case Routes.signUp:
        return MaterialPageRoute(builder: (context) => const SignUpScreen());

      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case Routes.settings:
        return MaterialPageRoute(builder: (context) =>  const Settings());
    
      case Routes.articlesDetails:
        return MaterialPageRoute(builder: (context) => const ArticlesScreen());

      case Routes.mentalHealthSupport:
        return MaterialPageRoute(
            builder: (context) => const MentalHealthSupportScreen());

      case Routes.lostAndFound:
        return MaterialPageRoute(
            builder: (context) => const LostAndFoundScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => const Center(child: Text("Please close the app and re-open it")));
    }
  }
}
