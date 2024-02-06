import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_solution_challenge_2024/features/settings%20/presentation/manager/language_cubit.dart';
import 'package:google_solution_challenge_2024/config/routes.dart';
import 'package:google_solution_challenge_2024/core/utils/app_themes.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar'), Locale('uk')],

      /// --- file lang path ---- ///
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: BlocProvider(
        create: (context) => LanguageCubit(),
        child: const PalestineApp(),
      ),
    ),
  );
// =======
// class _PalestineAppState extends State<PalestineApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ZaitonLightTheme,
//       debugShowCheckedModeBanner: false,
//       initialRoute: "/",
//       onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
//     );
//   } >>>>>>> main
}
