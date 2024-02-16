import 'dart:convert';
import 'package:http/http.dart' as http;
class FaceRecognitionApiUtils {
  
Future<http.Response> uploadRequest (features, imgName) async {
    var url = Uri(path: 'uploadFeatures', host: '10.0.2.2', port: 5050, scheme: 'http');
    Map data = {
      'features': features,
      'id': imgName
    };
    var body = json.encode(data);
    //'content-type': 'multipart/form-data'

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body
    );
    return response;
  }

Future<List<String>> compareRequest (features) async {
  var url = Uri(path: 'compareFeatures', host: '10.0.2.2', port: 5050, scheme: 'http');
  Map data = {
    'features': features
  };
  var body = json.encode(data);
  var response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body
  );
  return json.decode(response.body).cast<String>().toList();
}
}