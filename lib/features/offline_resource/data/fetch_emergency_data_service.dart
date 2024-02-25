import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/emergency_contact.dart';

class FetchEmergencyNumberService {
  static const String baseUrl = 'https://emergencynumberapi.com/api/country/';

  Future<EmergencyData?> fetchEmergencyNumber(String countryCode) async {
    try {
      final response = await Dio().get('$baseUrl$countryCode');

      if (response.statusCode == 200) {
        if (response.data != null) {
          final data = response.data['data'] as Map<String, dynamic>;

          final countryData = data['country'] as Map<String, dynamic>;

          final String countryName = countryData['name'] as String;

          final String countryCode = countryData['ISOCode'] as String;

          final fireData = data['fire'] as Map<String, dynamic>;

          final List<String> fireNumbers = (fireData['all'] as List<dynamic>).map((e) => e as String).toList();

          final policeData = data['police'] as Map<String, dynamic>;

          final List<String> policeNumbers = (policeData['all'] as List<dynamic>).map((e) => e as String).toList();

          final ambulanceData = data['ambulance'] as Map<String, dynamic>;

          final List<String> ambulanceNumbers = (ambulanceData['all'] as List<dynamic>).map((e) => e as String).toList();

          return EmergencyData.fromJson(data);
        } else {
          debugPrint('Failed to fetch emergency numbers: Response data is null');
          return null;
        }
      } else {
        debugPrint('Failed to fetch emergency numbers: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Failed to fetch emergency numbers : $e');
      return null;
    }
  }
}