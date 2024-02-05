import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:google_solution_challenge_2024/config/routes.dart';

import '../manager/language_cubit.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

//  String _selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Language'.tr(),
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              buildLanguageDropdown(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildLanguageDropdown(context) {
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
              language.tr(),
              style: const TextStyle(fontSize: 18),
            ),
          );
        }).toList(),
        onChanged: (newValue) {
          LanguageCubit.get(context).toggleLanguage(context, newValue!);
          LanguageCubit.get(context).onChanged(newValue);
          Navigator.pushNamed(context, Routes.home);
        },
      ),
    );
  }
}
