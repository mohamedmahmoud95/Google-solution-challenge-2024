import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_solution_challenge_2024/features/offline_resource/domain/entities/emergency_contact.dart';

class FetchEmergencyNumberService {
  static const String baseUrl = 'https://emergencynumberapi.com/api/country/';

  Future<EmergencyData?> fetchEmergencyNumber(String countryCode) async {
    try {
      final response = await Dio().get('$baseUrl$countryCode');
      debugPrint('Response data: $response');
      if (response.statusCode == 200) {
        debugPrint("\n200\n");
        if (response.data != null && response.data is Map<String?, dynamic?>) {
          debugPrint("\ndata not null");
          return EmergencyData.fromJson(response.data);
        } else {
          debugPrint('Failed to fetch emergency numbers: Response data is null or not a Map<String, dynamic>');
          return null;
        }
      } else {
        debugPrint('Failed to fetch emergency numbers: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      debugPrint('Failed to fetch emergency numbers: $e');
      return null;
    }
  }
}
