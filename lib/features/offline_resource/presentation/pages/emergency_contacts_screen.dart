import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/presentation/widget/emergency_contacts_widget.dart';

import '../widget/coutry_selection_widget.dart';

class EmergencyContactsScreen extends StatefulWidget {
  const EmergencyContactsScreen({Key? key}) : super(key: key);

  @override
  State<EmergencyContactsScreen> createState() => _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  String? selectedCountryCode;
  final GlobalKey<_EmergencyContactsScreenState> _emergencyContactsKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Emergency contacts".tr())),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CountrySelector(
              onCountrySelected: (code) {
                setState(() {
                  selectedCountryCode = code;
                  _emergencyContactsKey.currentState?.setState(() {

                  });
                });
              },
            ),
            const SizedBox(height: 20),
            selectedCountryCode == null ? const Center(child: Text("Please select a country", style: TextStyle(fontSize: 20),)) :
            EmergencyContactsWidget(key: _emergencyContactsKey, countryCode: selectedCountryCode!),
          ],
        ),
      ),
    );
  }
}
