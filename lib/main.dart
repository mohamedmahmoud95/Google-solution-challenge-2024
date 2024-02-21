import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:google_solution_challenge_2024/features/amr_charity/domain/repo/charity_institute_firebase_repo.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/data/hive_db.dart';
import 'app.dart';
import 'core/utils/cache_helper.dart';
import 'core/utils/store_dummy_data.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await HiveDB.initHiveDB();

  // OfflineResourcesFirebaseRepo repo = OfflineResourcesFirebaseRepo();
  // StoreDummyData.generateCharityInstitutes();

  // repo.getAllOfflineResourcesFromFirebase().then((value) {
  // }).onError((error, stackTrace) {
  //   print(error);
  // });

  // // Pass all uncaught "fatal" errors from the framework to Crashlytics

  // CharityInstituteFirebaseRepo charityInstituteFirebaseRepo =
  //     CharityInstituteFirebaseRepo();
  // var data = await charityInstituteFirebaseRepo.getAllCharityInsitutes();
  // print(data);

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  FlutterError.onError = (errorDetails) {
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

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
