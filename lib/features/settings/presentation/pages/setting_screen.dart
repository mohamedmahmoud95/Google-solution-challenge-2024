import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../widgets/build_language_dropdown.dart';

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
              const BuildLanguageDropdown(),
            ],
          ),
        ),
      ),
    );
  }
}
