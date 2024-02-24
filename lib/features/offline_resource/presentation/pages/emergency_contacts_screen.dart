import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/presentation/widget/emergency_contacts_widget.dart';

import '../../data/fetch_emergency_data_service.dart';
import '../../domain/entities/emergency_contact.dart';
import '../../dummy_data/dummy_data.dart';
import '../widget/coutry_selection_widget.dart';

class EmergencyContactsScreen extends StatefulWidget {
  const EmergencyContactsScreen({Key? key}) : super(key: key);

  @override
  State<EmergencyContactsScreen> createState() => _EmergencyContactsScreenState();
}

class _EmergencyContactsScreenState extends State<EmergencyContactsScreen> {
  String? selectedCountryCode;

  Future<EmergencyData> fetchEmergencyContact(String countryCode) async {
    FetchEmergencyNumberService fetchEmergencyNumberService = FetchEmergencyNumberService();
    final data = await fetchEmergencyNumberService.fetchEmergencyNumber(countryCode);

    debugPrint('\n dataaaa: \n\n');
    debugPrint(data.toString());
    debugPrint('\n ======== \n');

    if (data != null)
    {
      return data;
    }
    else
    {
      return sampleEmergencyData;
    }
  }

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
                });
              },
            ),
            const SizedBox(height: 20),

            EmergencyContactsWidget(countryCode: selectedCountryCode?? 'ps'),

          ],
        ),
      ),
    );
  }
}
