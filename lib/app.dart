import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'config/routes.dart';

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

      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
    );
  }
}
