import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/core/utils/app_colors.dart';
import 'package:google_solution_challenge_2024/core/utils/app_measures.dart';
import 'package:google_solution_challenge_2024/core/utils/screen_utils.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/data/fetch_emergency_data_service.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/emergency_contact.dart';
import '../../dummy_data/dummy_data.dart';

class EmergencyContactsWidget extends StatefulWidget {
  final String countryCode;
  const EmergencyContactsWidget({Key? key, required this.countryCode}) : super(key: key);

  @override
  State<EmergencyContactsWidget> createState() => _EmergencyContactsWidgetState();
}

class _EmergencyContactsWidgetState extends State<EmergencyContactsWidget> {
  late Future<EmergencyData> _emergencyDataFuture;

  @override
  void initState() {
    super.initState();
    _emergencyDataFuture = fetchEmergencyContact(widget.countryCode);
  }

  @override
  void didUpdateWidget(covariant EmergencyContactsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.countryCode != widget.countryCode) {
      // If the country code has changed, fetch data again
      _emergencyDataFuture = fetchEmergencyContact(widget.countryCode);
    }
  }

  Future<EmergencyData> fetchEmergencyContact(String countryCode) async {
    FetchEmergencyNumberService fetchEmergencyNumberService = FetchEmergencyNumberService();
    final data = await fetchEmergencyNumberService.fetchEmergencyNumber(countryCode);

    if (data != null) {
      return data;
    } else {
      return sampleEmergencyData;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<EmergencyData>(
      future: _emergencyDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(color: AppColors.oliveGreen2,),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text('Error: ${snapshot.error}'),
          );
        } else {
          final emergencyContact = snapshot.data!;
          return Container(
            height: ScreenUtils.getScreenHeight(context)/1.5,
            width: ScreenUtils.getScreenHeight(context) - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppMeasures.defaultCircularRadius),
              color: AppColors.offWhite,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  tile('Country:', emergencyContact.country.name.toString()),
                  tile('Ambulance:', emergencyContact.ambulance.all!.first!),
                  tile('Fire-fighting:', emergencyContact.fire.all!.first!),
                  tile('Police:', emergencyContact.police.all!.first!),
                  tile('Dispatch:', emergencyContact.dispatch.all!.first!),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget tile(String title, String info) {
    return Row(
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16, overflow: TextOverflow.ellipsis), maxLines: 2,),
        Text(info, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 16, overflow: TextOverflow.ellipsis), maxLines: 2,),
      ],
    );
  }
}
