import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'config/routes.dart';
import 'core/utils/app_themes.dart';
import 'features/home/presentation/manager/cubit.dart';
import 'features/settings /presentation/manager/language_cubit.dart';

class PalestineApp extends StatefulWidget {
  const PalestineApp({super.key});

  @override
  State<PalestineApp> createState() => _PalestineAppState();
}

class _PalestineAppState extends State<PalestineApp> {
  @override
  Widget build(BuildContext context) {  
    const ScreenUtilInit(designSize: Size(375, 812),);
        ScreenUtil.init(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageCubit>(create: (_) => LanguageCubit()),
        BlocProvider<HomeCubit>(create: (_) => HomeCubit()),
      ],
      child: MaterialApp(
        /// --- localization ---- ///
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,


        /// --- theme ---///
        theme: ZaitonLightTheme,
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: (settings) => AppRoutes.onGenerate(settings),
      ),
    );
  }
}
