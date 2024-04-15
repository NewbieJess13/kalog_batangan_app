import 'dart:convert';

import 'package:http/http.dart' as http;

class SmsService {
  final String _username = "toni_13";
  final String _password = "Just@Once13";

  final _bulkSmsUrl = "https://api.bulksms.com/v1/messages";

  Future<void> sendSms(
    List<String> contacts,
    String message,
  ) async {
    Map<String, dynamic> postData = {'to': contacts, 'body': message};

    String basicAuth =
        'Basic ${base64Encode(utf8.encode('$_username:$_password'))}';

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': basicAuth,
    };

    try {
      http.Response response = await http.post(
        Uri.parse(_bulkSmsUrl),
        headers: headers,
        body: json.encode(postData),
      );

      print('statusCode: ${response.statusCode}');
      print('Response: ${response.body}');
    } catch (e) {
      print('Error: $e');
    }
  }
}
