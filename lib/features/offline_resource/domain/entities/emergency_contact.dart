class EmergencyResponse {
  String error;
  EmergencyData data;

  EmergencyResponse({required this.error, required this.data});

  factory EmergencyResponse.fromJson(Map<String?, dynamic?> json) {
    return EmergencyResponse(
      error: json['error'] ?? "",
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

  factory EmergencyData.fromJson(Map<String?, dynamic?> json) {
    return EmergencyData(
      country: Country.fromJson(json['country']) ,
      ambulance: EmergencyService.fromJson(json['ambulance']),
      fire: EmergencyService.fromJson(json['fire']),
      police: EmergencyService.fromJson(json['police']),
      dispatch: EmergencyService.fromJson(json['dispatch']),
    );
  }
}

class Country {
  String name;
  String ISOCode;
  String ISONumeric;

  Country({
    required this.name,
    required this.ISOCode,
    required this.ISONumeric,
  });

  factory Country.fromJson(Map<String?, dynamic?> json) {
    return Country(
      name: json['name'] ?? "",
      ISOCode: json['ISOCode'] ?? "",
      ISONumeric: json['ISONumeric'] ?? "",
    );
  }
}

class EmergencyService {
  List<String> all;
  String? gsm;
  String? fixed;

  EmergencyService({
    required this.all,
    this.gsm,
    this.fixed,
  });

  factory EmergencyService.fromJson(Map<String?, dynamic?> json) {
    return EmergencyService(
      all: List<String>.from(json['all']) ?? [],
      gsm: json['gsm'] ?? 'gsm',
      fixed: json['fixed']?? 'fixed',
    );
  }
}

