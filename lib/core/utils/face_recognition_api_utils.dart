import 'dart:convert';
import 'package:google_solution_challenge_2024/core/api/end_points.dart';
import 'package:http/http.dart' as http;
class FaceRecognitionApiUtils {
  
Future<http.Response> uploadRequest (features, imgName) async {
    var url = Uri(path: 'uploadFeatures', host: EndPoints.api, scheme: 'http');
    Map data = {
      'features': features,
      'id': imgName
    };
    var body = json.encode(data);
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    return response;
  }

Future<List<String>> compareRequest (features) async {
  var url = Uri(path: 'compareFeatures', host: EndPoints.api, scheme: 'http');
  print(url);
  Map data = {
    'features': features
  };
  var body = json.encode(data);
  var response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body
  );
  print(response.statusCode);
  print('7amada hena: ${response.body}');
  return json.decode(response.body).cast<String>().toList();
}
}