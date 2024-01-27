import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/home/presentation/pages/home_screen.dart';

class Routes {
  static const String home = "/";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => const Center(child: Text("")));
    }
  }
}
