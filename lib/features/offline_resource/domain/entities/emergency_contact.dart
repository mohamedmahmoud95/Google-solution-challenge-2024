import 'package:flutter/cupertino.dart';

class EmergencyResponse {
  EmergencyData data;

  EmergencyResponse({required this.data});

  factory EmergencyResponse.fromJson(Map<dynamic?, dynamic?> json) {
    return EmergencyResponse(
      data: EmergencyData.fromJson(json['data']),
    );
  }
}

class EmergencyData {
  Country country;
  EmergencyService ambulance;
  EmergencyService fire;
  EmergencyService police;
  EmergencyService dispatch;

  EmergencyData({
    required this.country,
    required this.ambulance,
    required this.fire,
    required this.police,
    required this.dispatch,
  });

  factory EmergencyData.fromJson(Map<dynamic?, dynamic?> json) {
    return EmergencyData(
      country: Country.fromJson(json['country']) ,
      ambulance: EmergencyService.fromJson(json['ambulance']),
      fire: EmergencyService.fromJson(json['fire']),
      police: EmergencyService.fromJson(json['police']),
      dispatch: EmergencyService.fromJson(json['dispatch'] ),
    );
  }
}

class Country {
  String? name;
  String? ISOCode;

  Country({
    this.name,
    this.ISOCode,
  });

  factory Country.fromJson(Map<dynamic?, dynamic?> json) {
    return Country(
      name: json['name'] ?? "",
      ISOCode: json['ISOCode'] ?? "",
    );
  }
}

class EmergencyService {
  List<String?>? all;
  String? gsm;
  String? fixed;

  EmergencyService({
    this.all,
    this.gsm,
    this.fixed,
  });

  factory EmergencyService.fromJson(Map<String?, dynamic?> json) {
    return EmergencyService(
      all: List<String?>.from(json['all'] ?? []),
      gsm: json['gsm'] ?? 'default_gsm_value',
      fixed: json['fixed'] ?? 'default_fixed_value',
    );
  }

}

