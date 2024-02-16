import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'core/utils/cache_helper.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      child: const PalestineApp(),
    ),
  );
}
