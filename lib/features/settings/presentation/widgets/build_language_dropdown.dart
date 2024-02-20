import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/cache_helper.dart';

import '../../../../config/routes.dart';
import '../manager/language_cubit.dart';

class BuildLanguageDropdown extends StatelessWidget {
  const BuildLanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: DropdownButton<String>(
        value: LanguageCubit.get(context).selectedLanguage,
        items: ['English', 'Arabic', 'Ukrainian'].map((String language) {
          return DropdownMenuItem<String>(
            value: language,
            child: Text(
              language,
              style: const TextStyle(fontSize: 18),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          CacheHelper.saveData(key: "lang", value: newValue);
          LanguageCubit.get(context).toggleLanguage(context, newValue!);
          LanguageCubit.get(context).onChanged(newValue);
          Navigator.pushNamed(context, Routes.home);
        },
      ),
    );
  }
}
