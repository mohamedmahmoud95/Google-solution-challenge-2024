import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/articles_details/presentation/pages/articles_details.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/pages/home_screen.dart';
import 'package:google_solution_challenge_2024/features/settings%20/presentation/pages/setting_screen.dart';

class Routes {
  static const String home = "/";
  static const String settings = "settings";
  static const String articlesDetails = "articlesDetails";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case Routes.settings:
        return MaterialPageRoute(builder: (context) =>  const Settings());
      case Routes.articlesDetails:
        return MaterialPageRoute(builder: (context) => const ArticlesScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Center(child: Text("")));
    }
  }
}
