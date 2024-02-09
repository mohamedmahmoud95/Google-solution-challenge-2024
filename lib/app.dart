import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'config/routes.dart';
import 'core/utils/app_themes.dart';

class PalestineApp extends StatefulWidget {
  const PalestineApp({super.key});

  @override
  State<PalestineApp> createState() => _PalestineAppState();
}

class _PalestineAppState extends State<PalestineApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /// --- localization ---- ///
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      /// --- theme ---///
      theme: ZaitonLightTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
    );
  }
}
