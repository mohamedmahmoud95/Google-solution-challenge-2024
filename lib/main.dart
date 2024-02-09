import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/config/routes.dart';
import 'package:google_solution_challenge_2024/core/utils/app_themes.dart';

void main() {
  runApp(const PalestineApp());
}

class PalestineApp extends StatefulWidget {
  const PalestineApp({super.key});

  @override
  State<PalestineApp> createState() => _PalestineAppState();
}

class _PalestineAppState extends State<PalestineApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ZaitonLightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: "signUp",
      onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
    );
  }
}
