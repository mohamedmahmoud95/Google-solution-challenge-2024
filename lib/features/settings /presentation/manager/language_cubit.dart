import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit() : super(const Locale('en'));

  static LanguageCubit get(context) => BlocProvider.of(context);

  String? selectedLanguage = 'English';

  void toggleLanguage(BuildContext context, String lang) {
    emit(lang == "English"
        ? const Locale('en')
        : lang == "Arabic"
            ? const Locale('ar'):
        lang== "Ukrainian"? const Locale('uk'): const Locale('en'));
    EasyLocalization.of(context)!.setLocale(state);
  }

  onChanged(value) {
    selectedLanguage = value;
  }
}
