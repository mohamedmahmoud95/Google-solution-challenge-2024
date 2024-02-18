import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/Authentication/presentation/pages/sign_in_screen.dart';
import 'package:google_solution_challenge_2024/features/articles_details/presentation/pages/articles_details.dart';
import 'package:google_solution_challenge_2024/features/charity/presentation/pages/charity_screen.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/pages/home_screen.dart';
import 'package:google_solution_challenge_2024/features/reels_screen/presentation/pages/tabs/profile_videos_tab.dart';
import 'package:google_solution_challenge_2024/features/settings%20/presentation/pages/setting_screen.dart';
import 'package:google_solution_challenge_2024/features/lost%20and%20found/presentation/pages/lost_and_found_screen.dart';
import 'package:google_solution_challenge_2024/features/mental_health_support/presentation/pages/mental_health_support_screen.dart';

class Routes {
  static const String home = "home";
  static const String settings = "settings";
  static const String articlesDetails = "articlesDetails";
  static const String signIn = "signIn";
  static const String mentalHealthSupport = "mentalHealthSupport";
  static const String lostAndFound = "lostAndFound";
  static const String charity = "/";
  static const String profile = "profile";

}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case Routes.settings:
        return MaterialPageRoute(builder: (context) => const Settings());
      case Routes.profile:
        return MaterialPageRoute(builder: (context) => const ProfileScreen());

      case Routes.articlesDetails:
        return MaterialPageRoute(builder: (context) => const ArticlesScreen());
      case Routes.signIn:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case Routes.mentalHealthSupport:
        return MaterialPageRoute(
            builder: (context) => const MentalHealthSupportScreen());
      case Routes.lostAndFound:
        return MaterialPageRoute(
            builder: (context) => const LostAndFoundScreen());
      case Routes.charity:
        return MaterialPageRoute(builder: (context) => const CharityScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => const Center(child: Text("")));
    }
  }
}
