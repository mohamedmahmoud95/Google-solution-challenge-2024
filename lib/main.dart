import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_solution_challenge_2024/features/settings%20/presentation/manager/language_cubit.dart';

import 'app.dart';
import 'core/utils/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await CacheHelper.init();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar'), Locale('uk')],

      /// --- file lang path ---- ///
      path: 'assets/translations',
      fallbackLocale: Locale(CacheHelper.getData("lang") == "Arabic"
          ? 'ar'
          : CacheHelper.getData("lang") == "Ukrainian"
              ? 'uk'
              : 'en'),
      child: BlocProvider(
        create: (context) => LanguageCubit(),
        child: const PalestineApp(),
      ),
    ),
  );
}
