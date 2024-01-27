import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/config/routes.dart';

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
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
    );
  }
}
